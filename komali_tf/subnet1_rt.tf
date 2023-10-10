resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.My_VPC.id
    route{
        cidr_block = var.IGW_cidr
        gateway_id = aws_internet_gateway.IGW.id
    }
    tags = {
        name = "public-rt"
    }  
}