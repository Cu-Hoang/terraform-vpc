################################################################################
# Public EC2 Instance
################################################################################

output "public_instance_ips" {
  description = "Public and Private IP addresses of the public EC2 instances"
  value = {
    for i in aws_instance.public :
    i.id => {
      name       = i.tags["Name"]
      public_ip  = i.public_ip
      private_ip = i.private_ip
    }
  }
}

################################################################################
# Priavte EC2 Instance
################################################################################

output "private_instance_ips" {
  description = "Private IP addresses of the private EC2 instances"
  value = {
    for i in aws_instance.private :
    i.id => {
      name       = i.tags["Name"]
      private_ip = i.private_ip
    }
  }
}
