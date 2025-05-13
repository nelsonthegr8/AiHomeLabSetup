#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

step() {
  echo -e "\n${GREEN}➡️  $1${NC}"
}

step "Updating and upgrading packages..."
sudo apt update && sudo apt upgrade -y

step "Installing Docker and Docker Compose..."
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER

step "Installing OpenSSH server..."
sudo apt install -y openssh-server

step "Installing other CLI tools: curl, git, htop, tmux..."
sudo apt install -y curl git htop tmux

step "Enabling Docker service..."
sudo systemctl enable docker

step "Starting SSH service..."
sudo service ssh start

step "Installing Ollama ..."
curl -fsSL https://ollama.com/install.sh | sh

step "Pulling and running Open WebUI container..."
sudo docker run -d --network=host \
  -v open-webui:/app/backend/data \
  -e OLLAMA_BASE_URL=http://127.0.0.1:11434 \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main

step "Showing running Docker containers..."
sudo docker ps
