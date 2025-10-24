#!/bin/bash
# =====================================================
# 🐧 CloudLinux Full Installation & Configuration Script
# =====================================================
# Author: Firoz Sarkar
# Company: HostServerBD.com
# Website: https://hostserverbd.com
# GitHub: https://github.com/hostserverbd
# Email: support@hostserverbd.com
# Description:
#   This script installs and configures all major CloudLinux
#   components (CageFS, PHP, Node.js, Python, Ruby selectors)
#   for cPanel/WHM servers.
# =====================================================

echo "====================================================="
echo "🚀 Starting CloudLinux Full Installation by HostServerBD.com"
echo "====================================================="

# Step 1: Update system packages
echo "🔄 Updating system packages..."
yum update -y

# Step 2: Install CageFS
echo "📦 Installing CageFS..."
yum install cagefs -y
cagefsctl --check-cagefs-initialized
cagefsctl --init
cagefsctl --enable all

# Step 3: Install PHP Selector
echo "🐘 Installing PHP Selector..."
yum groupinstall alt-php -y
yum update cagefs lvemanager -y
/usr/sbin/cloudlinux-selector make-defaults-config --json --interpreter=php

# Step 4: Install Node.js Selector
echo "🟩 Installing Node.js Selector..."
yum groupinstall alt-nodejs -y
yum install lvemanager lve-utils -y
yum install alt-mod-passenger -y
yum install cagefs -y
systemctl restart cpanel.service

# Step 5: Install Python Selector
echo "🐍 Installing Python Selector..."
yum groupinstall alt-python -y
yum install lvemanager lve-utils alt-python-virtualenv -y
cagefsctl --force-update

# Step 6: Install Ruby Selector
echo "💎 Installing Ruby Selector..."
yum groupinstall alt-ruby -y
cloudlinux-config set --json --data '{"options":{"uiSettings":{"hideRubyApp":false}}}'

# Step 7: Rebuild CageFS & Restart Services
echo "🔁 Finalizing configuration..."
cagefsctl --update
systemctl restart cpanel.service
systemctl restart httpd

# Step 8: Clean up
echo "🧹 Cleaning up yum cache..."
yum clean all

echo "====================================================="
echo "✅ CloudLinux Full Installation Completed Successfully!"
echo "====================================================="
echo "🌐 Visit: https://hostserverbd.com"
echo "📧 Support: support@hostserverbd.com"
echo "👨‍💻 Developed by: Firoz Sarkar | HostServerBD.com"
echo "====================================================="
