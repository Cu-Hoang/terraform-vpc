################################################################################
# Route table
################################################################################

variable "name_prefix" {
  description = "Prefix of name of the Route Table"
  type        = string
}

variable "vpc_id" {
  description = "ID of VPC"
  type        = string
}

variable "internet_gateway_id" {
  description = "ID of Internet Gateway"
  type        = string
}

variable "nat_gateway_id" {
  description = "ID of Nat Gateway"
  type        = string
}

variable "enable_nat_gateway" {
  description = "Determines whether to NAT Gateway will be enabled."
  type        = bool
}

################################################################################
# Route Table Association
################################################################################

variable "public_subnet_ids" {
  description = "Map of IDs of public subnets"
  type = map(object({
    subnet_id = string
  }))
}

variable "private_subnet_ids" {
  description = "Map of IDs of private subnets"
  type = map(object({
    subnet_id = string
  }))
}
