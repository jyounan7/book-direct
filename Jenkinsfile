pipeline {
    agent any
    
    environment {
        JFROG_CREDS = credentials('jcr')
        DOCKER_IMAGE_NAME = 'test'
        JFROG_URL = 'http://192.168.1.10:8081/artifactory'
        REPOSITORY_NAME = 'book-ui'
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                git 'https://github.com/jyounan7/book-direct.git'
                script {
                    // Build Docker image
                    docker.build("${DOCKER_IMAGE_NAME}:latest", "-f Dockerfile .")
                }
            }
        }
        

