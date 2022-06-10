output "vpc_cidr" {
  value = aws_vpc.tf_vpc.cidr_block
}

output "vpc_id" {
  value = aws_vpc.tf_vpc.id
}

output "public_sub1_id" {
  value = aws_subnet.tf_public_subnet1.id
}

# output "public_sub2_id" {
#   value = aws_subnet.tf_public_subnet2.id
# }

output "private_sub1_id" {
  value = aws_subnet.tf_private_subnet1.id
}

output "private_sub2_id" {
  value = aws_subnet.tf_private_subnet2.id
}


