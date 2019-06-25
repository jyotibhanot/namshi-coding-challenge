#!/bin/bash -xv

apt-get update
apt-get install python-pip python-dev -y
pip install ansible==2.7.10
cd /tmp
git clone https://github.com/jyotibhanot30/namshi-coding-challenge.git
cd namshi-coding-challenge/ansible
ansible-playbook -i hosts worker.yml --connection local
sleep 5

#Steps to cluster addition.
#1. Retrieve cluster join commandi from master using - kubeadm token create --print-join-command
#2. Run the retrieved cluster join command with sudo user.
