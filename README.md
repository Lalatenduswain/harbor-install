# Harbor Open Source Container Registry Installation

A Bash script to automate the installation and setup of Harbor, an open-source container registry, on an Ubuntu system.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Script Details](#script-details)
- [Usage](#usage)
- [Testing and Setup](#testing-and-setup)
- [Donations](#donations)
- [Support or Contact](#support-or-contact)
- [Disclaimer](#disclaimer)

## Prerequisites
To run `harbor-install.sh`, ensure the following:
- **Operating System**: Ubuntu (tested on Ubuntu 24.04 "Noble").
- **Sudo Permissions**: The script requires root privileges for installing packages and managing Docker containers. Run it as a user with `sudo` access.
- **Required Packages**: 
  - `curl` (for downloading Harbor installer).
  - `dpkg` (for package checks).
  - `ca-certificates` (for secure repository access).
  - Internet connection for downloading Docker and Harbor components.
- **Docker**: The script installs Docker CE if not present, but ensure no conflicting Docker installations (e.g., `docker.io`) exist.

## Installation
1. **Download the Script**:
   Clone or download the script from the repository:
   ```bash
   git clone https://github.com/Lalatenduswain/harbor-install.sh.git
   cd harbor-install.sh
   ```
   Or manually save it as `harbor-install.sh`.

2. **Make it Executable**:
   ```bash
   chmod +x harbor-install.sh
   ```

3. **Run the Script**:
   ```bash
   ./harbor-install.sh
   ```
   - The script will install Docker, Docker Compose, download Harbor v2.9.0, configure it to run on `localhost:8989`, and start the Harbor services.

## Script Details
- **Name**: `harbor-install.sh`
- **Purpose**: Installs and configures Harbor, a container registry, with minimal user intervention.
- **Features**:
  - Checks for and installs Docker CE and Docker Compose if not present.
  - Removes conflicting packages (e.g., `docker.io`, standalone `containerd`).
  - Downloads and extracts Harbor v2.9.0 online installer.
  - Configures Harbor to run on `localhost:8989` with HTTP (no HTTPS).
  - Automatically starts Harbor services.
- **GitHub Repository**:
  - **Username**: [Lalatenduswain](https://github.com/Lalatenduswain/)
  - **Repository**: [harbor-install.sh](https://github.com/Lalatenduswain/harbor-install)
- **Website**: [https://blog.lalatendu.info/](https://blog.lalatendu.info/)

**Note**: No end-user license agreement is specified for this script. If you wish to add one (e.g., MIT, GPL), please modify the script and README accordingly.

## Usage
- **Run the Script**: Execute `./harbor-install.sh` in the terminal.
- **Access Harbor**:
  - Once complete, open a browser and go to `http://localhost:8989`.
  - Log in with:
    - **Username**: `admin`
    - **Password**: `SuperSecretPassword`
- **Verify Installation**:
  ```bash
  docker ps
  curl http://localhost:8989
  ```
  - `docker ps` lists running Harbor containers (e.g., `nginx`, `harbor-core`).
  - `curl` should return the Harbor login page HTML.

**No Crontab Setup Required**: This script is designed for one-time installation, not periodic execution, so no cron scheduling is necessary.

## Testing and Setup
- **Test After Running**:
  - Check running containers: `docker ps`.
  - Test connectivity: `curl http://localhost:8989`.
  - Access the UI in a browser at `http://localhost:8989`.
- **Additional Setup**: None required beyond running the script, unless you want to:
  - Enable HTTPS by editing `harbor.yml` (uncomment and configure the `https` section).
  - Change the port or hostname (edit `harbor.yml` before `install.sh` runs).

## Donations
If you find this script useful and want to show your appreciation, you can donate via:
- [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain)

## Support or Contact
Encountering issues? Don’t hesitate to submit an issue on our GitHub page:
- [https://github.com/Lalatenduswain/harbor-install/issues](https://github.com/Lalatenduswain/harbor-install/issues)

If you like this script or content, please give it a star on GitHub!

## Disclaimer
**Author**: Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain/) | [Website](https://blog.lalatendu.info/)

This script is provided "as-is" and may need modifications or updates to suit your specific environment and requirements. Use it at your own discretion. The authors of the script disclaim any responsibility for damages or issues resulting from its use.
