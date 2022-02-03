#!/usr/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

echo "Installing tooling"
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo apt install byobu
sudo apt install htop vim tig

echo "Added user to docker group"
sudo usermod -a -G docker abourget
sudo usermod -a -G docker julien
sudo usermod -a -G docker solana
sudo usermod -a -G docker stepd
sudo usermod -a -G docker colin
sudo usermod -a -G docker billettc

echo "create app content"
mkdir -p ~/app
cp config.yaml ~/app/config.yaml
cp download.sh ~/app/download.sh
cp identity.json ~/app/identity.json
cp start.sh ~/app/start.sh
cp monitor.sh ~/app/monitor.sh

chmod a+x ~/app/download.sh
chmod a+x ~/app/start.sh
chmod a+x ~/app/monitor.sh
