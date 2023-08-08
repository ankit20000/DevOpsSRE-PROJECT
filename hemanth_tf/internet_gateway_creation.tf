# creating an internet gateway
resource "aws_internet_gateway" "custom_internet_gateway" {
  vpc_id = aws_vpc.vpc_custom.id

  tags = {
    Name = "custom_internet_gateway"
  }
}
