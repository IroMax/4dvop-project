pipeline {
  agent any
  stages {
    stage('Checkout the project'){
      steps {
        checkout scm
        sh 'ls -la'
      }
    }
//    stage('Build api and studentlist app image') {
//      steps {
//        sh 'docker-compose build'
//        sh 'docker images'
//        sh 'docker ps -a'
//      }
//    }
    stage('Deploy infrastructure with Ansible') {
      steps {
        echo 'Hello world'
        sh 'ansible-playbook -i ./deploy/ansible/inventory ./deploy/ansible/4dvop-playbook.yml --tags run-clair-'
      }
    }
    stage('Testing image') {
      steps {
        echo 'Hello world'
      }
    }
    stage('Run simple api container') {
      steps {
        echo 'Hello world'
      }
    }
    stage('Testing the api') {
      steps {
        echo 'Hello world'
      }
    }
    stage('Validate image with Clair') {
      steps {
        echo 'Hello world'
      }
    }
    stage('push images to registry server') {
      steps {
        echo 'Hello world'
      }
    }
    stage('Run security testing with Arachni') {
      steps {
        echo 'Hello world'
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
