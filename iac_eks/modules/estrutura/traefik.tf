resource "helm_release" "traefik" {
  name             = "traefik"
  namespace        = "traefik"
  repository       = "https://traefik.github.io/charts"
  chart            = "traefik"
  create_namespace = true

 set {
   name  = "server.service.type"
   value = "LoadBalancer"
 }

 set {
   name  = "server.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
   value = "alb"
 }

}

 data "kubernetes_service" "traefik_server" {
 metadata {
   name      = "traefik-server"
   namespace = helm_release.traefik.namespace
 }
 }


