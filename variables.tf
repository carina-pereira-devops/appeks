# Definição das variáveis
variable "cidr_block" {
  type        = string
  description = "Range de IPs utilizado na VPC"
}

variable "project_name" {
  type        = string
  description = "Nome do Projeto"
}

variable "region" {
  type        = string
  description = "Região da AWS"
}

variable "tags" {
  # Variável com conjunto de pares chave-valor 
  type        = map(any)
  description = "Tags pertencentes aos recursos criados"
}