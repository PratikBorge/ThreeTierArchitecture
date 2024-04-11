resource "aws_eks_cluster" "eks_cluster" {
    name = "eks_cluster"
    vpc_config {
      subnet_ids = var.public_subnet_ids 
  }
    role_arn = "arn:aws:iam::471112957025:role/eks1"
}

resource "aws_eks_node_group" "eks_node_group" {
    cluster_name = aws_eks_cluster.eks_cluster.name
    subnet_ids = var.public_subnet_ids
    node_role_arn = "arn:aws:iam::471112957025:role/eks2"
    scaling_config {
       desired_size = 1
       max_size     = 2
       min_size     = 1
    }
}