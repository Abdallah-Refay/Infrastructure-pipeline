resource "aws_subnet" "tf_public_subnet1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public_tf_subnet1"
  }
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "tf_public_subnet2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public_tf_subnet2"
  }
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "tf_private_subnet1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private_tf_subnet1"
  }
}

resource "aws_subnet" "tf_private_subnet2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private_tf_subnet2"
  }
}