################################################################################
# VPC
################################################################################

output "main_vpc_id" {
  description = "ID of VPC"
  value       = aws_vpc.main.id
}

################################################################################
# Public Subnet
################################################################################

output "public_subnet_ids" {
  description = "Map of IDs of public subnets"
  value       = { for subnet in aws_subnet.public : subnet.tags["Name"] => { subnet_id = subnet.id } }
}

################################################################################
# Private Subnet
################################################################################

output "private_subnet_ids" {
  description = "Map of IDs of private subnets"
  value       = { for subnet in aws_subnet.private : subnet.tags["Name"] => { subnet_id = subnet.id } }
}
