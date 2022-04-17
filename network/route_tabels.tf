resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.tf_ngw.id
  }

  tags = {
    Name = "private_rt"
  }
}