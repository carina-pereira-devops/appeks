resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-cluster"
  # Amazon Resource Name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      var.public_subnet_1a,
      var.public_subnet_1b
    ]
    # Acesso ao endpoint da API do Kubernetes via rede privada
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  # Forçando uma dependência
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attachment
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cluster"
    }
  )
}

resource "kubernetes_namespace" "app" {
  metadata {
    name = "app"
  }
}
resource "kubernetes_persistent_volume" "app" {
  metadata {
    name = "app"
  }
  spec {
    capacity = {
      storage = "3Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      vsphere_volume {
        volume_path = "/opt/"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "app" {
  metadata {
    name = "app"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "2Gi"
      }
    }
    volume_name = "${kubernetes_persistent_volume.app.metadata.0.name}"
  }
}
