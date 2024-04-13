resource "aws_eip" "weijie-eip" {
  vpc = true

  tags = {
    Name = "weijie-staging-nat"
  }
}

resource "aws_nat_gateway" "weijie-nat" {
  allocation_id = aws_eip.weijie-eip.id
  subnet_id     = aws_subnet.weijie_public_ap_southeast_1a.id

  tags = {
    Name = "staging-nat"
  }

  depends_on = [aws_internet_gateway.weijie-igw]
}
