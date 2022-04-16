resource "aws_vpc" "tf_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "first_tf_vpc"
  }
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
}

