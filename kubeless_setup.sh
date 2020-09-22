#!/bin/bash

#Kubeless namespace
kubectl create ns kubeless
kubectl create -f https://github.com/kubeless/kubeless/releases/download/v1.0.7/kubeless-v1.0.7.yaml

export OS=$(uname -s| tr '[:upper:]' '[:lower:]')
#curl -OL https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless_$OS-amd64.zip && \
#  unzip kubeless_$OS-amd64.zip && \
#  sudo mv bundles/kubeless_$OS-amd64/kubeless /usr/local/bin/

curl -OL https://github.com/kubeless/kubeless/releases/download/v1.0.7/kubeless_linux-amd64.zip && \
  unzip kubeless_linux-amd64.zip && \
  sudo mv bundles/kubeless_linux-amd64/kubeless /usr/local/bin/

echo -e "\e[93mKubeless has been installed successfully.\e[0m"
echo -e "\e[93mIt is necessary to reboot to complete this operation.\e[0m"
echo -e "\e[93mSave everything before proceed.\e[0m"
read -p "Press anything to continue..." REBOOT_INPUT_FASE_I
    case $REBOOT_INPUT_FASE_I in
        * )
            sudo reboot
        ;;
    esac
