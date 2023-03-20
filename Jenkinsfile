#!/usr/bin/env groovy
  
pipeline {
    agent any
    parameters {
        string(name:'VERSION', defaultValue:'',description:'Version Prod')
    }
    stages {
        stage('build') {
            steps {
                script {
                    echo "Building the application..."
                }
            }
        }
        stage('test') {
            steps {
                script {
                    echo "Testing the application..."
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    echo "Deploying the application..."
                    echo "deploying version ${params.VERSION}"
                }
            }
        }
    }
}
