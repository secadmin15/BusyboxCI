node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') { // build and tag docker image
        steps {
            echo 'Starting to build docker image'

            script {
                def dockerfile = 'Dockerfile'
                def customImage = docker.build('ec2-43-204-10-182.ap-south-1.compute.amazonaws.com:8082/ge-docker-dev-local/busybox', "-f ${dockerfile} .")

            }
        }
    }

    stage('Test image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

/*    stage ('Push image to Artifactory') { // take that image and push to artifactory
       steps {
            rtDockerPush(
                serverId: "artifactory",
                image: "ec2-43-204-10-182.ap-south-1.compute.amazonaws.com:8082/os/busybox:latest",
                host: 'tcp://43.204.10.182:8082',
                targetRepo: 'ge-docker-dev-local', // where to copy to (from docker-virtual)
                // Attach custom properties to the published artifacts:
                properties: 'project-name=docker1;status=stable'
            )
        }
    } */
    
}
