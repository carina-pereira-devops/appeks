resource "helm_release" "prometheus" {
 name       = "prometheus"
 repository = "https://prometheus-community.github.io/helm-charts"
 chart      = "prometheus"
 namespace  = "prometheus"
 create_namespace = true

   values = [
    yamlencode(var.settings_prometheus)
  ]
}

data "kubernetes_service" "prometheus_server" {
 metadata {
   name      = "prometheus-server"
   namespace = helm_release.prometheus.namespace
 }
}