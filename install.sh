#!/bin/bash

# Define color codes
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to prompt the user for input
prompt() {
    echo -n "$1 (yes/no): "
    read answer
    case "$answer" in
        yes|y) return 0 ;;
        no|n) return 1 ;;
        *) echo "Invalid input. Please enter 'yes' or 'no'." ; prompt "$1" ;;
    esac
}

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${RED}******************************|"
    echo -e "                              |"
    echo -e "Error : You Must Be in Root    |"
    echo -e "                              |"
    echo -e "******************************|${NC}"
    exit 1
fi

# Prompt user to proceed with installation
if prompt "Do you want to proceed with the installation"; then
    # Run your installation commands here
    echo "Running installation commands..."
    
    # Example installation commands
    echo "Installing Skyport..."
    apt update
    apt install git npm nodejs
    git clone https://github.com/skyportlabs/panel.git
    cd panel
  
    echo "Setting up Skyport..."
    npm install
    npm run seed
    npm run createUser

    # Print success message
    echo "SUCCESSFULLY installed Skyport"
    
    # Run the application
    echo "Starting Skyport This will take sometime..."
    node .
else
    echo "Installation aborted."
fi
