node('gitleaks_image') {
        stage('SCM-checkout') {
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], \
                                userRemoteConfigs: [[credentialsId: 'admingithub', url: 'git@github.com:gem-abhay/gitleaks_jenkins.git']]])
                }
        Stage('Permission'){
              sh"chmod +x FinalScript.sh"
        }
        stage('gitleak'){
          container('gitleaks-runner'){
            sh"./FinalScript.sh"
          }
  }
        }