################################################################################
# Elastic IP
################################################################################

resource "aws_eip" "nat_gateway" {
  for_each = var.enable_nat_gateway ? { "enabled" = true } : {}

  tags = {
    Name = "${var.name_prefix}-nat-gatewat-eip"
  }
}

################################################################################
# Nat Gateway
################################################################################

resource "aws_nat_gateway" "this" {
  for_each = var.enable_nat_gateway ? { "enabled" = true } : {}

  allocation_id = aws_eip.nat_gateway["enabled"].id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "${var.name_prefix}-nat-gateway"
  }
}
