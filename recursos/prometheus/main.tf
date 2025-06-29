resource "helm_release" "prometheus" {
 name       = "prometheus"
 repository = "https://prometheus-community.github.io/helm-charts"
 chart      = "prometheus"
 namespace = "app"
 
 set {
   name  = "server.service.type"
   value = "LoadBalancer"
 }
  wait = true
  dependency_update = true

 set {
   name  = "server.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
   value = "nlb"
 }
}


data "kubernetes_service" "prometheus" {
 metadata {
   name      = "prometheus"
   namespace = helm_release.prometheus.namespace
 }
}