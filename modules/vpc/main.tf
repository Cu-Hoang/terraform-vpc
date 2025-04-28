################################################################################
# VPC
################################################################################

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.name
  }
}

################################################################################
# Public Subnet
################################################################################

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-${each.key}"
  }
}

################################################################################
# Private Subnet
################################################################################

resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "${var.name}-${each.key}"
  }
}

################################################################################
# Internet Gateway
################################################################################

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name}-igw"
  }
}

################################################################################
# Nat Gateway
################################################################################

module "nat" {
  source             = "../nat"
  enable_nat_gateway = var.enable_nat_gateway
  name_prefix        = var.name
  public_subnet_id   = aws_subnet.public[sort(keys(aws_subnet.public))[0]].id
}

################################################################################
# Route Table
################################################################################

module "route_table" {
  source              = "../route_table"
  vpc_id              = aws_vpc.main.id
  name_prefix         = var.name
  internet_gateway_id = aws_internet_gateway.main.id
  nat_gateway_id      = module.nat.nat_gateway_id
  enable_nat_gateway  = var.enable_nat_gateway
  public_subnet_ids   = { for subnet in aws_subnet.public : subnet.tags["Name"] => { subnet_id = subnet.id } }
  private_subnet_ids  = { for subnet in aws_subnet.private : subnet.tags["Name"] => { subnet_id = subnet.id } }
}
