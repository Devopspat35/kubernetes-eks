#!/bin/bash
# Switch to root user
sudo -i
# set hostname to Hashicorp-vault
sudo hostnamectl set-hostname Hashicorp-vault
# Step 1 - Add PGP for the package signing key. 
sudo apt update -y 
sudo apt install gpg
# Step 2 - Add the HashiCorp GPG key.
wget O https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg 
# Step 3 - Verify the key's fingerprint. 
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint 
# Step 4 - Add the official HashiCorp Linux repository. 
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
# Step 5 -  install vault. 
sudo snap install vault --classic

# verify vault
# vault --version
