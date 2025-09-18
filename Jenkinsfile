pipeline {
  agent any

//   environment {
//     AWS_REGION = "ap-southeast-1"
    IMAGE_NAME = "offercreation-backend"
    IMAGE_TAG  = "${env.BUILD_NUMBER}"
    IMAGE_TAR  = "${IMAGE_NAME}-${IMAGE_TAG}.tar"
    // S3_BUCKET  = "my-image-uploads-pratiksha"
    // S3_PREFIX  = "artifacts/docker-images"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    // stage('Fetch AWS Credentials from SSM') {
    //   steps {
    //     sh '''
    //       export AWS_DEFAULT_REGION=${AWS_REGION}

    //       AWS_ACCESS_KEY_ID=$(aws ssm get-parameter \
    //         --name "/terraform/aws_access_key_id" \
    //         --with-decryption \
    //         --query "Parameter.Value" \
    //         --output text)

    //       AWS_SECRET_ACCESS_KEY=$(aws ssm get-parameter \
    //         --name "/terraform/aws_secret_access_key" \
    //         --with-decryption \
    //         --query "Parameter.Value" \
    //         --output text)

    //       echo "export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> $WORKSPACE/aws_creds.sh
    //       echo "export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> $WORKSPACE/aws_creds.sh
    //     '''
    //   }
    // }

    stage('Build Docker Image') {
      steps {
        sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
      }
    }

    // stage('Save Docker Image and Upload to S3') {
    //   steps {
    //     sh '''
    //       source $WORKSPACE/aws_creds.sh
    //       export AWS_DEFAULT_REGION=${AWS_REGION}

    //       docker save ${IMAGE_NAME}:${IMAGE_TAG} -o ${IMAGE_TAR}
    //       aws s3 cp ${IMAGE_TAR} s3://${S3_BUCKET}/${S3_PREFIX}/${IMAGE_TAR}
    //     '''
    //   }
    // }
  }

