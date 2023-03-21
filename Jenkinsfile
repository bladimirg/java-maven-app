#!/usr/bin/env groovy
@Library('jenkins-shared-lib')
def gv
pipeline {
    agent any
    parameters {
        choice(name:'VERSION', choices:['1.0.1','1.2.0'],description:'Version Prod')
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
                   buildJar()
                   
                }
            }
        }
        stage('build image') {
            steps {
                script {
                    buildImage()
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    gv.deployApp()
                    echo "deploying version ${params.VERSION}"
                }
            }
        }
    }
}
