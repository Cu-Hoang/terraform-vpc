variable "name_prefix" {
  description = "Prefix name of the EC2 instance"
  type        = string
}

variable "ami" {
  description = "AMI ID of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type of EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name for the EC2 instances"
  type        = string
}

################################################################################
# Public EC2 Instance
################################################################################

variable "public_sg_ids" {
  description = "Public Security Group IDs for EC2 intances"
  type        = list(string)
}

variable "public_subnets" {
  description = "Map of public subnets"
  type = map(object({
    subnet_id = string
  }))
}

################################################################################
# Priavte EC2 Instance
################################################################################

variable "private_sg_ids" {
  description = "Private Security Group IDs for EC2 intances"
  type        = list(string)
}

variable "private_subnets" {
  description = "Map of private subnets"
  type = map(object({
    subnet_id = string
  }))
}
