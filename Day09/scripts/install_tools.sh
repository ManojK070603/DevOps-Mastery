#!/bin/bash

echo "===================================="
echo "       INSTALL DEVOPS TOOLS"
echo "===================================="

PACKAGES=(
    git
    curl
    wget
    openjdk-21-jdk
    maven
)

echo
echo "Updating package lists..."

sudo apt update

echo
echo "Installing DevOps tools..."

sudo apt install -y "${PACKAGES[@]}"

echo
echo "Installation completed."

echo
echo "Verifying tools..."

git --version
java -version
mvn -version
curl --version | head -n 1
wget --version | head -n 1

echo
echo "All requested tools have been processed."
