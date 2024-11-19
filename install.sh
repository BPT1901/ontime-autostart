#!/bin/bash

# Ontime Browser Autostart Installer
# Usage: curl -sSL https://raw.githubusercontent.com/BPT1901/ontime-autostart/main/install.sh | bash

SCRIPT_PATH="/usr/local/bin/start-ontime-browser.sh"
AUTOSTART_PATH="$HOME/.config/autostart"
PORT="4001"

echo "Installing Ontime browser autostart..."

# Create the startup script with IP detection
sudo tee $SCRIPT_PATH > /dev/null << 'EOL'
#!/bin/bash

# Wait for network and system to be fully ready
sleep 30

# Export display for GUI applications
export DISPLAY=:0
export XAUTHORITY=/home/$USER/.Xauthority

# Get the local IP address
# This will get the IP address of the primary interface
LOCAL_IP=$(hostname -I | awk '{print $1}')
PORT=4001
URL="http://${LOCAL_IP}:${PORT}/editor"

echo "Attempting to open Ontime at: $URL"

# Check if Firefox is installed (default in Debian) or fall back to Chrome
if command -v firefox &> /dev/null; then
    firefox --new-window "$URL" &
elif command -v google-chrome &> /dev/null; then
    google-chrome --start-maximized --new-window "$URL" &
elif command -v chromium &> /dev/null; then
    chromium --start-maximized --new-window "$URL" &
fi
EOL

# Make script executable
sudo chmod +x $SCRIPT_PATH

# Create autostart directory if it doesn't exist
mkdir -p $AUTOSTART_PATH

# Create desktop entry
tee "$AUTOSTART_PATH/ontime-browser.desktop" > /dev/null << EOL
[Desktop Entry]
Type=Application
Name=Ontime Browser
Exec=$SCRIPT_PATH
Hidden=false
X-GNOME-Autostart-enabled=true
EOL

echo "Installation complete! The browser will auto-start after your next login."
echo "To test now, run: $SCRIPT_PATH"
echo "To uninstall, run:"
echo "rm $SCRIPT_PATH $AUTOSTART_PATH/ontime-browser.desktop"