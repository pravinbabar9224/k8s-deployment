pipeline {
  environment {
    registry = "cloudmonster123/docker"
    registryCredential = 'docker-hub'
    dockerImage = ''
  }
  agent {
       label 'slave1'
  }
  stages {
    stage('Cleaning Workspace') {
        steps {
          deleteDir()
        }
    }
    stage('Cloning Git') {
      steps {
         git 'https://github.com/pravinbabar9224/k8s-deployment.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          sh 'cd src/'
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          sh 'cd src/'
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }  
      }
    }
  }
}
