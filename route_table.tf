resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "dellops_route_table"
  }
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.route.id
}