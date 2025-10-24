# 🧱 Full CloudLinux Installation Script  
**Repository:** [HostServerBD/Install-Cloudlinux-Full](https://github.com/hostserverbd/Install-Cloudlinux-Full)  
**Script URL:** `https://raw.githubusercontent.com/hostserverbd/Install-Cloudlinux-Full/refs/heads/main/full.sh`

A comprehensive Bash script to install and configure **all major CloudLinux components** on WHM/cPanel servers — including CageFS, PHP Selector, NodeJS Selector, Python Selector, and Ruby Selector.

---

## 🚀 What This Script Covers

- Installs **CageFS** for user isolation  
- Installs and configures **PHP Selector** (alt-php)  
- Installs and configures **NodeJS Selector** (alt-nodejs + Passenger)  
- Installs and configures **Python Selector** (alt-python + virtualenv)  
- Installs and configures **Ruby Selector** (alt-ruby)  
- Updates services, rebuilds CageFS and restarts key components  
- Cleans YUM cache to free up disk space  

---

## 🛠 Installation & Usage

Run the following commands as **root**:

# Run the script
```bash
bash <(curl -s https://raw.githubusercontent.com/hostserverbd/Install-Cloudlinux-Full/refs/heads/main/full.sh)

