resource "aws_subnet" "monitoramento_subnet_priv_1a" {
  vpc_id            = aws_vpc.monitoramento_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name}-subnet-priv-1a",
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "monitoramento_subnet_priv_1b" {
  vpc_id            = aws_vpc.monitoramento_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"

  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name}-subnet-priv-1b",
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_route_table_association" "monitoramento_rtb_assoc_priv_1a" {
  subnet_id      = aws_subnet.monitoramento_subnet_priv_1a.id
  route_table_id = aws_route_table.monitoramento_priv_rtb_1a.id
}

resource "aws_route_table_association" "monitoramento_rtb_assoc_priv_1b" {
  subnet_id      = aws_subnet.monitoramento_subnet_priv_1b.id
  route_table_id = aws_route_table.monitoramento_priv_rtb_1b.id
}
