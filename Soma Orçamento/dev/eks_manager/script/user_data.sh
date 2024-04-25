#! /bin/bash
 
yum -y upgrade
 
curl -LO https://dl.k8s.io/release/v1.28.0/bin/linux/amd64/kubectl 
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

sudo yum remove aws-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
unzip awscliv2.zip 
sudo ./aws/install 
rm aws -rf 
rm awscliv2.zip -f
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc source ~/.bashrc

curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash