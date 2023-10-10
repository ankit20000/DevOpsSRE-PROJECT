resource "aws_vpc" "My_VPC" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.tag_name
  }
}