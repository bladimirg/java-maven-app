#!/usr/bin/env groovy
define gv
pipeline {
    agent any
    parameters {
        choice(name:'VERSION', choices:['1.0.1','1.2.0'],description:'Version Prod')
    }
    stages {
        stage('build') {
            steps {
                script {
                    gv = load "script.groovy"
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
