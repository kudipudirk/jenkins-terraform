pipeline {
    agent any

    environment {
        AWS_REGION = "us-east-1"
        AWS_ACCESS_KEY_ID     = credentials('aws-creds').accessKey
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds').secretKey
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/<your-username>/<repo-name>.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                terraform init
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Approve Terraform Apply?"
                sh '''
                terraform apply -auto-approve
                '''
            }
        }
    }

    post {
        success {
            echo "Terraform Infrastructure Created Successfully"
        }
        failure {
            echo "Terraform Pipeline Failed"
        }
    }
}
