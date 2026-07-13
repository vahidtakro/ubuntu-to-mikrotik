# 🚀 Safe MikroTik CHR Installer for Ubuntu Server

A lightweight, non-destructive script to install and run **MikroTik RouterOS (CHR)** on an existing Ubuntu Server using QEMU emulation.

⚠️ **Why use this?** Most scripts on the internet use the `dd` command, which **wipes your entire hard drive**, deleting Ubuntu and all your apps. This script runs MikroTik safely inside a lightweight background process, keeping your original Ubuntu setup 100% intact.

---

## ⚡ Features
- **Zero Data Loss:** Runs safely alongside your existing Ubuntu apps, websites, and Docker containers.
- **VPS Compatible:** Uses software emulation (`accel=tcg`), meaning it works perfectly on AWS, DigitalOcean, Linode, or Vultr without needing nested virtualization.
- **Optimized Performance:** Allocates 2 GB RAM and 2 CPU cores for smooth routing.
- **WinBox Ready:** Automatically maps WinBox port `8291` and SSH port `2222`.

---

## 🛠️ Quick One-Line Installation

Run the following command on your Ubuntu server to download and execute the setup automatically:

```bash
curl -sSL [https://raw.githubusercontent.com/vahidtakro/ubuntu-to-mikrotik/main/install.sh](https://raw.githubusercontent.com/vahidtakro/ubuntu-to-mikrotik/main/install.sh) | bash
```

---

## 🖥️ How to Connect via WinBox

1. Open **WinBox** on your local machine.
2. Enter your **Ubuntu Server's IP address** in the *Connect To* field.
3. Login as `admin` and leave the password completely **blank**.
4. Click **Connect** and set a strong password immediately!

---

## ⚙️ Management Commands

### Check if MikroTik is running:
```bash
ps aux | grep qemu
```

---

### Stop the MikroTik server:
```bash
sudo kill $(pgrep qemu-system-x86)
```

---

### ⭐ Support & Contributions
If this script saved your server from being accidentally wiped, please give it a Star! Feel free to open issues or submit pull requests to improve the script.

---

### 👑 Secret Tips to Become Popular on GitHub

1. **Pick a Catchy Repo Name:** Name it something descriptive yet simple like `ubuntu-safe-mikrotik` or `mikrotik-on-ubuntu-safe`.
2. **Add Topics/Tags:** On the right side of your GitHub repo, click the gear icon next to "About" and add tags like: `mikrotik`, `routeros`, `ubuntu-server`, `kvm`, `qemu`, `winbox`, `chr`. This helps people find your project via GitHub search.
3. **Promote It Dynamically:** Once it's live, go to the **MikroTik Official Forums**, **Reddit (`r/mikrotik`)**, and hosting communities (like **LowEndTalk**). Write a post explaining how you created a safe way to run CHR on a VPS without losing data. People will start flooding your repo to give it stars. 