resource "helm_release" "grafana" {
 name       = "grafana"
 repository = "https://grafana.github.io/helm-charts"
 chart      = "grafana"
 namespace  = "app"

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


data "kubernetes_service" "grafana" {
 metadata {
   name      = "grafana"
   namespace = helm_release.grafana.namespace
 }
}