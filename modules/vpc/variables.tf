variable "name" {
  description = "Name of the VPC"
  type        = string
}

################################################################################
# VPC
################################################################################

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

################################################################################
# Public Subnet
################################################################################

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}

################################################################################
# Private Subnet
################################################################################

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}

################################################################################
# Nat Gateway
################################################################################

variable "enable_nat_gateway" {
  description = "Determines whether to NAT Gateway will be enabled."
  type        = bool
}
