resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.My_VPC.id
    tags = {
        name = "IGW"
    }
}