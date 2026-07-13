#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "====================================================="
echo "   MikroTik CHR Installer for Ubuntu (Safe Mode)    "
echo "====================================================="

# 1. Update system package lists
echo "--> Updating package lists..."
sudo apt update -y

# 2. Install QEMU virtualization tools
echo "--> Installing QEMU and utilities..."
sudo apt install qemu-system-x86 qemu-utils unzip wget -y

# 3. Create directory
echo "--> Creating MikroTik directory..."
mkdir -p ~/mikrotik
cd ~/mikrotik

# 4. Download and extract MikroTik CHR
if [ ! -f "chr-7.15.img" ]; then
    echo "--> Downloading MikroTik CHR v7.15..."
    wget https://download.mikrotik.com/routeros/7.15/chr-7.15.img.zip
    echo "--> Extracting image..."
    unzip chr-7.15.img.zip
    rm chr-7.15.img.zip
else
    echo "--> MikroTik image already exists, skipping download."
fi

# 5. Launching the instance
echo "--> Launching MikroTik CHR in the background..."
sudo qemu-system-x86_64 -m 2G -smp 2 -machine accel=tcg \
  -drive file=chr-7.15.img,if=virtio,format=raw \
  -netdev user,id=n1,hostfwd=tcp::8291-:8291,hostfwd=tcp::2222-:22 \
  -device virtio-net-pci,netdev=n1 \
  -display none -daemonize

echo "====================================================="
echo "✅ SUCCESS: MikroTik is running!"
echo "👉 You can now connect via WinBox using your Server IP"
echo "⚠️  Default login is 'admin' with NO password."
echo "====================================================="