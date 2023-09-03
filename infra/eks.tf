locals {
  subnet_ids = [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id]
}

resource "aws_eks_cluster" "timezone-eks" {
 name = "timezone-cluster"
 role_arn = aws_iam_role.eks-iam-role.arn

 vpc_config {
  subnet_ids = local.subnet_ids
 }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = aws_eks_cluster.timezone-eks.name
  node_group_name = "timezone-workernodes"
  node_role_arn  = aws_iam_role.workernodes.arn
  subnet_ids = local.subnet_ids
  instance_types = ["t2.micro"]
 
  scaling_config {
   desired_size = 2
   max_size   = 2
   min_size   = 1
  }
 
  depends_on = [
   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
   aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
 }
