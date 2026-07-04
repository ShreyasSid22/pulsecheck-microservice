pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        AWS_ACCOUNT_ID = '038832651490'
        ECR_REPO = 'pulsecheck-repo'
        ECR_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}"
        ECS_CLUSTER = 'pulsecheck-cluster'
        ECS_SERVICE = 'pulsecheck-service'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    cd app
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install -r requirements.txt
                    pytest
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t pulsecheck:latest .
                    docker tag pulsecheck:latest $ECR_URI:latest
                '''
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh '''
                    aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                    docker push $ECR_URI:latest
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                    cd terraform
                    terraform init -input=false
                    terraform fmt -check
                    terraform validate
                    terraform apply -auto-approve
                '''
            }
        }

        stage('Force ECS Deployment') {
            steps {
                sh '''
                    aws ecs update-service \
                      --cluster $ECS_CLUSTER \
                      --service $ECS_SERVICE \
                      --force-new-deployment \
                      --region $AWS_REGION
                '''
            }
        }
    }
}
