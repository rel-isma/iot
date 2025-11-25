#!/bin/bash
# Update packages and install curl
sudo apt-get update
sudo apt-get install -y curl

# Install K3s as a server (controller)
# --bind-address="192.168.56.110" <-- This is our IPv4 fix
curl -sfL https://get.k3s.io | sh -s - server \
    --bind-address="192.168.56.110" \
    --node-ip="192.168.56.110" \
    --write-kubeconfig-mode="644"

# Wait for K3s to be ready
sleep 10

# Save the node-token to the shared /vagrant folder
cat /var/lib/rancher/k3s/server/node-token > /vagrant/node-token