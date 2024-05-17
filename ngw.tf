resource "aws_eip" "monitoramento_ngw_eip_1a" {
  domain = "vpc"

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

resource "aws_eip" "monitoramento_ngw_eip_1b" {
  domain = "vpc"

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-eip-1b"
    }
  )
}

resource "aws_nat_gateway" "monitoramento_ngw_1a" {
  allocation_id = aws_eip.monitoramento_ngw_eip_1a.id
  subnet_id     = aws_subnet.monitoramento_subnet_public_1a.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )
}

resource "aws_nat_gateway" "monitoramento_ngw_1b" {
  allocation_id = aws_eip.monitoramento_ngw_eip_1b.id
  subnet_id     = aws_subnet.monitoramento_subnet_public_1b.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )
}

resource "aws_route_table" "monitoramento_priv_rtb_1a" {
  vpc_id = aws_vpc.monitoramento_vpc.id

  route {
    cidr_block     = var.all_ipv4
    nat_gateway_id = aws_nat_gateway.monitoramento_ngw_1a.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-priv-rtb-1a"
    }
  )
}

resource "aws_route_table" "monitoramento_priv_rtb_1b" {
  vpc_id = aws_vpc.monitoramento_vpc.id

  route {
    cidr_block     = var.all_ipv4
    nat_gateway_id = aws_nat_gateway.monitoramento_ngw_1b.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-priv-rtb-1b"
    }
  )
}
