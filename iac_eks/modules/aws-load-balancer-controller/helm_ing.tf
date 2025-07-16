resource "helm_release" "ingress-nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
  version          = "4.10.0"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}

resource "kubernetes_ingress_v1" "ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "ingress"
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          backend {
            service {
              name = "python-service" 
              port {
                number = 8000 # Expondo porta da aplicação
              }
            }
          }

          path = "/app"
        }

        path {
          backend {
            service {
              name = "python-service" 
              port {
                number = 7000 # Expondo porta para coleta de métricas
              }
            }
          }

          path = "/metrics"
        }
      }
    }
  }
}
