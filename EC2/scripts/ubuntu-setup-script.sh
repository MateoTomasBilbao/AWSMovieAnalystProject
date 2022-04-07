#!/bin/bash
if [ $(id -u) -eq 0 ]; then
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y cloud-utils apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -aG docker ubuntu

curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

sudo apt install net-tools

cd /home/ubuntu/
sudo git clone https://github.com/MateoTomasBilbao/AWSMovieAnalystProject.git
cd /home/ubuntu/AWSMovieAnalystProject/

IP=$(curl http://checkip.amazonaws.com)
echo "DB_HOST=$IP" >> .env
echo "BACKEND_URL=$IP" >> .env


docker login -u alvamateo -p Lesliegainingcapital$1488
docker-compose up -d
else
echo "No root"
exit
fi