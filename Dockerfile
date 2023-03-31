FROM ubuntu
RUN  apt update
RUN  apt install -y git wget make golang-go
RUN  wget https://go.dev/dl/go1.19.linux-amd64.tar.gz 
RUN  tar -xvf go1.19.linux-amd64.tar.gz
RUN  mv go /usr/local
RUN mkdir /home/tools/ 
RUN cd /home/tools/
RUN mkdir Leaks_Reports
WORKDIR /home/tools/
RUN  git clone https://github.com/zricethezav/gitleaks.git
WORKDIR /home/tools/gitleaks
ENV  GOROOT=/usr/local/go 
ENV  GOPATH=$HOME/Projects/Proj1
ENV  PATH=$GOPATH/bin:$GOROOT/bin:$PATH 
RUN make build
