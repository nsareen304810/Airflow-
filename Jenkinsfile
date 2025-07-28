pipeline {
  agent any

  environment {
    IMAGE = "quay.io/your-org/apache-airflow:2.8.1"
    NAMESPACE = "cpairflow"
  }

  stages {
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE -f docker/Dockerfile .'
      }
    }

    stage('Push to Quay') {
      steps {
        sh 'docker push $IMAGE'
      }
    }

    stage('Deploy to OpenShift') {
      steps {
        script {
          openshift.withCluster() {
            openshift.withProject(NAMESPACE) {
              openshift.apply(file: 'manifests/airflow-deployment.yaml')
              openshift.apply(file: 'manifests/airflow-service.yaml')
              openshift.apply(file: 'manifests/airflow-web-route.yaml')
            }
          }
        }
      }
    }
  }
}
