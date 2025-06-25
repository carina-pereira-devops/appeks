# Terraform sempre lê no diretório atual as variáveis
variable "cidr_block" {
  type        = string
  # Sempre utilizar uma descrição para quando for documentar o projeto
  description = "Range de IPs utilizado na VPC"
}

variable "project_name" {
  type        = string
  description = "Nome do Projeto"
}

variable "tags" {
  type        = map(any)
  description = "Tags pertencentes aos recursos criados"
}