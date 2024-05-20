resource "aws_eks_cluster" "monitoramento_cluster" {
  name     = "${var.project_name}-cluster"
  role_arn = aws_iam_role.monitoramento_cluster_role.arn

  vpc_config {
    subnet_ids = [
      var.subnet_public_1a,
      var.subnet_public_1b
    ]
    endpoint_private_access = true
    endpoint_public_access  = true

  }

  depends_on = [
    aws_iam_role_policy_attachment.monitoramento_cluster_attachment
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cluster"
    }
  )
}
