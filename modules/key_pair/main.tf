################################################################################
# Private Key
################################################################################

resource "tls_private_key" "this" {
  algorithm = var.private_key_algorithm
  rsa_bits  = var.private_key_rsa_bits
}

################################################################################
# Key Pair
################################################################################

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = trimspace(tls_private_key.this.public_key_openssh)

  tags = {
    Name = "${var.name_prefix}-${var.key_name}"
  }
}

################################################################################
# Local file storing Private Key
################################################################################

resource "local_file" "private_key" {
  content         = tls_private_key.this.private_key_openssh
  filename        = "${path.root}/${var.key_name}.pem"
  file_permission = "0600"
}
