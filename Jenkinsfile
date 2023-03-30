node('gitleaks_image') {
        stage('SCM-checkout') {
                dir('gitleaks'){
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], \
                                userRemoteConfigs: [[credentialsId: 'admingithub', url: 'git@github.com:gem-abhay/gitleaks_jenkins.git']]])
                }
                }
        stage('Permission'){
           dir('gitleaks'){
              sh"chmod +x FinalScript.sh"
        }
        }
        stage('gitleak'){
                dir('gitleaks'){
          container('gitleaks-runner'){
            sh'''./FinalScript.sh'''
          }
                }
  }
        }
