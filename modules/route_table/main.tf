################################################################################
# Route table
################################################################################

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "${var.name_prefix}-public-route-table"
  }
}

resource "aws_route_table" "private" {
  for_each = var.enable_nat_gateway ? { "enabled" = true } : {}
  vpc_id   = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "${var.name_prefix}-private-route-table"
  }
}

################################################################################
# Route Table Association
################################################################################

resource "aws_route_table_association" "public" {
  for_each       = var.public_subnet_ids
  subnet_id      = each.value.subnet_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  for_each       = var.enable_nat_gateway ? var.private_subnet_ids : {}
  subnet_id      = each.value.subnet_id
  route_table_id = aws_route_table.private["enabled"].id
}
