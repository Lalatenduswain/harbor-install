#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Function to check if a package is installed
check_package() {
    dpkg -l | grep -qw "$1" && echo "$1: Installed" || echo "$1: Not Installed"
}

# Function to check if Docker is functional
check_docker() {
    if command -v docker >/dev/null 2>&1 && docker --version >/dev/null 2>&1; then
        echo "[INFO] Docker is installed and functional."
        return 0
    else
        echo "[INFO] Docker is not installed or not functional."
        return 1
    fi
}

echo "[INFO] Checking required packages..."
check_package docker-ce
check_package docker-ce-cli
check_package containerd.io
check_package containerd

# Check if Docker is already set up correctly
if check_docker; then
    echo "[INFO] Docker setup is already complete. Skipping Docker installation..."
else
    # Remove conflicting containerd package if present
    if dpkg -l | grep -qw "containerd"; then
        echo "[WARNING] Detected containerd package, which conflicts with containerd.io. Removing..."
        sudo apt remove --purge -y containerd
        sudo apt autoremove -y
    fi

    # Clean up conflicting Docker packages only if they exist
    echo "[INFO] Checking for conflicting Docker packages..."
    if dpkg -l | grep -qw "docker.io"; then
        echo "[WARNING] Removing conflicting docker.io package..."
        sudo apt remove --purge -y docker.io
    fi

    # Add Docker’s official GPG key and repository (idempotent, so safe to rerun)
    echo "[INFO] Setting up Docker repository..."
    sudo apt update
    sudo apt install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update package lists and fix broken dependencies
    sudo apt update && sudo apt install -f -y

    # Install Docker CE, CLI, containerd.io, and Docker Compose plugin
    echo "[INFO] Installing Docker components..."
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin || {
        echo "[ERROR] Failed to install Docker components. Attempting to fix dependencies..."
        sudo apt --fix-broken install -y
        sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    }

    # Enable and start Docker service
    sudo systemctl enable docker
    sudo systemctl start docker
fi

# Verify Docker installation
echo "[INFO] Verifying Docker installation..."
docker --version

# Verify Docker Compose installation
if command -v docker-compose >/dev/null 2>&1 || docker compose version >/dev/null 2>&1; then
    echo "[INFO] Docker Compose is installed."
else
    echo "[INFO] Installing Docker Compose plugin..."
    sudo apt install -y docker-compose-plugin
fi
docker compose version

# Check if port 8989 is in use (Harbor's configured port)
if sudo netstat -tulnp | grep -q ':8989'; then
    echo "[ERROR] Port 8989 is in use. Please change Harbor's port or stop the service using port 8989."
    exit 1
fi

# Check if Harbor is already downloaded and extracted
if [ -d "harbor" ]; then
    echo "[INFO] Harbor directory already exists. Skipping download and extraction..."
else
    # Download and extract Harbor installer
    echo "[INFO] Downloading Harbor installer..."
    curl -LO https://github.com/goharbor/harbor/releases/download/v2.9.0/harbor-online-installer-v2.9.0.tgz
    tar -xvf harbor-online-installer-v2.9.0.tgz
fi

# Copy and modify harbor.yml
echo "[INFO] Configuring Harbor..."
cd harbor
cp harbor.yml.tmpl harbor.yml

# Modify harbor.yml with sed
sed -i 's/^hostname:.*/hostname: localhost/' harbor.yml
sed -i 's/^  port:.*/  port: 8989/' harbor.yml
sed -i 's/^harbor_admin_password:.*/harbor_admin_password: "SuperSecretPassword"/' harbor.yml
sed -i 's/^https:/# https:/g' harbor.yml
sed -i 's/^  port: 443/#   port: 443/g' harbor.yml
sed -i 's|^  certificate:.*|#   certificate: /your/cert/path|g' harbor.yml
sed -i 's|^  private_key:.*|#   private_key: /your/key/path|g' harbor.yml

# Create required directories
sudo mkdir -p /opt/harbor/data

# Check for and remove conflicting container named "registry"
if docker ps -a --format '{{.Names}}' | grep -q '^registry$'; then
    echo "[WARNING] Existing container named 'registry' detected. Removing it to avoid conflict..."
    docker rm -f registry
fi

# Install and start Harbor
echo "[INFO] Installing and starting Harbor..."
sudo ./install.sh

echo "[INFO] Harbor installation complete. Access Harbor UI at: http://localhost:8989"
echo "[INFO] Login with username: admin and password: SuperSecretPassword"
