pipeline {
    agent {
        label 'master'
    }
    tools {
        terraform 'terraform'
    }

    stages {
        stage('run prerequisite scripts') {
            steps {
                sh './scripts/create_provisioner_dir.sh'
            }
        }

        stage('applying terraform') {
            steps {
                withCredentials([
                string(credentialsId: 'AWSAccessKeyId', variable: 'AWS_ACCESS_KEY_ID'),
                string(credentialsId: 'AWSSecretKey', variable: 'AWS_SECRET_ACCESS_KEY'),
                string(credentialsId: 'db_user', variable: 'TF_VAR_username'),
                string(credentialsId: 'db_pass', variable: 'TF_VAR_password'),
                ]) {
                    sh '''
                    terraform -chdir=terraform init
                    terraform -chdir=terraform apply -var-file prod.tfvars -auto-approve
                    '''
                }
            }
        }

        stage('run ansible playbooks') {
            steps {
                sh '''
                ansible-playbook Ansible/playbook.yaml -i Ansible/hosts
                ansible-playbook Ansible/connect.yaml -i Ansible/hosts -vv
                '''
            }
        }

        stage('Invoke node_app private1 pipeline') {
            steps {
                build job: 'node_app private1'
            }
        }

        stage('Invoke node_app private2 pipeline') {
            steps {
                build job: 'node_app private2'
            }
        }
    }
}
