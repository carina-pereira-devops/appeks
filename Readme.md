# Laboratório - Aplicação

O mesmo consiste em uma aplicação em Python, com dois endpoints, nas respectivas portas:

1 - Porta 8000/tcp

Aplicação que recebe comentários em texto. Como a mesma não está disponibilizada através de um frontend as requisições serão feitas diretamente a API.

Exemplos de uso:

```
# matéria 1
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"first post!","content_id":1}'
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"ok, now I am gonna say something more useful","content_id":1}'
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I agree","content_id":1}'

# matéria 2
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I guess this is a good thing","content_id":2}'
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"charlie@example.com","comment":"Indeed, dear Bob, I believe so as well","content_id":2}'
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"eve@example.com","comment":"Nah, you both are wrong","content_id":2}'

# listagem matéria 1
curl -sv localhost:8000/api/comment/list/1

# listagem matéria 2
curl -sv localhost:8000/api/comment/list/2
```

Dados coletados durante o Laboratório:

```
[carina@fedora ekspp]$ curl -sv a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"first post!","content_id":1}'
* Host a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000 was resolved.
* IPv6: (none)
* IPv4: 34.192.6.19, 35.168.80.67
*   Trying 34.192.6.19:8000...
* Connected to a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com (34.192.6.19) port 8000
> POST /api/comment/new HTTP/1.1
> Host: a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000
> User-Agent: curl/8.6.0
> Accept: */*
> Content-Type: application/json
> Content-Length: 68
> 
* Empty reply from server
* Closing connection

[carina@fedora ekspp]$ curl -sv a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"ok, now I am gonna say something more useful","content_id":1}'
* Host a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000 was resolved.
* IPv6: (none)
* IPv4: 34.192.6.19, 35.168.80.67
*   Trying 34.192.6.19:8000...
* Connected to a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com (34.192.6.19) port 8000
> POST /api/comment/new HTTP/1.1
> Host: a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000
> User-Agent: curl/8.6.0
> Accept: */*
> Content-Type: application/json
> Content-Length: 101
> 
* Empty reply from server
* Closing connection

[carina@fedora ekspp]$ curl -sv a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I agree","content_id":1}'
* Host a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000 was resolved.
* IPv6: (none)
* IPv4: 34.192.6.19, 35.168.80.67
*   Trying 34.192.6.19:8000...
* Connected to a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com (34.192.6.19) port 8000
> POST /api/comment/new HTTP/1.1
> Host: a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000
> User-Agent: curl/8.6.0
> Accept: */*
> Content-Type: application/json
> Content-Length: 62
> 
* Empty reply from server
* Closing connection

[carina@fedora ekspp]$ curl -sv a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I guess this is a good thing","content_id":2}'
* Host a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000 was resolved.
* IPv6: (none)
* IPv4: 34.192.6.19, 35.168.80.67
*   Trying 34.192.6.19:8000...
* Connected to a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com (34.192.6.19) port 8000
> POST /api/comment/new HTTP/1.1
> Host: a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000
> User-Agent: curl/8.6.0
> Accept: */*
> Content-Type: application/json
> Content-Length: 83
> 
* Empty reply from server
* Closing connection

[carina@fedora ekspp]$ curl -sv a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"charlie@example.com","comment":"Indeed, dear Bob, I believe so as well","content_id":2}'
* Host a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000 was resolved.
* IPv6: (none)
* IPv4: 34.192.6.19, 35.168.80.67
*   Trying 34.192.6.19:8000...
* Connected to a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com (34.192.6.19) port 8000
> POST /api/comment/new HTTP/1.1
> Host: a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000
> User-Agent: curl/8.6.0
> Accept: */*
> Content-Type: application/json
> Content-Length: 97
> 
* Empty reply from server
* Closing connection

[carina@fedora ekspp]$ curl -sv a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"eve@example.com","comment":"Nah, you both are wrong","content_id":2}'
* Host a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000 was resolved.
* IPv6: (none)
* IPv4: 34.192.6.19, 35.168.80.67
*   Trying 34.192.6.19:8000...
* Connected to a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com (34.192.6.19) port 8000
> POST /api/comment/new HTTP/1.1
> Host: a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000
> User-Agent: curl/8.6.0
> Accept: */*
> Content-Type: application/json
> Content-Length: 78
> 
* Empty reply from server
* Closing connection

[carina@fedora ekspp]$ curl -sv a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000/api/comment/list/1
* Host a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000 was resolved.
* IPv6: (none)
* IPv4: 34.192.6.19, 35.168.80.67
*   Trying 34.192.6.19:8000...
* Connected to a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com (34.192.6.19) port 8000
> GET /api/comment/list/1 HTTP/1.1
> Host: a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000
> User-Agent: curl/8.6.0
> Accept: */*
> 
* Empty reply from server
* Closing connection

[carina@fedora ekspp]$ curl -sv a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000/api/comment/list/2
* Host a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000 was resolved.
* IPv6: (none)
* IPv4: 34.192.6.19, 35.168.80.67
*   Trying 34.192.6.19:8000...
* Connected to a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com (34.192.6.19) port 8000
> GET /api/comment/list/2 HTTP/1.1
> Host: a814ceeca59784f9ca861a8bb40339fb-2090287217.us-east-1.elb.amazonaws.com:8000
> User-Agent: curl/8.6.0
> Accept: */*
> 
* Empty reply from server
* Closing connection
```

2 - Porta 7000/tcp

Aplicação envia métricas através do coletor do Prometheus.

Exemplos de uso:

```
curl -v http://localhost:7000/metrics
```

Dados coletados durante o Laboratório:

```
*   Trying ::1:7000...
* TCP_NODELAY set
* connect to ::1 port 7000 failed: Connection refused
*   Trying 127.0.0.1:7000...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 7000 (#0)
> GET /metrics HTTP/1.1
> Host: localhost:7000
> User-Agent: curl/7.68.0
> Accept: */*
> 
* Mark bundle as not supporting multiuse
* HTTP 1.0, assume close after body
< HTTP/1.0 200 OK
< Date: Mon, 30 Jun 2025 01:41:21 GMT
< Server: WSGIServer/0.2 CPython/3.8.10
< Content-Type: text/plain; version=0.0.4; charset=utf-8
< Content-Length: 2148
< 
# HELP python_gc_objects_collected_total Objects collected during gc
# TYPE python_gc_objects_collected_total counter
python_gc_objects_collected_total{generation="0"} 289.0
python_gc_objects_collected_total{generation="1"} 107.0
python_gc_objects_collected_total{generation="2"} 0.0
# HELP python_gc_objects_uncollectable_total Uncollectable objects found during GC
# TYPE python_gc_objects_uncollectable_total counter
python_gc_objects_uncollectable_total{generation="0"} 0.0
python_gc_objects_uncollectable_total{generation="1"} 0.0
python_gc_objects_uncollectable_total{generation="2"} 0.0
# HELP python_gc_collections_total Number of times this generation was collected
# TYPE python_gc_collections_total counter
python_gc_collections_total{generation="0"} 64.0
python_gc_collections_total{generation="1"} 5.0
python_gc_collections_total{generation="2"} 0.0
# HELP python_info Python platform information
# TYPE python_info gauge
python_info{implementation="CPython",major="3",minor="8",patchlevel="10",version="3.8.10"} 1.0
# HELP process_virtual_memory_bytes Virtual memory size in bytes.
# TYPE process_virtual_memory_bytes gauge
process_virtual_memory_bytes 1.88637184e+08
# HELP process_resident_memory_bytes Resident memory size in bytes.
# TYPE process_resident_memory_bytes gauge
process_resident_memory_bytes 2.65216e+07
# HELP process_start_time_seconds Start time of the process since unix epoch in seconds.
# TYPE process_start_time_seconds gauge
process_start_time_seconds 1.75124752607e+09
# HELP process_cpu_seconds_total Total user and system CPU time spent in seconds.
# TYPE process_cpu_seconds_total counter
process_cpu_seconds_total 0.2
# HELP process_open_fds Number of open file descriptors.
# TYPE process_open_fds gauge
process_open_fds 6.0
# HELP process_max_fds Maximum number of open file descriptors.
# TYPE process_max_fds gauge
process_max_fds 65536.0
# HELP app_requests_total Total de requisições processadas
# TYPE app_requests_total counter
app_requests_total 320.0
# HELP app_requests_created Total de requisições processadas
# TYPE app_requests_created gauge
app_requests_created 1.7512475265861325e+09
* Closing connection 0
```

# Laboratório - CI_CD via Github Actions

O código da aplicação, bem como as instruções são abstraídos em um Dockerfile:

```
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python3.9 python3.9-dev pip

# Configurando diretório atual para o diretório /app a ser executado no container
COPY ./app /app

# Instalando dependências
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Expondo porta da aplicação
EXPOSE 8000

# Comando de Inicialização
WORKDIR /app
CMD cd /app;  python3 api.py 
```

Através da pipeline previamente configurada, disponibilizada no diretório padrão do Git .github/workflows, será criada uma imagem a ser armazanada em um repositório no ECR na AWS.

# Laboratório - Infra na AWS criada via Terraform

Eis a estrutura dos diretórios de acordo com este repositório, onde os recursos serão modularizados.

```
iac_eks/
├── destroy_config.json
├── locals.tf
├── modules
│   ├── argo
│   │   └── main.tf
│   ├── aws-load-balancer-controller
│   │   ├── data.tf
│   │   ├── helm.tf
│   │   ├── iam_policy.json
│   │   ├── iam.tf
│   │   ├── locals.tf
│   │   ├── policy.tf
│   │   ├── serviceaccount.tf
│   │   └── variables.tf
│   ├── cluster
│   │   ├── cluster.tf
│   │   ├── iam.tf
│   │   ├── oidc.tf
│   │   ├── outputs.tf
│   │   ├── sg-rule.tf
│   │   └── variables.tf
│   ├── managed-node-group
│   │   ├── eks.tf
│   │   ├── iam.tf
│   │   └── variables.tf
│   ├── network
│   │   ├── igw.tf
│   │   ├── ngw.tf
│   │   ├── output.tf
│   │   ├── private.tf
│   │   ├── public.tf
│   │   ├── region.tf
│   │   ├── variables.tf
│   │   └── vpc.tf
│   └── waf
│       └── main.tf
├── modules.tf
├── provider.tf
├── terraform.tfvars
└── variables.tf
```

# Laboratório - Implementações

A imagem construída na etapa de CICD, será deploiada em um cluster EKS, no qual também terá as seguintes implementações:

    prints/4.png

1 - ArgoCD, tendo o Git como única fonte de verdade. Esta implementação é feita via Helm juntamente com o Terraform, sendo apenas a customização do recurso (argo.yaml) sendo feita manualmente. No mesmo diretório, teremos o artefato para a implementação da aplicação explanada na primeira etapa.

```
[carina@fedora ekspp]$ tree app_values/
app_values/
├── app.yaml
└── argo.yaml
```

Abaixo o exemplo de sincronismo entre o Argo e o Git, durante o deploy de uma nova versão da aplicação:

    prints/4.png

2 - A implementação do Prometheus Server que será feita via Helm manualmente.

3 - A implementação do Grafana que será feita via Helm manualmente.

    prints/8.png

# Validações:

ALB Controller é uma implementação via Helm que gerencia os ALBs.

    Semelhante ao Protocolo Arp que atua na camada 2,5 traduzindo Ip para MAC.

    Quando um service do tipo LoadBalancer do Kubernetes expoẽ uma aplicação, automaticamente um LB é criado, e quando finaliza o LB é encerrado.

    prints/1.png

Detalhe sobe instância t3.medium (padrão na subida do cluster):

    prints/3.png

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

    prints/7.png

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

1 - Quais boas práticas para o Código IaC:

    Implementações via Terraform

    Implementações via Helm

    Implementações via artefatos

    Implementações via Ansible

2 - Como instalar crd, como exemplo networking.k8s.io/v1?

# Melhorias futuras:

1 - Autenticação via Role, mesmo para IaC via Github Actions.

Saída na tentativa da conexão com o cluster criado recentemente via CiCd:

```
"Unhandled Error" err="couldn't get current server API group list: the server has asked for the client to provide credentials"
```

Autenticação via Role, com acesso aos Workloads do Cluster, mesmo com criação via Github Actions.

Detalhe das configurações de acesso ao EKS:

    prints/6.png

2 - Traefik como ingress do kubernetes, instanciando apenas um LB, configurando as rotas para as demais requisições.

    prints/2.png

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

3 - Monitoramento Opentelemetry:

Web store: http://localhost:8080/

Grafana: http://localhost:8080/grafana/

Load Generator UI: http://localhost:8080/loadgen/

Jaeger UI: http://localhost:8080/jaeger/ui/

Flagd configurator UI: http://localhost:8080/feature

# Referências utilizadas na construção deste Laboratório:
Terraform para AWS, Mateus Muller (Udemy)

https://spacelift.io/blog/argocd-terraform

https://medium.com/@habbema/monitorando-aplica%C3%A7%C3%B5es-python-com-prometheus-e-grafana-020a69ffafa8

https://medium.com/@abubakr.sadiq/integrating-prometheus-and-grafana-with-a-running-eks-cluster-a-step-by-step-guide-98a0d094fd85