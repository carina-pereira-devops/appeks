# Informações que eu preciso exportar deste módulo para que outros módulos reutilizem
output "subnet_pub_1a" {
  value = aws_subnet.eks_subnet_public_1a.id
}

output "subnet_pub_1b" {
  value = aws_subnet.eks_subnet_public_1b.id
}

output "subnet_priv_1a" {
  value = aws_subnet.eks_subnet_private_1a.id
}

output "subnet_priv_1b" {
  value = aws_subnet.eks_subnet_private_1b.id
}

output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}