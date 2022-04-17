resource "tls_private_key" "encryption" {
  algorithm = "RSA"
  rsa_bits  = 4096
  provisioner "local-exec" {
    #echo priavte key to /provisioner/private_key.pem and give it needed permissions
    command = "echo '${self.private_key_pem}' > ./provisioner/private_key.pem && chmod 600 ./provisioner/private_key.pem"
  }

}

resource "aws_key_pair" "public-key" {
  key_name   = "bastion"
  public_key = tls_private_key.encryption.public_key_openssh

  tags = {
    Name = "ssh-keypair"
  }
}

resource "aws_secretsmanager_secret" "public_key" {
  name                    = "bastion"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "public_key" {
  secret_id     = aws_secretsmanager_secret.public_key.id
  secret_string = tls_private_key.encryption.public_key_openssh
}

resource "aws_secretsmanager_secret" "private_key" {
  name                    = "private_key"
  recovery_window_in_days = 0

}
resource "aws_secretsmanager_secret_version" "private_key" {
  secret_id     = aws_secretsmanager_secret.private_key.id
  secret_string = tls_private_key.encryption.private_key_pem

}