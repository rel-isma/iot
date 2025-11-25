#!/bin/bash
# Update packages and install curl + netcat
sudo apt-get update
sudo apt-get install -y curl netcat-openbsd

# --- Wait for Server API to be ready ---
# This loop will run until the server's port 6443 is open
while ! nc -z 192.168.56.110 6443; do
  echo "Waiting for server API (192.168.56.110:6443) to be ready..."
  sleep 2
done
echo "Server API is ready!"
# --- End Wait Step ---

# Read the token from the shared folder
K3S_TOKEN=$(cat /vagrant/node-token)

# Install K3s as an agent
curl -sfL https://get.k3s.io | sh -s - agent \
    --server https://192.168.56.110:6443 \
    --token ${K3S_TOKEN} \
    --node-ip="192.168.56.111"