locals {
    inbound_ports = var.ingress
    outbound_ports = var.engress
}

resource "aws_security_group" "tf_sg" {
vpc_id = aws_vpc.my_vpc.id
name = "tf_sg"
description = "Security Group for tf_sg"

dynamic "ingress" {
for_each = local.inbound_ports
content {
from_port = ingress.value
to_port = ingress.value
protocol = "tcp"
cidr_blocks = [var.allow_all]
}
}

dynamic "egress" {
for_each = local.outbound_ports
content {
from_port = egress.value
to_port = egress.value
protocol = "tcp"
cidr_blocks = [var.allow_all]
}
}
}