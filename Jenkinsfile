pipeline {
   agent { docker "maven:3.5.0-jdk-8"}
   stages{
      stage ('Build') {
         steps {
            sh "mvn clean package -B -Dbuild.number=${env.BUILD_NUMBER}"
         }
      }
      stage ('Deploy to Repo') {
         steps {
            sh "mvn deploy -B -DaltDeploymentRepository=ci_repo::default::http://repo:8081/artifactory/ci_repo/ -Dbuild.number=${env.BUILD_NUMBER}"
         }
      }
   }
}
