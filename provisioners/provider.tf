terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }
  backend "s3" { #backend is nothing but remote ; definetely we use state file in remote state
    bucket = "remote-storage-akshaysunny.space"
    key    = "provisioners-demo"
    use_lockfile = true
    encrypt = true
    region = "us-east-1"
    
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1" #not mandatoey because me mentioned the region in aws configure
}