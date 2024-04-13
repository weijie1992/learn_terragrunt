resource "aws_subnet" "weijie_private_ap_southeast_1a" {
  vpc_id            = aws_vpc.weijiemain.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "ap-southeast-1a"

  tags = {
    "Name"                               = "weijie-staging-private-ap-southeast-1a"
    "kubernetes.io/role/internal-elb"    = "1"
    "kubernetes.io/cluster/staging-demo" = "owned"
  }
}
resource "aws_subnet" "weijie_private_ap_southeast_1b" {
  vpc_id            = aws_vpc.weijiemain.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "ap-southeast-1b"

  tags = {
    "Name"                               = "weijie-staging-private-ap-southeast-1b"
    "kubernetes.io/role/internal-elb"    = "1"
    "kubernetes.io/cluster/staging-demo" = "owned"
  }
}

resource "aws_subnet" "weijie_public_ap_southeast_1a" {
  vpc_id                  = aws_vpc.weijiemain.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                               = "weijie-staging-private-ap-southeast-1a"
    "kubernetes.io/role/elb"             = "1"
    "kubernetes.io/cluster/staging-demo" = "owned"
  }
}

resource "aws_subnet" "weijie_public_ap_southeast_1b" {
  vpc_id                  = aws_vpc.weijiemain.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                               = "weijie-staging-private-ap-southeast-1b"
    "kubernetes.io/role/elb"             = "1"
    "kubernetes.io/cluster/staging-demo" = "owned"
  }
}
