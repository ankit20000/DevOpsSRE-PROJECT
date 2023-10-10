resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.example_eip.id
  subnet_id     = aws_subnet.private_subnet.id
}

# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "example_eip" {}