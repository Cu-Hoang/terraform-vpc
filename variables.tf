################################################################################
# Project
################################################################################

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "aws_environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "aws_project_name" {
  description = "Name of project"
  type        = string
  default     = ""
}

variable "aws_owner" {
  description = "Owner"
  type        = string
  default     = ""
}

################################################################################
# VPC
################################################################################

variable "vpc" {
  description = "VPC"
  type = object({
    name     = string
    vpc_cidr = string
    public_subnets = map(object({
      cidr = string
      az   = string
    }))
    private_subnets = map(object({
      cidr = string
      az   = string
    }))
    enable_nat_gateway = bool
  })
}

################################################################################
# Public Security Group
################################################################################

variable "public_security_group" {
  description = "Public Security Group"
  type = object({
    name        = string
    description = string
    ingress_rules_with_cidr = map(object({
      description = string
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr_ipv4   = string
    }))
    egress_rules_with_cidr = map(object({
      description = string
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr_ipv4   = string
    }))
  })
}

################################################################################
# Private Security Group
################################################################################

variable "private_security_group" {
  description = "Private Security Group"
  type = object({
    name        = string
    description = string
    ingress_rules_with_cidr = map(object({
      description = string
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr_ipv4   = string
    }))
    egress_rules_with_cidr = map(object({
      description = string
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr_ipv4   = string
    }))
  })
}

################################################################################
# Key Pair
################################################################################

variable "key_pair" {
  description = "Key Pair"
  type = object({
    private_key_algorithm = string
    private_key_rsa_bits  = string
    key_name              = string
    name_prefix           = string
  })
}

################################################################################
# EC2
################################################################################

variable "ec2" {
  description = "EC2"
  type = object({
    name_prefix   = string
    ami           = string
    instance_type = string
  })
}
