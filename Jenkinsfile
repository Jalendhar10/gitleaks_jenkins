node('gitleaks_image') {
   try{
        stage('SCM-checkout') {
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], \
                                userRemoteConfigs: [[credentialsId: 'jenkins_token', url: 'https://github.com/Jalendhar10/gitleaks_jenkins.git']]])
                }
        stage('Permission'){
              sh"chmod +x FinalScript.sh"
        }
        stage('gitleak'){
          container('gitleaks-runner'){
            sh 'ls -la'
             sh'pwd'
            sh'''./FinalScript.sh'''
            sh 'echo current_report=/home/tools/report_leaks > report.json'
            archiveArtifacts artifacts: 'build.properties', onlyIfSuccessful: true
          }
  }
   } catch (Exception Report) {
      echo ${report}
   }
}
