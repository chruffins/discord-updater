#!/bin/bash

# Discord updater for Debian (.deb)

# Temp download location
TEMP_DEB="/tmp/discord.deb"

# URL for the latest Discord .deb
DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"

echo "Downloading latest Discord..."
wget -O "$TEMP_DEB" "$DISCORD_URL"

if [ $? -ne 0 ]; then
    echo "Download failed!"
    exit 1
fi

echo "Installing Discord..."
sudo apt install -y "$TEMP_DEB"

if [ $? -ne 0 ]; then
    echo "Installation failed!"
    exit 1
fi

# Remove temp file
rm -f "$TEMP_DEB"

echo "Discord has been updated successfully."
