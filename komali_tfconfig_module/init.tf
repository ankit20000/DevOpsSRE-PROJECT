terraform {
  backend "s3" {
    bucket = "komali-7-oct-2023"
    key    = "dev/terraform.statefile"
    region = "ap-south-1"
  }
}

provider "aws" {
  region  = var.region
}