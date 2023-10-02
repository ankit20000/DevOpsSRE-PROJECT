terraform {
  backend "s3" {
    bucket = "devopsremotestate1"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
