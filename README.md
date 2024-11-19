# Ontime Browser Autostart Installer

Automatically opens Ontime in your browser when you log into your Debian desktop. The script automatically detects your local IP address, making it perfect for touring setups where the network configuration changes frequently.

## Features
- Automatic local IP detection
- Works with port 4001 (Ontime default)
- Supports Firefox, Chrome, and Chromium browsers
- Auto-starts on desktop login

Please note the script waits 30seconds before executing to allow network connectivity to be established before it launches.

## Installation
```bash
curl -sSL https://raw.githubusercontent.com/BPT1901/ontime-autostart/main/install.sh | bash

## Requirements
- Debian based linux distro with desktop environment. This wont work on headless installs
- Firefox, Chrome, or Chromium browser installed
- Sudo privileges for the user
- Ontime installed and running on port 4001

## Uninstalation
rm /usr/local/bin/start-ontime-browser.sh ~/.config/autostart/ontime-browser.desktop




