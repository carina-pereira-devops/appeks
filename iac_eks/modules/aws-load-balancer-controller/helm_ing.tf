resource "helm_release" "nginx-ingress-controller" {
  name       = "nginx-ingress-controller"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"
  namespace  = "kube-system"

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
