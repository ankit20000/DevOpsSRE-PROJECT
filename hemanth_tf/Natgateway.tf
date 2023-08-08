# Creating a nategateway
resource "aws_nat_gateway" "new_nategateway" {
  allocation_id = aws_eip.custom_elastic_ip.id
  subnet_id     = aws_subnet.custom_public_subnet.id

  tags = {
    Name = "new_natgateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.custom_internet_gateway]
}
