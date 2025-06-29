# Definição das variáveis
variable "cidr_block" {
  type        = string
  description = "Range de IPs utilizado na VPC"
  default = "10.0.0.0/16"
}

variable "project_name" {
  type        = string
  description = "Nome do Projeto"
  default = "ekspp"
}

variable "region" {
  type        = string
  description = "Região da AWS"
  default = "us-east-1"
}

variable "tags" {
  # Variável com conjunto de pares chave-valor 
  type        = map(any)
  description = "Tags pertencentes aos recursos criados"
  default = {
    "Time": "SRE"
  }
}

variable "web_acl_name" {
    description = "Lista de Controle de Acesso APP Python"
    default = "WAF Python"
}
variable "web_acl_description" {
    description = "Bloqueia o acesso indevido a aplicação"
    default = "ACL App Python"
}
variable "rule_name" {
    description = "Bloqueia Ip específico"
    default = block-ip
}
variable "rule_priority" {
    description = "Prioridade da Regra"
    default = 1
}