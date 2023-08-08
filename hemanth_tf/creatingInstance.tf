# Creating an EC2 Instance

provider "aws" {
  region = var.region
}

provider "aws" {  
  region = "us-east-1"
  alias= "cat"   #this alias is basically for creating a substitute value for the region
} 

resource "aws_instance" "new_Instance" {
  ami                     = var.ami_type
  instance_type           = var.ec2_type
  key_name                = var.key_name
  private_ip              = var.private_ip
  subnet_id               = aws_subnet.custom_public_subnet.id
  vpc_security_group_ids = [aws_security_group.Security_groups.id]
  tags = {
    Name        = "MyInstance"
    
  }
}
