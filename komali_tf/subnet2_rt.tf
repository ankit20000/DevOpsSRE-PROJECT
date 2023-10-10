resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.My_VPC.id
    route {
    cidr_block = var.NAT_cidr
    gateway_id = aws_nat_gateway.NAT.id
  }
    tags = {
        name = "private_rt"
    }
}
