#!/bin/bash

# OSWP Installer
# This script downloads and installs the oswp WordPress updater tool

set -euo pipefail

# Constants
SCRIPT_NAME="oswp"
REPO_URL="https://raw.githubusercontent.com/onliveserver/oswp/main"
SOURCE_URL="${REPO_URL}/oswp.sh"
DEST_DIR="/usr/local/bin"
TARGET_PATH="${DEST_DIR}/${SCRIPT_NAME}"

# Check if running as root or with sudo
if [[ $EUID -ne 0 ]]; then
    echo "[ERROR] This script must be run as root or with sudo privileges."
    exit 1
fi

# Check if curl is available
if ! command -v curl &> /dev/null; then
    echo "[ERROR] curl is required but not installed. Please install curl and try again."
    exit 1
fi

# Create destination directory if it doesn't exist
if [[ ! -d "$DEST_DIR" ]]; then
    mkdir -p "$DEST_DIR"
fi

# Download the script
echo "[INFO] Downloading oswp script from GitHub..."
if ! curl -fsSL "$SOURCE_URL" -o "$TARGET_PATH"; then
    echo "[ERROR] Failed to download the script from $SOURCE_URL"
    exit 1
fi

# Make executable
chmod +x "$TARGET_PATH"

# Verify installation
if [[ -x "$TARGET_PATH" ]]; then
    echo "[SUCCESS] oswp has been installed successfully at: $TARGET_PATH"
    echo "[INFO] Run 'oswp --help' to see usage instructions."
else
    echo "[ERROR] Failed to install oswp."
    exit 1
fi

exit 0
