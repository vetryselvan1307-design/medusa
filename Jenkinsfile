pipeline {
    agent any
    environment {
        REPO_URL = 'https://github.com/vetryselvan1307-design/medusa.git'
        PORT_BACKEND = '9000'
        PORT_FRONTEND = '8000'
    }
    stages {
        stage('Checkout Latest Code') {
            steps {
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('Stop Old Containers') {
            steps {
                sh 'docker-compose down'
            }
        }

        stage('Build New Images') {
            steps {
                sh 'docker-compose build'
            }
        }

        stage('Deploy New Version') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
