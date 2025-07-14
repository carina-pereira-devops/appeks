
variable "settings_grafana" {
  default = {
    persistence = {
      enabled          = true
      storageClassName = "gp2"
    }
    adminPassword = "prom-operator"
  }
  description = "Configurações de Armazenamento."
}