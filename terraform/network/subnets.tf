resource "aws_subnet" "tf_public_subnet1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = var.availability_zone_names[0]
  tags = {
    Name = "${var.env}-public-${var.availability_zone_names[0]}"
  }
  map_public_ip_on_launch = "true"
}

# resource "aws_subnet" "tf_public_subnet2" {
#   vpc_id            = aws_vpc.tf_vpc.id
#   cidr_block        = var.public_subnet2_cidr
#   availability_zone = var.availability_zone_names[1]
#   tags = {
#     Name = "${var.env}-public-${var.availability_zone_names[1]}"
#   }
#   map_public_ip_on_launch = "true"
# }

resource "aws_subnet" "tf_private_subnet1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = var.availability_zone_names[0]
  tags = {
    Name = "${var.env}-private-${var.availability_zone_names[0]}"
  }
}

resource "aws_subnet" "tf_private_subnet2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.availability_zone_names[1]
  tags = {
    Name = "${var.env}-private-${var.availability_zone_names[1]}"
  }
}