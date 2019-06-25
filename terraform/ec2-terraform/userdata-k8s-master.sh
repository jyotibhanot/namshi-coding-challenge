#!/bin/bash -xv

apt-get update
apt-get install python-pip python-dev -y
pip install ansible==2.7.10
cd /tmp
git clone https://github.com/jyotibhanot30/namshi-coding-challenge.git
cd namshi-coding-challenge
ansible-playbook -i hosts master.yml --connection local
sleep 5

# -------Running get nodes------
kubectl --kubeconfig=/etc/kubernetes/admin.conf get nodes

# -------Generating new token for worker------
kubeadm token create --print-join-command
