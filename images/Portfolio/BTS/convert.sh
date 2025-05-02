#!/bin/bash

# Set the target directory (default to current directory if not provided)
TARGET_DIR=${1:-$(pwd)}

# Set compression quality (adjust as needed)
QUALITY=25

# Check if ImageMagick is installed
if ! command -v mogrify &> /dev/null; then
    echo "Error: ImageMagick is not installed. Install it using: sudo apt install imagemagick"
    exit 1
fi

# Compress images
echo "Compressing images in $TARGET_DIR..."
find "$TARGET_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) -exec mogrify -quality $QUALITY {} +

echo "Compression completed!"
