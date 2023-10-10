resource "aws_subnet" "public_subnet" {
  availability_zone = var.public_az
  cidr_block = var.cidr_public
  vpc_id     = aws_vpc.My_VPC.id

  tags = {
    Name = "public_subnet"
  }
}


resource "aws_subnet" "private_subnet" {
  availability_zone = var.private_az
  cidr_block = var.cidr_private
  vpc_id     = aws_vpc.My_VPC.id

  tags = {
    Name = "private_subnet"
  }
}


