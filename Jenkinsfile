pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/vetryselvan1307-design/medusa.git'
        PROJECT_ROOT = "${WORKSPACE}"  // root folder in Jenkins
    }

    stages {
        stage('Checkout Latest Code') {
            steps {
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('Stop Old Containers') {
            steps {
                dir("${PROJECT_ROOT}") {
                    sh 'docker-compose down'
                }
            }
        }

        stage('Build New Images') {
            steps {
                dir("${PROJECT_ROOT}") {
                    sh 'docker-compose build'
                }
            }
        }

        stage('Deploy New Version') {
            steps {
                dir("${PROJECT_ROOT}") {
                    sh 'docker-compose up -d'
                }
            }
        }
    }

    post {
        success {
            echo "Deployment successful!"
        }
        failure {
            echo "Deployment failed!"
        }
    }
}
