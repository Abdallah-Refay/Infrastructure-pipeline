resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.tf_public_subnet1.id
  route_table_id = aws_route_table.public_route.id
}

# resource "aws_route_table_association" "public2" {
#   subnet_id      = aws_subnet.tf_public_subnet2.id
#   route_table_id = aws_route_table.public_route.id
# }

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.tf_private_subnet1.id
  route_table_id = aws_route_table.private_route.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.tf_private_subnet2.id
  route_table_id = aws_route_table.private_route.id
}


