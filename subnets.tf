resource "aws_subnet" "tf_public_subnet1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.env}-public-${var.region}a"
  }
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "tf_public_subnet2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name = "${var.env}-public-${var.region}b"
  }
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "tf_private_subnet1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.env}-private-${var.region}a"
  }
}

resource "aws_subnet" "tf_private_subnet2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name = "${var.env}-private-${var.region}b"
  }
}