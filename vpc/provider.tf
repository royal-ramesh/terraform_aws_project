terraform {
required_version="~>1.9"
  required_providers {
  
    aws = "5.75.0"
   
  }
}
provider "aws" {
    region = var.region
    profile = var.aws_profile
  
}



