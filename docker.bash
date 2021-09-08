#!/bin/bash

#Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

#Set up the repository
sudo apt-get update -y

sudo apt-get install -y \
            apt-transport-https \
            ca-certificates \
            curl \
            gnupg \
            lsb-release
#Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o --yes /usr/share/keyrings/docker-archive-keyring.gpg

#Command to set up the stable repository
echo \ "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Install Docker Engine
sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io -y
