resource "helm_release" "prometheus" {
 name       = "prometheus"
 repository = "https://prometheus-community.github.io/helm-charts"
 chart      = "prometheus"

 namespace = "app"

 create_namespace = true

 set {
   name  = "server.service.type"
   value = "LoadBalancer"
 }

 set {
   name  = "server.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
   value = "nlb"
 }
}


data "kubernetes_service" "prometheus_server" {
 metadata {
   name      = "prometheus-server"
   namespace = helm_release.app.namespace
 }
}