# cloning the terraform
module "DevOpsSRE-PROJECT" {
  source = "github.com/ankit20000/DevOpsSRE-PROJECT?ref=hemanth_devops"
}

# creating a vpc
resource "aws_vpc" "vpc_custom" {
  cidr_block       = "10.0.0.0/20"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "cloned_vpc"
  }
}
