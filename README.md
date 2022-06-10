# Infrastructure provisioning and configuration pipeline

![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white) ![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white) ![AWS](https://img.shields.io/badge/Amazon_AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white) ![Ansible](https://img.shields.io/badge/Ansible-000000?style=for-the-badge&logo=ansible&logoColor=white)
 ![Docker badge](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)

Jenkins pipline runs **Terraform** to provision resources on aws, **Ansible** to configure 2 private instances to be a jenkins salve and install docker on it, and lastly invoking the piplines responsible for deploying node app on these instances.

## Getting started with **Jenkins**
<hr>

I deployed jenkins master server as a docker custom image on my machine.

**First** you need to [install docker](https://docs.docker.com/engine/install/ubuntu/) on your machine

I used custom image I built to deploy the master server which is basically a jenkins image with docker-ce-cli you would need it if you want to run docker command but in our case we will not need it, so you can use the official jenkins image.

[official image](https://hub.docker.com/_/jenkins):
```
docker run jenkins
```
[my custom image](https://hub.docker.com/repository/docker/refay/jenkins_master):
```
docker run refay/jenkins_master:1.0
```

## Tools configuration on jenkins
<hr>

**Note**: that other versions of tools or plugins may work but I mentioned the versions that worked for me.
<br><br>
**Terraform:**

I used terraform plugin version 1.0.10 check [plugins reference for terraform](https://plugins.jenkins.io/terraform/) for more info. 
![terraform plugin](./docs/images/terraform_plugin.png)
<br>
**Then** after jenkins restarts go to global tool configuration and and terraform installation as follows.
![terraform plugin](./docs/images/terraform_tool_config.png)
<br><br>
**Ansible:**

I installed ansible as a deb package from apt package manger.

but first you need to exec into the container as root.
```
docker exec -it -u root <containe_name_or_id> bash
```
Then run
```
apt install ansible
```
after installing ansible you need to provide the binary path in the global tool configuration as follows: 
![ansible tool config](./docs/images/ansible_tool_config.png)


<br>

## 🔗 Feedback
<hr>

📧 abdallah.refay2000@gmail.com

[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/abdallah-refaay/)


