pipeline {
  environment {
    registry = "cloudmonster123/docker"
    registryCredential = 'docker-hub'
    dockerImage = ''
  }
  agent any
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
          sh '`cd $JENKINS_HOME/kuberntes-cicd/src/`'
          dockerImage = docker.build registry + ":v$BUILD_NUMBER"
        }
      }
    }
    stage('Push Image') {
      steps{
        script {
          sh '`cd $JENKINS_HOME/kuberntes-cicd/src/`'
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }  
      }
    }
    stage('Deploy chart'){
      steps{
         sh '`cd $JENKINS_HOME/kuberntes-cicd/charts`'
         sh 'helm install nginx --name-template=nginx --set.image.tag=v$BUILD_NUMBER'
}

}
  }
}
