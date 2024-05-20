resource "aws_security_group_rule" "monitoramento_cluster_sg_rule" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [var.all_ipv4]
  ipv6_cidr_blocks  = [var.all_ipv6]
  security_group_id = aws_eks_cluster.monitoramento_cluster.vpc_config[0].cluster_security_group_id
}
