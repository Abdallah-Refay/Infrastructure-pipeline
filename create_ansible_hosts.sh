tee ./Ansible/hosts <<EOF
[public]
$3 

[private]
$1
$2

[private:vars]
ansible_ssh_private_key_file=~/terraform/provisioner/private_key.pem
ansible_user=ubuntu
ansible_ssh_common_args='-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ProxyCommand="ssh -W %h:%p -q ubuntu@$3 -o IdentityFile=~/terraform/provisioner/private_key.pem -o Port=22"'

[public:vars]
ansible_ssh_private_key_file=~/terraform/provisioner/private_key.pem
ansible_user=ubuntu
EOF
