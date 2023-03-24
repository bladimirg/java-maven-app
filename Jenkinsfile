#!/usr/bin/env groovy
@Library('jenkins-shared-lib')
def gv
pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
         stage('increment version') {
            steps {
                script {
                    echo 'incrementing app version...'
                    sh 'mvn build-helper:parse-version versions:set \
                        -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} \
                        versions:commit'
                    def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
                    def version = matcher[0][1]
                    env.IMAGE_NAME = "$version-$BUILD_NUMBER"
                    echo "############ ${IMAGE_REPO}"
                }
            }
        }
 
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
                    buildImage "localhost:5000/${IMAGE_REPO}:${IMAGE_NAME}"
                    dockerLogin()
                    dockerPush "localhost:5000/${IMAGE_REPO}:${IMAGE_NAME}"
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
