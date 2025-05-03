variable "name_prefix" {
  description = "Prefix of name of the Nat Gateway"
  type        = string
}

variable "enable_nat_gateway" {
  description = "Determines whether to NAT Gateway will be enabled."
  type        = bool
}

################################################################################
# Nat Gateway
################################################################################

variable "public_subnet_id" {
  description = "ID of the public subnet where the NAT Gateway will be attached"
  type        = string
}
