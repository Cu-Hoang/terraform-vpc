# Terraform for managing and deploying AWS infrastructure

## Overview

This project uses Terraform to mangage and deploy a simple VPC including public and private subnets, Internet Gateway, route tables, Nat Gateway, Security Groups and EC2 instances.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.11.4
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.96 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.96 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 4.10 |
| <a name="provider_local"></a> [local](#provider\_local) | >= 2.52 |

## Getting Started

### Step 1. Configure AWS CLI

```bash
aws configure --profile your_profile_name
```

**Note:**
- ```your_profile_name```: Your AWS CLI profile name.

### Step 2. Clone the Repository

### Step 3. Configure Essential Variables for Terraform

Create a `terraform.tfvars` file:

For example:

```hcl
################################################################################
# Project
################################################################################

aws_region       = "your_region"
aws_profile      = "your_profile"
aws_environment  = "your_environment"
aws_owner        = "your_name"
aws_project_name = "your_project_name"

################################################################################
# VPC
################################################################################

vpc = {
  name     = "my-vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnets = {
    public-subnet-01 = {
      cidr = "10.0.0.0/20"
      az   = "ap-southeast-1a"
    }
  }
  private_subnets = {
    private-subnet-01 = {
      cidr = "10.0.16.0/20"
      az   = "ap-southeast-1a"
    }
  }
  enable_nat_gateway = true
}

################################################################################
# Public Security Group
################################################################################

public_security_group = {
  name        = "public-sg-01"
  description = "Public security group 01"
  ingress_rules_with_cidr = {
    ssh = {
      description = "SSH from my IP"
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
  egress_rules_with_cidr = {
    all_out = {
      description = "Allow all outbound"
      from_port   = 0
      to_port     = 0
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}

################################################################################
# Private Security Group
################################################################################

private_security_group = {
  name                    = "private-sg-01"
  description             = "Private security group 01"
  ingress_rules_with_cidr = {}
  egress_rules_with_cidr = {
    all_out = {
      description = "Allow all outbound"
      from_port   = 0
      to_port     = 0
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}

################################################################################
# Key Pair
################################################################################

key_pair = {
  private_key_algorithm = "RSA"
  private_key_rsa_bits  = 4096
  key_name              = "ssh-key"
  name_prefix           = "my-vpc"
}

################################################################################
# EC2
################################################################################

ec2 = {
  name_prefix   = "my-vpc"
  ami           = ""
  instance_type = "t2.micro"
}
```

**Note:**
- ```aws_region```: The AWS region where you deploy using Terraform.
- ```aws_profile```: Your AWS CLI profile name.
- ```aws_environment```: The name of your environment (e.g., dev, staging, prod).
- ```aws_owner```:  Your name or the owner of the infrastructure.
- ```aws_project_name```: The name of your project.

### Step 3. Initialize resources

```bash
terraform init
```

### Step 4. Review the resources

```bash
terraform plan
```

### Step 5. Apply the resources

```bash
terraform apply
```

### Step 6. Destroy the resources

```bash
terraform destroy
```
