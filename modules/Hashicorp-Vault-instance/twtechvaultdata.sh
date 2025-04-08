#!/bin/bash
# Switch to root user
sudo -i
# set hostname to Hashicorp-vault
sudo hostnamectl set-hostname Hashicorp-vault
# Step 1 - Add PGP for the package signing key. 
sudo apt update -y 
# install the required packages & dependencies
sudo apt install software-properties-common passwd
sudo apt install dnf
# To install HashiCorp tools (e.g., Terraform, Vault, Packer) on Ubuntu, follow the official APT-based method
# 1. Add the HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# 2. Add the official HashiCorp Linux repo
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# 3. Update and install
sudo apt update
sudo apt install terraform  # or vault, packer, etc.

# install Hashicorp Vault on ubuntu flavor
sudo apt -y install vault

# Set Up TLS
sudo mkdir /home/vault/
sudo chown -R vault:vault /home/vault

# Verify installation
# vault -version
