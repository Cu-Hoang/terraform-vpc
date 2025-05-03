################################################################################
# Security group
################################################################################

output "this_security_group_id" {
  description = "ID of Security Group"
  value       = aws_security_group.this.id
}
