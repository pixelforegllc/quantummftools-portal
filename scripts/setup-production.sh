#!/bin/bash

# Production setup script for quantummftools.com

# Exit on error
set -e

echo "Setting up production environment for quantummftools.com..."

# Install required packages
sudo apt-get update
sudo apt-get install -y nginx certbot python3-certbot-nginx

# Install Node.js if not present
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Install MongoDB if not present
if ! command -v mongod &> /dev/null; then
    wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    sudo systemctl start mongod
    sudo systemctl enable mongod
fi

# Create web root directory
sudo mkdir -p /var/www/quantummftools.com/html
sudo chown -R $USER:$USER /var/www/quantummftools.com

# Copy Nginx configuration
sudo cp config/nginx/quantummftools.com.conf /etc/nginx/sites-available/
sudo ln -sf /etc/nginx/sites-available/quantummftools.com.conf /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

# Install SSL certificate
sudo certbot --nginx -d quantummftools.com -d www.quantummftools.com -d api.quantummftools.com --non-interactive --agree-tos --email admin@quantummftools.com

# Build frontend
cd frontend
npm install
npm run build
sudo cp -r build/* /var/www/quantummftools.com/html/

# Setup backend
cd ../backend
npm install
npm install -g pm2

# Create environment file
cat > .env << EOL
# Server Configuration
PORT=5000
NODE_ENV=production

# Database
MONGODB_URI=mongodb://localhost:27017/webapp

# Security
JWT_SECRET=$(openssl rand -base64 32)
CORS_ORIGIN=https://quantummftools.com

# Domain Configuration
DOMAIN=quantummftools.com
FRONTEND_URL=https://quantummftools.com
API_SUBDOMAIN=api.quantummftools.com

# File Upload Settings
UPLOAD_PATH=uploads
MAX_FILE_SIZE=10485760

# SSL Configuration
SSL_KEY_PATH=/etc/letsencrypt/live/quantummftools.com/privkey.pem
SSL_CERT_PATH=/etc/letsencrypt/live/quantummftools.com/fullchain.pem
EOL

# Create upload directories
mkdir -p uploads converted
chmod 755 uploads converted

# Start backend with PM2
pm2 start src/index.js --name "quantummftools-backend"
pm2 save
pm2 startup

# Restart Nginx
sudo nginx -t
sudo systemctl restart nginx

echo "Setup complete! The application should now be available at https://quantummftools.com"
echo "API endpoint is available at https://api.quantummftools.com"
echo "Please make sure to update your DNS records to point to this server:"
echo "  - A record for quantummftools.com -> $(curl -s ifconfig.me)"
echo "  - A record for www.quantummftools.com -> $(curl -s ifconfig.me)"
echo "  - A record for api.quantummftools.com -> $(curl -s ifconfig.me)"