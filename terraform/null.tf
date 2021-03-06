resource "null_resource" "public_ip" {

  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    #this command prints the public ip and dns to the terminal and forward the output to a file in provisioner dir
    command = "echo '${aws_instance.public1.public_ip}'  > ../provisioner/bastion_public_dns.txt"
  }
}


resource "null_resource" "create_hosts_file" {

  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    #this command prints the public ip and dns to the terminal and forward the output to a file in provisioner dir
    command = "../scripts/create_ansible_hosts.sh ${aws_instance.private1.private_ip} ${aws_instance.private2.private_ip} ${aws_instance.public1.public_ip}"
  }

}

resource "null_resource" "create_ssh_config_file" {

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    #this command prints the public ip and dns to the terminal and forward the output to a file in provisioner dir
    command = "../scripts/create_ssh_config.sh ${aws_instance.private1.private_ip} ${aws_instance.private2.private_ip} ${aws_instance.public1.public_ip}"
  }

}


resource "null_resource" "private_key" {

  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    #echo priavte key to /provisioner/private_key.pem and give it needed permissions
    command = "echo '${tls_private_key.encryption.private_key_pem}' > ~/.ssh/private_key.pem && chmod 400 ~/.ssh/private_key.pem"
  }
}

resource "null_resource" "rds_redis_env" {

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "../scripts/create_rds_redis_env.sh ${module.rds_redis.db_address} ${module.rds_redis.db_user} ${module.rds_redis.db_password} ${module.rds_redis.db_port} ${module.rds_redis.redis_host} ${module.rds_redis.redis_port}"
  }
}

resource "null_resource" "lb_dns" {

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo ${aws_lb.network_lb.dns_name} > ../provisioner/loadbalancer_dns"
  }
}




