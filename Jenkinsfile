pipeline {

  agent any

  environment {
        AWS_ACCOUNT_ID="819346998991"
        AWS_DEFAULT_REGION="us-east-1"
        IMAGE_REPO_NAME="demo"
        IMAGE_TAG="v1"
        REPOSITORY_URI = "819346998991.dkr.ecr.us-east-1.amazonaws.com/demo"
  }
  stages {
      
    stage('Logging into AWS ECR') {
        steps {
            script {
                sh """aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"""
            }    
        }
    }
    stage('Checkout Source') {
        steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'RajeshVE22', url: 'https://github.com/RajeshVE22/nodejsapp.git']]])     
        }
    }

    stage('Build image') {
        steps{
            script {
                dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
            }
        }
    }
    // Uploading Docker images into AWS ECR
    stage('Docker Images Pushing to ECR') {
        steps{  
            script {
                sh """docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"""
                sh """docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"""
            }
        }
    }

    // stage('Deploying App to Kubernetes') {
    //   steps {
    //     script {
    //       kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
    //     }
    //   }
    // }

  }

}
