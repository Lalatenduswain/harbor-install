# 🌟 Harbor Open Source Container Registry Installation

A Bash script to automate the installation and setup of **Harbor**, an open-source container registry, on an Ubuntu system. 🚀

## 📑 Tabs

<details>
<summary>🛠️ Prerequisites</summary>

To run `harbor-install.sh`, ensure the following:

- **Operating System**: Ubuntu (tested on Ubuntu 24.04 "Noble") 🐧
- **Sudo Permissions**: Requires root privileges for package installation and Docker management. Run as a user with `sudo` access 🔑
- **Required Packages**:
  - `curl` (for downloading the Harbor installer) 🌐
  - `dpkg` (for checking installed packages) 📦
  - `ca-certificates` (for secure repository access) 🔒
  - Stable internet connection for downloading Docker and Harbor components 📡
- **Docker**: The script installs Docker CE if absent, but ensure no conflicting installations (e.g., `docker.io`) exist 🚢

</details>

<details>
<summary>📥 Installation</summary>

Get Harbor up and running in just a few steps! ✨

1. **Download the Script**:
   Clone or grab it from the repository:
   ```bash
   git clone https://github.com/Lalatenduswain/harbor-install.git
   cd harbor-install
