resource "helm_release" "traefik" {
  name             = "traefik"
  namespace        = "traefik"
  repository       = "https://traefik.github.io/charts"
  chart            = "traefik"
  create_namespace = true

   set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "ports.websecure.tls.enabled"
    value = "true"
  }

  set {
    name  = "providers.kubernetesIngress.enabled"
    value = "true"
  }

  set {
    name  = "providers.kubernetesCRD.enabled"
    value = "true"
  }
}