#!/bin/bash

# Function to prompt user input
prompt() {
  read -r -p "$1" response
  echo "$response"
}

# Initial prompt to install UstaklyDashboard
install_dashboard=$(prompt "Do you want to Install UstaklyDashboard? (yes/no): ")
if [[ "$install_dashboard" != "yes" ]]; then
  echo "Installation aborted."
  exit 1
fi

echo "* Installing Ustakly Dashboard"

# Update and install dependencies
apt update
apt install -y git nodejs npm

echo "* Installed Dependencies"

# Clone repository and install files
git clone https://github.com/mtq4/ustaklydashboard.git
cd ustaklydashboard || { echo "Failed to enter directory."; exit 1; }
npm install
mv .env_example .env

echo "* Installed Files"

# Prompt user for configuration details
skyport_url=$(prompt "What's Your Skyport URL? : ")
skyport_key=$(prompt "What's Your Skyport API_KEY?: ")
client_id=$(prompt "What's Your Oauth2 Client id? : ")
client_secret=$(prompt "What's Your Oauth2 secret? : ")
redirect_url=$(prompt "What's Your Redirect Url must be /callback/discord at end? : ")
webhook_enable=$(prompt "Do you want the Webhook Enable? true / false dont put wrong spell or ustakly wont work : ")
webhook_url=$(prompt "Whats Your Webhook url is you didnt enable it just press enter or type url : ")
admin_email=$(prompt "What's Your Email for Administration? : ")
port=$(prompt "Which Port we Listen the Ustakly? : ")
host_name=$(prompt "What's your Host Name? : ")

# Write to .env file
{
  echo "# SKYPORT settings"
  echo "SKYPORT_URL=${skyport_url}"
  echo "SKYPORT_KEY=${skyport_key}"
  echo ""
  echo "# Auth"
  echo "DISCORD_CLIENT_ID=${client_id}"
  echo "DISCORD_CLIENT_SECRET=${client_secret}"
  echo "DISCORD_CALLBACK_URL=${redirect_url}"
  echo "PASSWORD_LENGTH=10"
  echo ""
  echo "# Webhook Settings | If Webhook Enable set to true of you dont want then set it false"
  echo "WEBHOOK_ENABLED=${webhook_enable}"
  echo "WEBHOOK_URL=${webhook_url}"
  echo ""
  echo "# proxycheck.io API key"
  echo "PROXYCHECK_KEY=0000000000000000000000000000"
  echo ""
  echo "# Session"
  echo "SESSION_SECRET=examplesecret"
  echo ""
  echo "# AFK"
  echo "AFK_TIME=60"
  echo ""
  echo "# Application"
  echo "APP_NAME=${host_name}"
  echo "APP_URL=http://127.0.0.1:25002"
  echo "APP_PORT=${port}"
  echo ""
  echo "# Admin"
  echo "ADMIN_USERS=${admin_email},exemple2@gmail.com"
  echo ""
  echo "# Logs"
  echo "LOGS_PATH=./storage/logs/services.log"
  echo "LOGS_ERROR_PATH=./storage/logs/errors.log"
  echo ""
  echo "# Basic plan"
  echo "DEFAULT_PLAN=BASIC"
  echo ""
  echo "# Cost store resources"
  echo "CPU_COST=750"
  echo "RAM_COST=500"
  echo "DISK_COST=400"
  echo "BACKUP_COST=250"
  echo "DATABASE_COST=250"
  echo "ALLOCATION_COST=500"
  echo ""
  echo "# Developer"
  echo "APP_VERSION=v0.1.0-beta4"
} > .env

echo "* Configuration Complete"
# Start Ustalkly
echo "* Starting UstaklyDashboard this may take some time"
node index.js
