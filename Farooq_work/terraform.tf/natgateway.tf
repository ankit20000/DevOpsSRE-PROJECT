resource "aws_eip" "nat_eip" {
  count = length(var.cidr_private_subnet)

  tags = {
    Name = "eip ${count.index + 1}"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  count = length(var.cidr_private_subnet)
  depends_on = [aws_eip.nat_eip]
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.prvt_subnet[count.index].id

  tags = {
    Name = "Private-NAT gw ${count.index + 1}"
  }
} 