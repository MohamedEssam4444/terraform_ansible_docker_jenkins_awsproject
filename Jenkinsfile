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
          withCredentials([sshUserPrivateKey(
                    credentialsId: 'b8754ead-af36-4de8-b252-1070ae83cac4',
                    keyFileVariable: 'KEY_FILE')]) {
                 sh """ UserKnownHostsFile=/dev/null ssh -i ~/.ssh/authorized_keys -tt ubuntu@ -o StrictHostKeyChecking=no<< EOF 
                 sudo docker run -dit --name sidiali -p 8000:8000 sidiali/python_repo:pythonapp
                 exit
                 EOF"""  
               }
             }
         }
    }
  }
