#!/bin/bash
set -eux

# ====== BACKEND DETAILS ======
BACKEND_REPO="https://github.com/harshithreddy1/Hotstar-Backend.git"
BACKEND_BRANCH="main"
APP_PORT="3000"

DB_HOST="harshith-db.czks86u68vsa.ap-south-1.rds.amazonaws.com"
DB_USER="admin"
DB_PASS="admin123"
DB_NAME="harshith"

START_CMD="/usr/bin/node /opt/backend/server.js"
# ============================================

apt-get update -y
apt-get install -y git curl jq

# Install Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Remove old backend (IMPORTANT FIX)
rm -rf /opt/backend

# Clone fresh backend
cd /opt
git clone -b "$BACKEND_BRANCH" "$BACKEND_REPO" backend
cd backend

# Install dependencies
npm install
npm install cors body-parser dotenv

# Create .env file
cat > .env <<EOF
PORT=$APP_PORT
DB_HOST=$DB_HOST
DB_USER=$DB_USER
DB_PASS=$DB_PASS
DB_NAME=$DB_NAME
EOF

# Give permissions
chown -R www-data:www-data /opt/backend || true

# Create systemd service
cat > /etc/systemd/system/backend.service <<EOF
[Unit]
Description=Backend Node App
After=network.target

[Service]
WorkingDirectory=/opt/backend
ExecStart=$START_CMD
Restart=always
User=nobody
Group=nogroup
Environment=PORT=$APP_PORT
Environment=DB_HOST=$DB_HOST
Environment=DB_USER=$DB_USER
Environment=DB_PASS=$DB_PASS
Environment=DB_NAME=$DB_NAME
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now backend.service
