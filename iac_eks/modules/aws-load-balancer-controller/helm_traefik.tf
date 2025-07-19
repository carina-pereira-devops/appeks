resource "helm_release" "traefik" {
  name             = "traefik"
  repository       = "https://helm.traefik.io/traefik"
  chart            = "traefik"
  namespace        = "traefik"
  #version          = "26.1.0"
  create_namespace = true
  timeout = 600

  values = [
    <<EOF
    service:
      annotations:
        service.beta.kubernetes.io/aws-load-balancer-type: "alb"
    EOF
  ]
}