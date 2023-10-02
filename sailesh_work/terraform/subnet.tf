# resource "aws_subnet" "subnet1-public" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.subnet_cidr
#   availability_zone = "ap-south-1a"

#   tags = {
#     Name = "Public-Subnet"
#   }
# }