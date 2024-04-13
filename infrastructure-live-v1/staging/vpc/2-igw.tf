resource "aws_internet_gateway" "weijie-igw" {
  vpc_id = aws_vpc.weijiemain.id
  tags = {
    Name = "weijie-staging-igw"
  }

}
