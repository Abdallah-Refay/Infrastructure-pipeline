pipeline {
    agent any

    stages {
        stage('Pulling terraform repo') {
                steps {
                    git branch: 'master',
            url: 'https://github.com/Abdallah-Refay/Terraform-getting-started.git'
                }
        }

        stage('export secrets and credentials ans env variabels and applying terraform') {
            steps {
                withCredentials([
                string(credentialsId: 'AWSAccessKeyId', variable: 'TF_VAR_AWS_ACCESS_KEY_ID'),
                string(credentialsId: 'AWSSecretKey', variable: 'TF_VAR_AWS_SECRET_ACCESS_KEY'),
                string(credentialsId: 'db_user', variable: 'TF_VAR_username'),
                string(credentialsId: 'db_pass', variable: 'TF_VAR_password'),
                ]) {
                    sh '''
                    terraform -chdir=${JENKINS_HOME}/workspace/Terraform-getting-started -var-file prod.tfvars apply
                    '''
                }
            }

            stage('applying terraform') {
                steps {
                }
            }
        }
    }
}
