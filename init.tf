terraform {
  backend "s3" {
    bucket = "devopsremotestate1" #give bucket name in your s3
    key    = "dev/module.tfstate"  #give path in your s3
    region = "us-east-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}