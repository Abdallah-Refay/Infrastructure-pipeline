resource "aws_instance" "public1" {
  ami                    = var.ubuntu_ami
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.public-key.key_name
  vpc_security_group_ids = ["${aws_security_group.tf_public_sg.id}"]
  subnet_id              = module.network.public_sub1_id

  provisioner "local-exec" {
    #this command prints the public ip and dns to the terminal and forward the output to a file in provisioner dir
    command = "echo ' ${self.public_ip}\n ${self.public_dns}'  | tee ./provisioner/bastion_public_ip_dns.txt"
  }

  tags = {
    Name = "public1-bastion"
  }
}


resource "aws_instance" "public2" {
  ami           = var.ubuntu_ami
  instance_type = "t2.micro"

  vpc_security_group_ids = ["${aws_security_group.tf_public_sg.id}"]
  subnet_id              = module.network.public_sub2_id
  tags = {
    Name = "public2"
  }
}

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
