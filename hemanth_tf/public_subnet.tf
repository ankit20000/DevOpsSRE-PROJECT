# creating a public subnet
resource "aws_subnet" "custom_public_subnet" {
  vpc_id     = aws_vpc.vpc_custom.id
  cidr_block = element(var.specific_cidr_blocks, 0)
  map_public_ip_on_launch =element(var.boolean_values, 0)

  tags = {
    Name = "custom_public_sn"
  }
}
