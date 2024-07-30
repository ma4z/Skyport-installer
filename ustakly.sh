#!/bin/bash

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

# Prompt user to proceed with installation
if prompt "Do you want to proceed with the installation"; then
    # Run your installation commands here
    echo "Running installation commands..."
    
    # Example installation commands
    echo "Installing dependencies..."
    git clone https://github.com/mtq4/ustaklydashboard.git
    cd ustaklydashboard
    
    echo "Setting up Skyport..."
    npm install

    # Print success message
    echo "SUCCESSFULLY installed Ustakly"
    
    # Run the application
    echo "Starting application..."
    node .
else
    echo "Installation aborted."
fi
