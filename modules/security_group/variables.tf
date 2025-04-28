################################################################################
# Security group
################################################################################

variable "name" {
  description = "Name of the Security Group"
  type        = string
}

variable "vpc_id" {
  description = "ID of VPC"
  type        = string
}

variable "description" {
  description = "Description of Security Group"
  type        = string
}

################################################################################
# Ingress rules
################################################################################

variable "ingress_rules_with_cidr" {
  description = "Ingress rules allowing access from specific CIDRs"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
  }))
}

variable "ingress_with_security_group" {
  description = "Ingress rules allowing access from the Security Group"
  type = map(object({
    description                  = string
    from_port                    = number
    to_port                      = number
    ip_protocol                  = string
    referenced_security_group_id = string
  }))
}

################################################################################
# Egress rules
################################################################################

variable "engress_rules_with_cidr" {
  description = "Engress rules allowing access from specific CIDRs"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
  }))
}

variable "engress_with_security_group" {
  description = "Engress rules allowing access from the Security Group"
  type = map(object({
    description                  = string
    from_port                    = number
    to_port                      = number
    ip_protocol                  = string
    referenced_security_group_id = string
  }))
}
