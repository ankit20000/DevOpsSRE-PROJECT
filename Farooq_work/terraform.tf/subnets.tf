resource "aws_subnet" "pub_subnet" {
  count      = length(var.cidr_public_subnet)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.az, count.index)

  tags = {
    Name = "Public-Subnet-${count.index + 1}"
  }
} 

resource "aws_subnet" "prvt_subnet" {
  count      = length(var.cidr_private_subnet)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.az, count.index)

   tags = {
    Name = "Private-Subnet-${count.index + 1}"
  }
} 