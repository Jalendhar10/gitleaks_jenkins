node('gitleaks_image') {
   try{
        stage('SCM-checkout') {
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], \
                                userRemoteConfigs: [[credentialsId: 'admingithub', url: 'git@github.com:gem-abhay/gitleaks_jenkins.git']]])
                }
        stage('Permission'){
              sh"chmod +x FinalScript.sh"
        }
        stage('gitleak'){
          container('gitleaks-runner'){
            sh'''./FinalScript.sh'''
            echo ${reports_dir}
          }
  }
   } catch (Exception Error){
           echo "${Error}"
        }
}
