#create public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id


  route {
    cidr_block = var.rt_cidr
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  
  tags = {
    Name = var.rt_name
  }
}
#route table association

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public_route_table.id
}