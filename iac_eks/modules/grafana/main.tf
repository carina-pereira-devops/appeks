resource "helm_release" "grafana" {
 name       = "grafana"
 repository = "https://grafana.github.io/helm-charts"
 chart      = "grafana"
 namespace  = "grafana"
 create_namespace = true

   set {
    name  = "adminPassword"
    value = "prom-operator"
  }

  values = [
    file("${path.module}/grafana.yaml"),
    yamlencode(var.settings_grafana)
  ]

 set {
   name  = "server.service.type"
   value = "LoadBalancer"
 }

 set {
   name  = "server.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
   value = "nlb"
 }
}

data "kubernetes_service" "grafana_server" {
 metadata {
   name      = "grafana-server"
   namespace = helm_release.grafana.namespace
 }
}