resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "tf_ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.tf_public_subnet1.id

  tags = {
    Name = "tf_nat"
  }

  depends_on = [aws_internet_gateway.tf_igw]
}