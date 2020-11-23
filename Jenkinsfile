pipeline {
  agent any
  stages {

    stage('build docker image') {
      steps {
        withCredentials(bindings: [[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
          sh '''
              docker build -t sidiali/python_repo:pythonapp .
             '''
        }

      }
    }

    stage('push docker image to dockerhub repository') {
      steps {
        withCredentials(bindings: [[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
          sh '''
               docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
               docker push sidiali/python_repo:pythonapp 
               '''
        }

      }
    }
    stage('deploy docker container to webserver using ssh') {
      steps {
        script {
                    
                 sh """ssh -tt ubuntu@172.31.5.96 << EOF 
                 sudo docker run -dit --name sidyali -p 8000:8000 sidiali/python_repo:pythonapp
                 exit
                 EOF"""  
               }
             }
         }
     }
 }
