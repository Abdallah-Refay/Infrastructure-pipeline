
resource "aws_instance" "public1" {
  ami                    = "ami-0fd63e471b04e22d0" # us-east-1
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.public-key.key_name
  vpc_security_group_ids = ["${aws_security_group.tf_public_sg.id}"]
  subnet_id              = aws_subnet.tf_public_subnet1.id

  tags = {
    Name = "public1"
  }
}


resource "aws_instance" "public2" {
  ami           = "ami-0fd63e471b04e22d0" # us-east-1
  instance_type = "t2.micro"

  vpc_security_group_ids = ["${aws_security_group.tf_public_sg.id}"]
  subnet_id              = aws_subnet.tf_public_subnet1.id
  tags = {
    Name = "public2"
  }
}

resource "aws_instance" "private1" {
  ami           = "ami-0fd63e471b04e22d0" # us-east-1
  instance_type = "t2.micro"
  key_name      = aws_key_pair.public-key.key_name

  vpc_security_group_ids = ["${aws_security_group.tf_private_sg.id}"]
  subnet_id              = aws_subnet.tf_private_subnet1.id
  tags = {
    Name = "private1"
  }
}

resource "aws_instance" "private2" {
  ami           = "ami-0fd63e471b04e22d0" # us-east-1
  instance_type = "t2.micro"

  vpc_security_group_ids = ["${aws_security_group.tf_private_sg.id}"]
  subnet_id              = aws_subnet.tf_private_subnet2.id
  tags = {
    Name = "private2"
  }
}