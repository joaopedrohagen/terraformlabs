resource "aws_internet_gateway" "monitoramento_igw" {
  vpc_id = aws_vpc.monitoramento_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-igw"
    }
  )
}

resource "aws_route_table" "monitoramento_pub_rtb" {
  vpc_id = aws_vpc.monitoramento_vpc.id

  route {
    cidr_block = var.all_ipv4
    gateway_id = aws_internet_gateway.monitoramento_igw.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-pub-rtb"
    }
  )
}
