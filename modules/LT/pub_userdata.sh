#!/bin/bash
set -eux

# ===== FRONTEND CONFIG =====
FRONTEND_REPO="https://github.com/harshithreddy1/Hotstar-Frontend.git"
FRONTEND_BRANCH="main"
ILB_DNS="internal-ILB-1269244541.ap-south-1.elb.amazonaws.com"

# ===== Install Dependencies =====
apt-get update -y
apt-get install -y nginx git curl

# Install Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Start & Enable nginx
systemctl start nginx
systemctl enable nginx

# ===== Clone Frontend Repo =====
cd /tmp
git clone -b "$FRONTEND_BRANCH" "$FRONTEND_REPO" fe || git clone "$FRONTEND_REPO" fe
cd fe || exit 1

# ===== Build Project =====
if [ -f package.json ]; then
    npm install
    npm run build || npm run build:prod || true

    if [ -d dist ]; then
        BUILD_DIR="dist"
    elif [ -d build ]; then
        BUILD_DIR="build"
    else
        BUILD_DIR="."
    fi
else
    BUILD_DIR="."
fi

rm -rf /var/www/html/*
cp -r $BUILD_DIR/* /var/www/html/

echo "window.__API_BASE_URL__='/api'" > /var/www/html/config.js

cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    server_name _;

    # Serve frontend
    location / {
        try_files \$uri \$uri/ /index.html;
    }

    # Health Check for ALB
    location /health {
        return 200 'OK';
    }

    location /api/ {
        proxy_pass http://$ILB_DNS:3000/;

        proxy_http_version 1.1;

        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;

        # Critical fix for req.body (JSON parsing issue)
        proxy_request_buffering off;

        client_max_body_size 20M;
    }
}
EOF

# Restart NGINX
nginx -t
systemctl restart nginx
