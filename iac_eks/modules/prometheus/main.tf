resource "helm_release" "prometheus" {
  name       = "prometheus-community"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "23.1.0"
  namespace  = kubernetes_namespace.prometheus-namespace.metadata[0].name
  depends_on = [
    kubernetes_service_account.service-account
  ]

  values = [
    "${file("${path.module}/override_values.yaml")}"
  ]

 set {
   name  = "server.service.type"
   value = "LoadBalancer"
 }
}

resource "kubernetes_namespace" "prometheus-namespace" {
  metadata {
    annotations = {
      name = "observability"
    }

    labels = {
      application = "observability"
    }

    name = "observability"
  }
}
resource "kubernetes_service_account" "service-account" {
  metadata {
    name      = "prometheus"
    namespace = kubernetes_namespace.prometheus-namespace.metadata[0].name
    labels = {
      "app.kubernetes.io/name" = "prometheus"
    }
    annotations = {
      "eks.amazonaws.com/role-arn"               = module.prometheus_role.iam_role_arn
      "eks.amazonaws.com/sts-regional-endpoints" = "true"
    }
  }
}