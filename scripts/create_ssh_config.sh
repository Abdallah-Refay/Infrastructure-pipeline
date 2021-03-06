tee ~/.ssh/config <<EOF
Host private1
  User ubuntu
  HostName $1
  ProxyCommand ssh -W %h:%p bastion
  IdentityFile ~/.ssh/private_key.pem

Host private2
  User ubuntu
  HostName $2
  ProxyCommand ssh -W %h:%p bastion
  IdentityFile ~/.ssh/private_key.pem


Host bastion
  Hostname $3
  User ubuntu
  IdentityFile ~/.ssh/private_key.pem
EOF
