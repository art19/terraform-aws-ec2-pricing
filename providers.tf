terraform {
  required_version = "~> 0.10"

  required_providers {
    aws      = "~> 2"
    external = "~> 1"
  }
}

provider "aws" {
  alias  = "terraform-aws-ec2-pricing"
  region = "us-east-1"
}
