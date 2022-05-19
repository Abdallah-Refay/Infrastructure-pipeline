pipeline {
    agent any
    tools {
        terraform 'terraform'
        ansible 'ansible'
    }

    stages {
        stage('run prequest scripts') {
            steps {
                sh './create_provisioner_dir.sh'
            }
        }

        stage('terraform init') {
            steps {
                withCredentials([
            string(credentialsId: 'AWSAccessKeyId', variable: 'AWS_ACCESS_KEY_ID'),
            string(credentialsId: 'AWSSecretKey', variable: 'AWS_SECRET_ACCESS_KEY'),
            ]) {
                    sh '''
                terraform fmt
                terraform init
                '''
            }
            }
        }

        stage('applying terraform') {
            steps {
                withCredentials([
                string(credentialsId: 'db_user', variable: 'TF_VAR_username'),
                string(credentialsId: 'db_pass', variable: 'TF_VAR_password'),
                ]) {
                    sh 'terraform apply -var-file prod.tfvars -auto-approve'
                }
            }
        }

        stage('testing ansible') {
            steps {
                sh 'ansible -m ping all -i Ansible/hosts'
            }
        }
    }
}
