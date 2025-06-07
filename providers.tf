provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile != null ? var.aws_profile : null
  default_tags {
    tags = {
      "Terraform"   = "true"
      "Environment" = var.aws_environment
      "Project"     = var.aws_project_name
      "Owner"       = var.aws_owner
    }
  }
}

provider "tls" {}

provider "local" {}
