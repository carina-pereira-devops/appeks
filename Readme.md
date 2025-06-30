# Sugestões:
Traefik como ingress do kubernetes, instanciando apenas um LB, configurando as rotas para as demais requisições.
    ./prints/2.png
Exemplo de configuração manual:

Criação manual do recurso, uma vez que o CRD não está implementando no Cluster:
```
kubectl -n prometheus create ingress prometheus --rule="/prometheus=prometheus-service:9090"
```
Anotação para que o recurso seja utilizado:
```
kubectl -n prometheus annotate ingress prometheus kubernetes.io/ingress.class=traefik
```
Obs.: Embora tenha sido sugerida esta implementação, devido ao tempo disponibilizado, todos os serviços foram expostos através do ALB Controller.

# Validações:
ALB Controller é uma implementação via Helm que gerencia os ALBs.
    Semelhante ao Protocolo Arp que atua na camada 2,5 traduzindo Ip para MAC.
    Quando um service do tipo LoadBalancer do Kubernetes expoẽ uma aplicação, automaticamente um LB é criado, e quando finaliza o LB é encerrado.
    ./prints/1.png

Detalhe sobe instância t3.medium (padrão na subida do cluster):
    ./prints/3.png

Foram coletadas métricas durante os testes, para justificativa de aumento ou redução dos recursos`

Pods:
```
NAMESPACE     NAME                                                 CPU(cores)   MEMORY(bytes)   
app           grafana-577575669d-rzcgr                             3m           77Mi            
app           prometheus-kube-state-metrics-57d654d7bf-mv5l2       2m           15Mi            
app           prometheus-prometheus-node-exporter-5kxhv            1m           3Mi             
app           prometheus-prometheus-node-exporter-cj9m5            1m           3Mi             
app           prometheus-prometheus-node-exporter-vkw9z            1m           3Mi             
app           prometheus-prometheus-node-exporter-w6q5m            1m           3Mi             
app           prometheus-prometheus-pushgateway-784c485d55-vrmsk   1m           6Mi             
argocd        argocd-application-controller-0                      1m           25Mi            
argocd        argocd-applicationset-controller-696b6668f-n4rfm     1m           21Mi            
argocd        argocd-dex-server-c68dfbb6-qlwfg                     1m           19Mi            
argocd        argocd-notifications-controller-f55767bc9-hglt9      1m           18Mi            
argocd        argocd-redis-6465fc4f75-vp5b5                        2m           2Mi             
argocd        argocd-repo-server-5c5cb94ff8-kshqs                  1m           21Mi            
argocd        argocd-server-5c976fcf44-qpjnd                       2m           25Mi            
kube-system   aws-load-balancer-controller-78f7564788-4gqsw        2m           21Mi            
kube-system   aws-load-balancer-controller-78f7564788-sw45v        1m           19Mi            
kube-system   aws-node-4kqlh                                       3m           54Mi            
kube-system   aws-node-klhwc                                       3m           57Mi            
kube-system   aws-node-p5fql                                       3m           54Mi            
kube-system   aws-node-zq9x9                                       3m           55Mi            
kube-system   coredns-5d849c4789-dr8j8                             2m           13Mi            
kube-system   coredns-5d849c4789-p9zpw                             2m           13Mi            
kube-system   kube-proxy-5mhvx                                     2m           12Mi            
kube-system   kube-proxy-5zq8j                                     1m           12Mi            
kube-system   kube-proxy-nztmq                                     2m           12Mi            
kube-system   kube-proxy-t9g9x                                     2m           12Mi            
kube-system   metrics-server-db4f45b97-smg9w                       6m           16Mi            
```

Nodes:
```
NAME                         CPU(cores)   CPU(%)   MEMORY(bytes)   MEMORY(%)   
ip-10-0-3-14.ec2.internal    21m          1%       490Mi           14%         
ip-10-0-3-157.ec2.internal   30m          1%       576Mi           17%         
ip-10-0-4-130.ec2.internal   25m          1%       497Mi           15%         
ip-10-0-4-95.ec2.internal    34m          1%       458Mi           13%         
```

# Situações que impactaram no tempo da entrega:
1 - Implementações via Helm, conflito de versões das implementações dos Charts via IaC Terraform.
    Implementação do Prometheus, necessita de storage de persistência, exemplo de saída de acordo com os Eventos do Cluster:
```
3m4s        Normal    FailedBinding             persistentvolumeclaim/prometheus-server                   no persistent volumes available for this claim and no storage class is set
9m10s       Normal    EnsuringLoadBalancer      service/prometheus-server                                 Ensuring load balancer
9m9s        Warning   UnAvailableLoadBalancer   service/prometheus-server                                 There are no available nodes for LoadBalancer
9m9s        Normal    ScalingReplicaSet         deployment/prometheus-server                              Scaled up replica set prometheus-server-b48bbcb5c from 0 to 1
9m8s        Normal    EnsuredLoadBalancer       service/prometheus-server                                 Ensured load balancer
8m13s       Normal    UpdatedLoadBalancer       service/prometheus-server                                 Updated load balancer with new hosts
3m4s        Normal    FailedBinding             persistentvolumeclaim/storage-prometheus-alertmanager-0   no persistent volumes available for this claim and no storage class is set
```

Na descrição do service via Helm, essas eram as classes configuradas:
```
kubectl describe pvc prometheus-server
               volume.beta.kubernetes.io/storage-provisioner: ebs.csi.eks.amazonaws.com
               volume.kubernetes.io/selected-node: ip-10-0-3-99.ec2.internal
               volume.kubernetes.io/storage-provisioner: ebs.csi.eks.amazonaws.com
```
Obs.: Lembrando que em uma implementação de volumes no kubernetes, primeiramente definimo a StorageClass (sc), na sequência o PersistentVolume (pv), e finalmente o PersistentVolumeClaim (pvc).

2 - Implementações via artefatos do Kubernetes (yaml), falta de implementações CRD no cluster EKS.
Saídas das implementações:
```
no matches for kind "Ingress"            in version "extensions/v1beta1"                ensure CRDs are installed first
no matches for kind "ClusterRole"        in version "rbac.authorization.k8s.io/v1beta1" ensure CRDs are installed first
no matches for kind "ClusterRoleBinding" in version "rbac.authorization.k8s.io/v1beta1" ensure CRDs are installed first
```

Listando CRDs disponíveis:
```
kubectl get crd
NAME                                         CREATED AT
cninodes.vpcresources.k8s.aws                2025-06-28T21:38:03Z
eniconfigs.crd.k8s.amazonaws.com             2025-06-28T21:39:50Z
ingressclassparams.elbv2.k8s.aws             2025-06-28T21:42:37Z
policyendpoints.networking.k8s.aws           2025-06-28T21:38:03Z
securitygrouppolicies.vpcresources.k8s.aws   2025-06-28T21:38:03Z
targetgroupbindings.elbv2.k8s.aws            2025-06-28T21:42:37Z
```

# Questionamentos:
Quais boas práticas para o Código IaC:
    Implementações via Terraform
    Implementações via Helm
    Implementações via artefatos
    Implementações via Ansible

Como instalar crd, como exemplo networking.k8s.io/v1?

# Melhorias futuras:
Autenticação via Role, mesmo para IaC via Github Actions.
Saída na tentativa da conexão com o cluster criado recentemente via CiCd:
"Unhandled Error" err="couldn't get current server API group list: the server has asked for the client to provide credentials"

Autenticação via Role, com acesso aos Workloads do Cluster, mesmo com criação via Github Actions.

Monitoramento Opentelemetry:
Web store: http://localhost:8080/
Grafana: http://localhost:8080/grafana/
Load Generator UI: http://localhost:8080/loadgen/
Jaeger UI: http://localhost:8080/jaeger/ui/
Flagd configurator UI: http://localhost:8080/feature

# Referências utilizadas para a construção deste Laboratório:
Terraform para AWS, Mateus Muller (Udemy)
https://spacelift.io/blog/argocd-terraform
https://medium.com/@habbema/monitorando-aplica%C3%A7%C3%B5es-python-com-prometheus-e-grafana-020a69ffafa8
https://medium.com/@abubakr.sadiq/integrating-prometheus-and-grafana-with-a-running-eks-cluster-a-step-by-step-guide-98a0d094fd85