pipeline {
    agent any
    
    environment {
        JFROG_CREDS = credentials('jcr')
        DOCKER_IMAGE_NAME = tes'
        JFROG_URL = 'http://192.168.1.10:8081/artifactory'
        REPOSITORY_NAME = 'book-ui'
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                git 'https://github.com/jyounan7/book-direct.git'
                script {
                    docker.build("${DOCKER_IMAGE_NAME}:latest", "-f Dockerfile .")
                }
            }
        }
        
        stage('Push to JFrog Artifactory') {
            steps {
                script {
                    docker.withRegistry(JFROG_URL, JFROG_CREDS) {
                        docker.image("${DOCKER_IMAGE_NAME}:latest").push("${JFROG_URL}/${REPOSITORY_NAME}/${DOCKER_IMAGE_NAME}:latest")
                    }
                }
            }
        }
    }
}
