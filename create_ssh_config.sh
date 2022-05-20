tee ~/.ssh/config <<EOF
Host $1
  ProxyCommand ssh -W %h:%p $3
  IdentityFile ${JENKINS_HOME}/workspace/terraform/provisioner/private_key.pem

Host $2
  ProxyCommand ssh -W %h:%p $3
  IdentityFile ${JENKINS_HOME}/workspace/terraform/provisioner/private_key.pem


Host $3
  Hostname $3
  User ubuntu
  IdentityFile ${JENKINS_HOME}/workspace/terraform/provisioner/private_key.pem

EOF
