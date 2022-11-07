#!/bin/bash

## install prerequisites packages
echo "Updating system, installing requirements and setup folder tree"
sudo apt update
sudo apt install git ansible ssh-askpass sshpass openssh-server python3-pip -y
sudo -H pip install -Iv 'resolvelib<0.6.0'
ansible-galaxy collection install community.general
ansible-galaxy install staticdev.signal

mkdir ~/.ssh/
mkdir -p ~/git/perso

## get ssh key 
echo "Fetching ssh key needs one manual action, Browser will open"
sleep 2
firefox https://nextcloud.vgr.pw/s/fozEKZ4k8MmZzYs#
sleep 20s
read -sp 'Password: ' zippass
cd ~/Downloads/

unzip -P $zippass ssh-id.zip

cp ~/Downloads/id_ed25519 ~/.ssh/
cp ~/Downloads/id_ed25519.pub ~/.ssh/
cp ~/Downloads/config ~/.ssh/config

sed -i "1 i\Host localhost 127.0.0.1\n  user $USER" ~/.ssh/config

## get productivity repo
echo "Fetching ansible repo to perform setup" 
git clone git@github.com:TH3VenGeuR/laptop-productivity-setup.git ~/git/perso/laptop-productivity-setup.git
cd ~/git/perso/laptop-productivity-setup

git clone https://github.com/geerlingguy/ansible-role-docker.git ~/git/perso/laptop-productivity-setup/roles/geerlingguy.docker

