variable "cluster_name" {
  type        = string
  description = "Nome do Cluster"
  default = aws_eks_cluster.eks_cluster.name
}