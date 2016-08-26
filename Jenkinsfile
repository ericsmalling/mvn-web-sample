node {
   stage 'Checkout'

   git url: 'https://github.com/ericsmalling/mvn-web-sample'
   def mvnHome = tool 'M3'

   stage 'Build'
   sh "${mvnHome}/bin/mvn clean package -B -Dbuild.number=${env.BUILD_NUMBER}"

   stage 'Deploy to Repo'
   sh "${mvnHome}/bin/mvn deploy -B -DaltDeploymentRepository=ci_repo::default::http://repo:8081/artifactory/ci_repo/ -Dbuild.number=${env.BUILD_NUMBER}"
}
