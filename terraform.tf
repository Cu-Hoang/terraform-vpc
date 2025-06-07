terraform {
  cloud {

    organization = "UITLab"

    workspaces {
      name = "Lab"
    }
  }

  required_version = ">=1.11.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.96"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5.2"
    }
  }
}
