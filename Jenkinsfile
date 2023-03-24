#!/usr/bin/env groovy
@Library('jenkins-shared-lib')
def gv
pipeline {
    agent any
    tools {
        maven 'Maven'
    }
        environment {
        ECR_REPO_URL = 'localhost:5000'
        IMAGE_REPO = "${ECR_REPO_URL}/java-maven-app"
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
                    buildImage "${IMAGE_REPO}"
                    dockerLogin()
                    dockerPush "${IMAGE_REPO}"
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

        stage('commit version update') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'gitlab-credentials', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        buildImage "${IMAGE_REPO}"
                        sh 'git config user.email "jenkins@example.com"'
                        sh 'git config user.name "Jenkins"'
                        sh "git remote set-url origin https://${USER}:${PASS}@github.com/bladimirg/java-maven-app.git"
                        sh 'git add .'
                        sh 'git commit -m "ci: version bump"'
                        sh 'git push origin HEAD:jenkins-shared-lib'
                    }
                }
            }
        }

    }
}
