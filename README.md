# 🌟 Harbor Open Source Container Registry Installation

A Bash script to automate the installation and setup of **Harbor**, an open-source container registry, on an Ubuntu system. 🚀

## 📑 Table of Contents
- [Prerequisites](#prerequisites) 🛠️
- [Installation](#installation) 📥
- [Script Details](#script-details) ℹ️
- [Usage](#usage) 🎯
- [Testing and Setup](#testing-and-setup) ✅
- [Donations](#donations) ☕
- [Support or Contact](#support-or-contact) 📞
- [Disclaimer](#disclaimer) ⚠️

## 🛠️ Prerequisites
To run `harbor-install.sh`, ensure the following are in place:

- **Operating System**: Ubuntu (tested on Ubuntu 24.04 "Noble") 🐧
- **Sudo Permissions**: Requires root privileges for package installation and Docker management. Run as a user with `sudo` access 🔑
- **Required Packages**:
  - `curl` (for downloading the Harbor installer) 🌐
  - `dpkg` (for checking installed packages) 📦
  - `ca-certificates` (for secure repository access) 🔒
  - Stable internet connection for downloading Docker and Harbor components 📡
- **Docker**: The script installs Docker CE if absent, but ensure no conflicting installations (e.g., `docker.io`) exist 🚢

## 📥 Installation
Get Harbor up and running in just a few steps! ✨

1. **Download the Script**:
   Clone or grab it from the repository:
   ```bash
   git clone https://github.com/Lalatenduswain/harbor-install.git
   cd harbor-install
   ```
   Or save it manually as `harbor-install.sh` 📜

2. **Make it Executable**:
   ```bash
   chmod +x harbor-install.sh
   ```

3. **Run the Script**:
   ```bash
   ./harbor-install.sh
   ```
   - The script will:
     - Install Docker and Docker Compose 🐳
     - Download Harbor v2.9.0 📲
     - Configure it to run on `localhost:8989` 🌍
     - Start the Harbor services automatically 🚀

## ℹ️ Script Details
- **Name**: `harbor-install.sh` 📝
- **Purpose**: Simplifies installing and configuring Harbor, a powerful container registry, with minimal effort 🌈
- **Features**:
  - ✅ Checks and installs Docker CE and Docker Compose if needed
  - 🧹 Removes conflicting packages (e.g., `docker.io`, standalone `containerd`)
  - 📥 Downloads and extracts Harbor v2.9.0 online installer
  - ⚙️ Configures Harbor to run on `localhost:8989` with HTTP (no HTTPS)
  - 🚀 Automatically launches Harbor services
- **GitHub Repository**:
  - **Username**: [Lalatenduswain](https://github.com/Lalatenduswain/) 👤
  - **Repository**: [harbor-install](https://github.com/Lalatenduswain/harbor-install) 📂
- **Website**: [https://blog.lalatendu.info/](https://blog.lalatendu.info/) 🌐

> **Note**: No end-user license agreement is specified. Want to add one (e.g., MIT, GPL)? Modify the script and README as needed! 📜

## 🎯 Usage
- **Run the Script**: Simply execute:
  ```bash
  ./harbor-install.sh
  ```
- **Access Harbor**:
  - Open your browser and visit `http://localhost:8989` 🌍
  - Log in with:
    - **Username**: `admin` 👨‍💼
    - **Password**: `SuperSecretPassword` 🔐
- **Verify Installation**:
  ```bash
  docker ps
  curl http://localhost:8989
  ```
  - `docker ps`: Lists running Harbor containers (e.g., `nginx`, `harbor-core`) 🐳
  - `curl`: Returns the Harbor login page HTML 📄

> **No Crontab Needed**: This is a one-time setup script—no scheduling required! ⏰

## ✅ Testing and Setup
- **Test After Running**:
  - Check containers: `docker ps` 🐳
  - Test connectivity: `curl http://localhost:8989` 🌐
  - Visit `http://localhost:8989` in your browser 🌍
- **Additional Setup**: None needed unless you want to:
  - 🔒 Enable HTTPS: Edit `harbor.yml` to uncomment and configure the `https` section
  - ⚙️ Change port/hostname: Modify `harbor.yml` before `install.sh` runs

## ☕ Donations
Love this script? Show your appreciation with a coffee! 🙌
- [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain) ☕

## 📞 Support or Contact
Got issues? We’re here to help! 💡
- Submit an issue at: [https://github.com/Lalatenduswain/harbor-install/issues](https://github.com/Lalatenduswain/harbor-install/issues) 🐞

If you enjoy this script or content, give it a ⭐ on GitHub!

## ⚠️ Disclaimer
**Author**: Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain/) | [Website](https://blog.lalatendu.info/) 👤

This script is provided "as-is" and may require tweaks for your specific setup. Use it at your own risk. The authors aren’t liable for any damages or issues arising from its use. 🚨

---

### Enhancements with Emojis
- **Headings**: Added colorful icons (e.g., 🌟, 🛠️, 📥) to make sections pop.
- **Text**: Sprinkled emojis (e.g., 🚀, ✅, 🌍) to emphasize actions, statuses, and outcomes.
- **Code Blocks**: Kept clean but added context with emojis (e.g., 📜 for scripts, 🐳 for Docker).
- **Tone**: Maintained a friendly, approachable vibe while keeping it professional.

This version should look beautiful in GitHub’s Markdown renderer and make the README more inviting. If you’d like more emojis, fewer, or specific adjustments, just let me know! You can copy this into your `harbor-install` repo as `README.md`.
