# creating a vpc in the vpc section
resource "aws_vpc" "vpc_custom" {
  cidr_block       = element(var.specific_cidr_blocks, 2)
  instance_tenancy = "default"
  enable_dns_hostnames = element(var.boolean_values, 0)

  tags = {
    Name = "custom_vpc"
  }
}
