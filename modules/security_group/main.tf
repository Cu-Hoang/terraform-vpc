################################################################################
# Security group
################################################################################

resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.name
  }
}

################################################################################
# Ingress rules
################################################################################

resource "aws_vpc_security_group_ingress_rule" "ingress_with_cidr" {
  for_each          = var.ingress_rules_with_cidr
  security_group_id = aws_security_group.this.id
  description       = each.value.description
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_ingress_rule" "ingress_with_security_group" {
  for_each                     = var.ingress_with_security_group
  security_group_id            = aws_security_group.this.id
  description                  = each.value.description
  from_port                    = each.value.from_port
  to_port                      = each.value.to_port
  ip_protocol                  = each.value.ip_protocol
  referenced_security_group_id = each.value.referenced_security_group_id
}

################################################################################
# Egress rules
################################################################################

resource "aws_vpc_security_group_egress_rule" "egress_with_cidr" {
  for_each          = var.engress_rules_with_cidr
  security_group_id = aws_security_group.this.id
  description       = each.value.description
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_egress_rule" "egress_with_security_group" {
  for_each                     = var.engress_with_security_group
  security_group_id            = aws_security_group.this.id
  description                  = each.value.description
  from_port                    = each.value.from_port
  to_port                      = each.value.to_port
  ip_protocol                  = each.value.ip_protocol
  referenced_security_group_id = each.value.referenced_security_group_id
}
