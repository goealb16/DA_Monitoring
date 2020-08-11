#!/bin/bash

echo "Checking if Docker and Docker-Compose are installed."


VAR=$(docker --version)
if [[ $VAR == *"version"* ]]; 
then
  echo "Docker found."
VAR=$(docker-compose --version)

if [[ $VAR == *"docker-compose version"* ]];
then 
  echo "Docker-Compose found."

else
  echo "downloading Docker-Compose"
  sudo apt-get update
  sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
fi

else
  echo "downloading Docker and Docker-Compose"
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io
  sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
fi

echo "downloading files"
#wget https://github.com/zwepab16/DA_Monitoring/archive/master.zip
#unzip master.zip 
#cd DA_Monitoring-master/
#cd DA/

echo "starting Docker and Docker-Compose"
docker-compose stop
docker-compose up -d
xdg-open  'http://localhost:3000'
#xdg-open 'http://localhost:9090'
#xdg-open 'http://localhost:9100'
#xdg-open 'http://localhost:9093'

