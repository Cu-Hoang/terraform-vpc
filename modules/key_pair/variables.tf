################################################################################
# Private Key
################################################################################

variable "private_key_algorithm" {
  description = "Name of the algorithm to use when generating the private key"
  type        = string
}

variable "private_key_rsa_bits" {
  description = "The size of the generated RSA key in bits when algorithm is RSA"
  type        = number
}

################################################################################
# Key Pair
################################################################################

variable "key_name" {
  description = "Name of the key pair"
  type        = string
}

variable "name_prefix" {
  description = "Prefix of name of key pair"
  type        = string
}
