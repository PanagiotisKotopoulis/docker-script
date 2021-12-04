#!/bin/bash

echo "Do you want to install Docker Engine on Ubuntu? [y,n]"
read input
# did we get an input value?
if [ "$input" == "" ]; then
   echo "Nothing was entered by the user"

# was it a y or a yes?
elif [[ "$input" == "y" ]] || [[ "$input" == "yes" ]]; then

   echo "Here we go AGAIN"
# Uninstall old versions
   sudo apt-get remove docker docker-engine docker.io containerd runc
# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
   sudo apt-get update
   sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
# Add Docker’s official GPG key:
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io
   sudo docker run hello-world
 
# treat anything else as a negative response
else
   echo "cya later aligator"

fi
