pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code from GitHub'
                checkout scm
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running Python unit tests'
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
                echo 'Building Docker image'
                sh 'docker build -t pulsecheck:latest .'
            }
        }

        stage('Run Container Smoke Test') {
            steps {
                echo 'Running container smoke test'
                sh '''
                    docker rm -f pulsecheck-test || true
                    docker run -d -p 5001:5000 --name pulsecheck-test pulsecheck:latest
                    sleep 5
                    curl http://localhost:5001/health
                    docker rm -f pulsecheck-test
                '''
            }
        }
    }
}
