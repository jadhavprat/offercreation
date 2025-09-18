pipeline {
  agent any

  environment {
    IMAGE_NAME = "offercreation-backend"
    // Cannot directly reference env.BUILD_NUMBER in environment; set later in `script`
    AWS_REGION = "ap-southeast-1"
    S3_BUCKET  = "my-image-uploads-pratiksha"
    S3_PREFIX  = "artifacts/docker-images"
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
          // Set dynamic variables in Groovy script block
          env.IMAGE_TAG = "${env.BUILD_NUMBER}"
          env.IMAGE_TAR = "${env.IMAGE_NAME}-${env.IMAGE_TAG}.tar"
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        sh "docker build -t ${env.IMAGE_NAME}:${env.IMAGE_TAG} ."
      }
    }

    // Uncomment when ready
    // stage('Save Docker Image and Upload to S3') {
    //   steps {
    //     sh '''
    //       docker save ${IMAGE_NAME}:${IMAGE_TAG} -o ${IMAGE_TAR}
    //       aws s3 cp ${IMAGE_TAR} s3://${S3_BUCKET}/${S3_PREFIX}/${IMAGE_TAR}
    //     '''
    //   }
    // }
  }
}
