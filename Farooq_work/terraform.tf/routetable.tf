resource "aws_route_table" "pub_rt_table" {
  vpc_id =  aws_vpc.my_vpc.id
  route  {
    cidr_block = var.rt_cidr
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public_RT"
  }
}

resource "aws_route_table" "prvt_rt_table" {
  count = length(var.cidr_private_subnet)
  vpc_id =  aws_vpc.my_vpc.id
  depends_on = [aws_nat_gateway.nat_gateway]
  route  {
    cidr_block = var.rt_cidr
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
    }

  tags = {
    Name = "Prvt_RT-${count.index + 1}"
  }
}