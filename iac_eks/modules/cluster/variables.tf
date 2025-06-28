variable "project_name" {
  type        = string
  description = "Nome do Projeto"
}

# Ref locals.tf
variable "tags" {
  type        = map(any)
  description = "Tags pertencentes aos recursos criados"
}

variable "public_subnet_1a" {
  type        = string
  description = "Subnet Pública AZ 1a"
}

variable "public_subnet_1b" {
  type        = string
  description = "Subnet Pública AZ 1b"
}