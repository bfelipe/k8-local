#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install build-essential curl -y

sudo apt-get install virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso -y
sudo apt-get install virtualbox-dkms virtualbox-guest-dkms -y

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Kubectl Binary
#curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
#chmod +x ./kubectl
#sudo mv ./kubectl /usr/local/bin/kubectl
#kubectl version --client

# Kubeclt Apt
#sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
#sudo apt-get update
#sudo apt-get install -y kubectl

# Kubeclt Snap
snap install kubectl --classic
kubectl version --client

minikube start

kubectl get nodes