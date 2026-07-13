#!/bin/bash
set -e

echo "====================================================="
echo "   MikroTik CHR Installer for Ubuntu (Safe Mode)    "
echo "====================================================="

# 1. Update and install QEMU tools
sudo apt update -y
sudo apt install qemu-system-x86 qemu-utils unzip wget curl -y

# 2. Create a global installation directory
sudo mkdir -p /opt/mikrotik
cd /opt/mikrotik

# 3. Download MikroTik CHR
if [ ! -f "chr-7.15.img" ]; then
    echo "--> Downloading MikroTik CHR..."
    sudo wget https://download.mikrotik.com/routeros/7.15/chr-7.15.img.zip
    sudo unzip chr-7.15.img.zip
    sudo rm chr-7.15.img.zip
fi

# 4. Download and install your custom CLI tool
echo "--> Installing 'mikrotik-manage' command..."
sudo curl -sSL https://raw.githubusercontent.com/vahidtakro/ubuntu-to-mikrotik/main/mikrotik-manage -o /usr/local/bin/mikrotik-manage
sudo chmod +x /usr/local/bin/mikrotik-manage

# 5. Start the server using your new command!
sudo mikrotik-manage start

echo "====================================================="
echo "✅ SUCCESS: MikroTik is running!"
echo "👉 Manage your server at any time by typing: mikrotik-manage"
echo "====================================================="