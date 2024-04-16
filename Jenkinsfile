pipeline {
  agent any
  stages {
    stage('Build Docker Image') {
      steps {
        git 'https://github.com/jyounan7/book-direct.git'
        script {
          docker.build("${env.JCR_URL}/${env.REPOSITORY_NAME}/${env.DOCKER_IMAGE_NAME}:latest")
        }

      }
    }

    stage('Push to JFrog Container Registry') {
      steps {
        script {
          docker.withRegistry(env.JCR_URL, 'jcr') {
            // Push the Docker image to JFrog Container Registry
            docker.image("${env.JCR_URL}/${env.REPOSITORY_NAME}/${env.DOCKER_IMAGE_NAME}:latest").push('latest')
          }
        }

      }
    }

  }
  environment {
    JCR_URL = 'http://192.168.1.10:8082/artifactory'
    REPOSITORY_NAME = 'book-ui'
    DOCKER_IMAGE_NAME = 'book-ui'
  }
}
