terraform {
    backend "s3" {
        bucket = "jalen-jones-test-terraform-state"
        key = "dev/terraform.tfstate"
        region = "us-east-2"
        encrypt = true
        use_lockfile = true
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " >= 6.32.1"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}