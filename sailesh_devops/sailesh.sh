provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "example_instance" {
  ami           = "ami-1234"  
  instance_type = "t2.large"  
  
  tags = {
    Name = "sailesh-dev"
  }
}