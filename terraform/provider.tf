terraform {                            # Terraform block
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"      # Minimum version of Terraform required
}

provider "aws" {                      # Provider block
    profile = "default"               # AWS profile to use
    region  = "us-east-1"             # AWS region to use
}