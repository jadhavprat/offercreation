pipeline {
    agent any

    environment {
        IMAGE_NAME = "offercreation-backend"
        // AWS_REGION = "ap-south-1"
        // S3_BUCKET  = "my-image-uploads-pratiksha"
        // S3_PREFIX  = "artifacts/docker-images"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Set Image Tag') {
            steps {
                script {
                    env.IMAGE_TAG = "${env.BUILD_NUMBER}"
                    env.IMAGE_TAR = "${env.IMAGE_NAME}-${env.IMAGE_TAG}.tar"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME%:%IMAGE_TAG% ."
            }
        }

        stage('Save Docker Image') {
            steps {
                bat "docker save %IMAGE_NAME%:%IMAGE_TAG% -o %IMAGE_TAR%"
                archiveArtifacts artifacts: "%IMAGE_TAR%", fingerprint: true
            }
        }

        // Uncomment later for S3 upload
        // stage('Upload to S3') {
        //     steps {
        //         withCredentials([usernamePassword(credentialsId: 'aws-creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
        //             bat """
        //             set AWS_DEFAULT_REGION=%AWS_REGION%
        //             aws s3 cp %IMAGE_TAR% s3://%S3_BUCKET%/%S3_PREFIX%/%IMAGE_TAR%
        //             """
        //         }
        //     }
        // }
    }
}
