#!/usr/bin/env groovy

parameters{
    string(name:'VERSION',defaultValue:'',description:'')
}    
tools{
    'Maven'
}    
pipeline {
    agent any
    paramters {
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
