terraform {
  backend "s3" {
    bucket         	   = "test-tf-786"
    key              	  = "dev/tfstate"
    region         	   = "ap-south-1"
  }
}