#!/bin/bash

apt-get update
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
release=$(lsb_release -sc)
echo "deb https://apt.dockerproject.org/repo ubuntu-$release main" > /etc/apt/sources.list.d/docker.list

apt-get update
apt-cache policy docker-engine

apt-get install -y linux-image-extra-$(uname -r)

apt-get install -y docker-engine

service docker start
docker run hello-world

groupadd docker
usermod -aG docker rakurai
