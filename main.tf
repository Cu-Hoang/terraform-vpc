################################################################################
# VPC
################################################################################

module "vpc" {
  source             = "./modules/vpc"
  name               = var.vpc.name
  vpc_cidr           = var.vpc.vpc_cidr
  public_subnets     = var.vpc.public_subnets
  private_subnets    = var.vpc.private_subnets
  enable_nat_gateway = var.vpc.enable_nat_gateway
}

################################################################################
# Public Securrity Group
################################################################################

module "public_security_group" {
  source                      = "./modules/security_group"
  name                        = var.public_security_group.name
  vpc_id                      = module.vpc.main_vpc_id
  description                 = var.public_security_group.description
  ingress_rules_with_cidr     = var.public_security_group.ingress_rules_with_cidr
  ingress_with_security_group = {}
  engress_rules_with_cidr     = var.public_security_group.engress_rules_with_cidr
  engress_with_security_group = {}
}

################################################################################
# Private Securrity Group
################################################################################

module "private_security_group" {
  source                  = "./modules/security_group"
  name                    = var.private_security_group.name
  vpc_id                  = module.vpc.main_vpc_id
  description             = var.private_security_group.description
  ingress_rules_with_cidr = var.private_security_group.ingress_rules_with_cidr
  ingress_with_security_group = {
    ssh = {
      description                  = "SSH from Public EC2"
      from_port                    = 22
      to_port                      = 22
      ip_protocol                  = "tcp"
      referenced_security_group_id = module.public_security_group.this_security_group_id
    }
  }
  engress_rules_with_cidr     = var.private_security_group.engress_rules_with_cidr
  engress_with_security_group = {}
}

################################################################################
# Key Pair
################################################################################

module "key_pair" {
  source                = "./modules/key_pair"
  private_key_algorithm = var.key_pair.private_key_algorithm
  private_key_rsa_bits  = var.key_pair.private_key_rsa_bits
  key_name              = var.key_pair.key_name
  name_prefix           = var.key_pair.name_prefix
}

################################################################################
# EC2
################################################################################

module "ec2" {
  source          = "./modules/ec2"
  name_prefix     = var.ec2.name_prefix
  ami             = var.ec2.ami
  instance_type   = var.ec2.instance_type
  key_name        = module.key_pair.key_name
  public_sg_ids   = [module.public_security_group.this_security_group_id]
  public_subnets  = module.vpc.public_subnet_ids
  private_sg_ids  = [module.private_security_group.this_security_group_id]
  private_subnets = module.vpc.private_subnet_ids
}
