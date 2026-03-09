pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/vetryselvan1307-design/medusa.git'
        BACKEND_DIR = 'my-medusa-store'
        STOREFRONT_DIR = 'my-medusa-store-storefront'
        BACKEND_PORT = '9000'
        FRONTEND_PORT = '5173'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('Stop Existing Containers') {
            steps {
                dir("${BACKEND_DIR}") {
                    sh 'docker-compose down || true'
                }
                dir("${STOREFRONT_DIR}") {
                    sh 'docker-compose down || true'
                }
            }
        }

        stage('Build Docker Images') {
            steps {
                dir("${BACKEND_DIR}") {
                    sh 'docker-compose build'
                }
                dir("${STOREFRONT_DIR}") {
                    sh 'docker-compose build'
                }
            }
        }

        stage('Deploy Backend') {
            steps {
                dir("${BACKEND_DIR}") {
                    sh 'docker-compose up -d'
                }
            }
        }

        stage('Deploy Frontend') {
            steps {
                dir("${STOREFRONT_DIR}") {
                    // Ensure frontend binds to 0.0.0.0
                    sh 'docker-compose up -d'
                }
            }
        }
    }

    post {
        success {
            echo "Backend and Frontend deployed successfully!"
        }
        failure {
            echo "Deployment failed. Check logs."
        }
    }
}
