terraform {
  backend "s3" {
    bucket = "anushaterraform" #give bucket name of your s3
    key    = "dev/module.tfstate"  #give path for file of your s3
    region = "us-east-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}