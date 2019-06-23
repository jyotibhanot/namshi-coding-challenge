sudo apt-get remove kubeadm kubelet kubectl -y
sudo apt-get purge kubeadm kubelet kubectl -y
sudo apt-get autoremove -y
sudo rm -rf /root/node_joined.txt
