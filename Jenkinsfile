#!/usr/bin/env groovy
@Library('jenkins-shared-lib')
def gv
pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
 
        stage('init'){
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage('build jar') {
            steps {
                script {
                   buildJar
                   
                }
            }
        }
        stage('build image') {
            steps {
                script {
                    buildImage 'demo-app:jma-3.0'
                    dockerLogin()
                    dockerPush 'localhost:5000/demo-app:jma-3.0'
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    gv.deployApp()
                }
            }
        }
    }
}
