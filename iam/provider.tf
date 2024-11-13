terraform {
  required_version = var.terraform_version
  required_providers {
    aws=var.aws_version
    
  }
}

provider "aws" {
    region = var.region
    profile = var.aws_profile
  
}