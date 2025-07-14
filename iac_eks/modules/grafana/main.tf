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
}

data "kubernetes_service" "grafana_server" {
 metadata {
   name      = "grafana-server"
   namespace = helm_release.grafana.namespace
 }
}