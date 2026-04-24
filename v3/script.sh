#!/bin/bash

set -e  # exit on error

# Read folder name interactively
read -p "Enter new folder name: " folder

# Validate input
if [[ -z "$folder" ]]; then
    echo "Error: Folder name cannot be empty."
    exit 1
fi

# Check if contests folder exists
if [[ ! -d "contests" ]]; then
    echo "Error: 'contests' folder does not exist."
    exit 1
fi

# Check if store folder exists
if [[ ! -d "store" ]]; then
    echo "Error: 'store' folder does not exist."
    exit 1
fi

# Check if target folder already exists
if [[ -e "$folder" ]]; then
    echo "Error: '$folder' already exists."
    exit 1
fi

# Create new folder
mkdir "$folder"

# Move contests inside new folder
mv "contests" "$folder/"

# Move new folder inside store
mv "$folder" "store/"

# Change directory to store
cd "store" || exit

echo "Done successfully!"
echo "Current directory: $(pwd)"
