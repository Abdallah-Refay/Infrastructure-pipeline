pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    stages {
        stage('Pulling terraform repo') {
            steps {
                git branch: 'master',
                url: 'https://github.com/Abdallah-Refay/Terraform-getting-started.git'
                sh './create_provisioner_dir.sh'
            }
        }

        stage('init and applying terraform') {
            steps {
                withCredentials([
                string(credentialsId: 'AWSAccessKeyId', variable: 'AWS_ACCESS_KEY_ID'),
                string(credentialsId: 'AWSSecretKey', variable: 'AWS_SECRET_ACCESS_KEY'),
                string(credentialsId: 'db_user', variable: 'TF_VAR_username'),
                string(credentialsId: 'db_pass', variable: 'TF_VAR_password'),
                ]) {
                    sh '''
                    terraform fmt
                    terraform init
                    terraform apply -var-file prod.tfvars -auto-approve
                    '''
                }
            }
        }
    }
}
