################################################################################
# Nat Gateway
################################################################################

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = var.enable_nat_gateway ? aws_nat_gateway.this["enabled"].id : null
}

output "nat_gateway_public_ip" {
  description = "Public IP address of the NAT Gateway"
  value       = var.enable_nat_gateway ? aws_eip.nat_gateway["enabled"].public_ip : null
}
