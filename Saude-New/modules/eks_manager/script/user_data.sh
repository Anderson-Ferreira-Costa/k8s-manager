#! /bin/bash
yum -y upgrade

curl -LO https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl -f

sudo yum -y remove aws-cli 
sudo yum -y install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --update
rm aws -rf
rm awscliv2.zip -f
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc

curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

sudo yum -y remove golang
curl -LO https://go.dev/dl/go1.21.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.21.4.linux-amd64.tar.gz
rm go1.21.4.linux-amd64.tar.gz -f
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc
go install github.com/awslabs/eks-node-viewer/cmd/eks-node-viewer@latest
sudo mv ~/go/bin/eks-node-viewer /usr/local/bin/
sudo rm go -rf