################################################################################
# Path to Private Key
################################################################################

output "private_key_file_path" {
  description = "Path to the Private Key file"
  value       = local_file.private_key.filename
}

################################################################################
# Key name
################################################################################

output "key_name" {
  description = "Name of the key pair"
  value       = aws_key_pair.this.key_name
}
