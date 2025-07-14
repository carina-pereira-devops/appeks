variable "settings_prometheus" {
  default = {
    alertmanager = {
      persistentVolume = {
        storageClass = "gp2"
      }
    }
    server = {
      persistentVolume = {
        storageClass = "gp2"
      }
    }
  }
  description = "Configurações de Armazenamento"
}