resource "aws_route_table" "weijie-private-rt" {
  vpc_id = aws_vpc.weijiemain.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.weijie-nat.id
  }

  tags = {
    Name = "weijie-dev-private-rt"
  }
}
resource "aws_route_table" "weijie-public-rt" {
  vpc_id = aws_vpc.weijiemain.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.weijie-nat.id
  }

  tags = {
    Name = "weijie-dev-public-rt"
  }
}

resource "aws_route_table_association" "weijie_private_us_east_1a" {
  subnet_id      = aws_subnet.weijie_private_ap_southeast_1a.id
  route_table_id = aws_route_table.weijie-private-rt.id
}
resource "aws_route_table_association" "weijie_private_us_east_1b" {
  subnet_id      = aws_subnet.weijie_private_ap_southeast_1b.id
  route_table_id = aws_route_table.weijie-private-rt.id
}
resource "aws_route_table_association" "weijie_public_us_east_1a" {
  subnet_id      = aws_subnet.weijie_public_ap_southeast_1a.id
  route_table_id = aws_route_table.weijie-public-rt.id
}
resource "aws_route_table_association" "weijie_public_us_east_1b" {
  subnet_id      = aws_subnet.weijie_public_ap_southeast_1b.id
  route_table_id = aws_route_table.weijie-public-rt.id
}
