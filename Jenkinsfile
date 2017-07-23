pipeline {
   agent {
      docker {
         image "maven:3.5.0-jdk-8"
         args '--link repo --net jenkinscompose_default'
      }
   }
   stages{
      stage ('Build') {
         steps {
            sh "mvn clean package -B -Dbuild.number=${env.BUILD_NUMBER}"
         }
      }
   }
}
