resource "aws_route_table_association" "pub_rt_association" {
  count = length(var.cidr_public_subnet)
  depends_on = [aws_subnet.pub_subnet, aws_route_table.pub_rt_table]
  subnet_id = element(aws_subnet.pub_subnet[*].id, count.index)
  route_table_id = aws_route_table.pub_rt_table.id
}

resource "aws_route_table_association" "prvt_rt_association" {
  count = length(var.cidr_private_subnet)
  depends_on = [aws_subnet.prvt_subnet, aws_route_table.prvt_rt_table]
  subnet_id = element(aws_subnet.prvt_subnet[*].id, count.index)
  route_table_id = aws_route_table.prvt_rt_table[count.index].id 
}