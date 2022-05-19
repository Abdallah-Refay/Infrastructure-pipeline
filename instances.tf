resource "aws_instance" "public1" {
  ami                    = var.ubuntu_ami
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.public-key.key_name
  vpc_security_group_ids = ["${aws_security_group.tf_public_sg.id}"]
  subnet_id              = module.network.public_sub1_id

  tags = {
    Name = "public1-bastion"
  }
}


# resource "aws_instance" "public2" {
#   ami           = var.ubuntu_ami
#   instance_type = "t2.micro"

#   vpc_security_group_ids = ["${aws_security_group.tf_public_sg.id}"]
#   subnet_id              = module.network.public_sub2_id
#   tags = {
#     Name = "public2"
#   }
# }

resource "aws_instance" "private1" {
  ami           = var.ubuntu_ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.public-key.key_name

  vpc_security_group_ids = ["${aws_security_group.tf_private_sg.id}"]
  subnet_id              = module.network.private_sub1_id
  tags = {
    Name = "private1"
  }
}

resource "aws_instance" "private2" {
  ami           = var.ubuntu_ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.public-key.key_name

  vpc_security_group_ids = ["${aws_security_group.tf_private_sg.id}"]
  subnet_id              = module.network.private_sub2_id

  tags = {
    Name = "private2"
  }
}
