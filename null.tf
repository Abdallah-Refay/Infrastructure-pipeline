resource "null_resource" "public_dns" {

  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    #this command prints the public ip and dns to the terminal and forward the output to a file in provisioner dir
    command = "echo '${aws_instance.public1.public_dns}'  > ./provisioner/bastion_public_ip_dns.txt"
  }
}

resource "null_resource" "private_key" {

  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    #echo priavte key to /provisioner/private_key.pem and give it needed permissions
    command = "echo '${tls_private_key.encryption.private_key_pem}' > ./provisioner/private_key.pem && chmod 600 ./provisioner/private_key.pem"
  }
}


