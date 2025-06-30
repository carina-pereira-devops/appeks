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