pipeline {
    agent any

    environment {
        // Define the JFrog Container Registry URL
        JCR_URL = 'http://192.168.1.10:8082/artifactory'
        // Define the name of your repository in JFrog Container Registry
        REPOSITORY_NAME = 'book-ui'
        // Define the Docker image name
        DOCKER_IMAGE_NAME = 'book-ui'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                // Checkout the source code from your repository
                git 'https://github.com/younan7/book-direct.git'
                
                // Build the Docker image
                script {
                    docker.build("${env.JCR_URL}/${env.REPOSITORY_NAME}/${env.DOCKER_IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to JFrog Container Registry') {
            steps {
                script {
                    // Login to JFrog Container Registry
                    docker.withRegistry(env.JCR_URL, 'your-jcr-credentials-id') {
                        // Push the Docker image to JFrog Container Registry
                        docker.image("${env.JCR_URL}/${env.REPOSITORY_NAME}/${env.DOCKER_IMAGE_NAME}:latest").push('latest')
                    }
                }
            }
        }
    }
}
