resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "first_tf_vpc"
  }
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
}

