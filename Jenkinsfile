pipeline {
  agent any
  stages {
    stage('Checkout the project'){
      steps {
        checkout scm
        sh 'ls -la'
      }
    }
    stage('Deploy registry') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory2 ./deploy/ansible/4dvop-playbook.yml --tags deploy-registry'
      }
    }
    stage('Build api') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory2 ./deploy/ansible/4dvop-playbook.yml --tags build-simple-api-and-website'
      }
    }
    stage('Run api container') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory2 ./deploy/ansible/4dvop-playbook.yml --tags run-simple-api'
      }
    }
    stage('Test api ans stop containers') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory2 ./deploy/ansible/4dvop-playbook.yml --tags test-simple-api-stop'
      }
    }
    stage('Validate image with Clair') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory2 ./deploy/ansible/4dvop-playbook.yml --tags clair'
      }
    }
  }
  post{
      always{
        //echo 'delete working directory at the end'
        //deleteDir()
        //sh 'ls -la'
        sh 'pwd'
        //echo 'clean docker images and containers'
        //sh 'docker ps -a -q'
        //sh 'docker rm -f $(docker ps -a -q)'
        //sh 'docker images'
        //sh 'docker rmi -f $(docker images -a -q)'
      }
      success{
        echo "====++++Successfully completed++++===="
      }
  }
}
