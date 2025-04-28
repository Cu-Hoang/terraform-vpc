locals {
  ec2_ami = var.ami != "" ? var.ami : data.aws_ami.ubuntu.id
}

################################################################################
# Public EC2 Instance
################################################################################

resource "aws_instance" "public" {
  for_each = var.public_subnets

  ami           = local.ec2_ami
  instance_type = var.instance_type

  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = var.public_sg_ids
  key_name               = var.key_name

  tags = {
    Name = "${var.name_prefix}-public-instance-${each.key}"
  }
}

################################################################################
# Private EC2 Instance
################################################################################

resource "aws_instance" "private" {
  for_each = var.private_subnets

  ami           = local.ec2_ami
  instance_type = var.instance_type

  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = var.private_sg_ids
  key_name               = var.key_name

  tags = {
    Name = "${var.name_prefix}-private-instance-${each.key}"
  }
}
