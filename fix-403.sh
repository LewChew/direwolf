#!/bin/bash

# Troubleshooting script for Nginx 403 Forbidden error
# This script will fix common issues that cause 403 errors

# Ensure the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo or log in as root."
    exit 1
fi

echo "=== Direwolf Petshop Nginx 403 Error Troubleshooting ==="
echo ""

# Check if Nginx is running
echo "=== Checking Nginx status ==="
systemctl status nginx | grep Active
echo ""

# Check Nginx configuration
echo "=== Checking Nginx configuration ==="
nginx -t
echo ""

# Check the document root
SITE_ROOT="/var/www/direwolf"
echo "=== Checking document root ($SITE_ROOT) ==="
if [ -d "$SITE_ROOT" ]; then
    echo "Document root exists: Yes"
    ls -la $SITE_ROOT | head -n 5
else
    echo "Document root exists: No"
    echo "Creating document root directory..."
    mkdir -p $SITE_ROOT
fi
echo ""

# Check if index.html exists
echo "=== Checking for index.html ==="
if [ -f "$SITE_ROOT/index.html" ]; then
    echo "index.html exists: Yes"
else
    echo "index.html exists: No"
    echo "The website files might not be copied correctly."
    
    # Check if repository was cloned
    if [ -d ~/direwolf ]; then
        echo "Direwolf repository found in home directory."
        echo "Copying files from repository to document root..."
        cp -r ~/direwolf/* $SITE_ROOT/
        cp -r ~/direwolf/.gitignore $SITE_ROOT/ 2>/dev/null
    else
        echo "Direwolf repository not found. Cloning from GitHub..."
        cd ~
        git clone https://github.com/LewChew/direwolf.git
        
        # Run setup-direwolf.sh if it exists
        if [ -f ~/direwolf/setup-direwolf.sh ]; then
            echo "Running setup-direwolf.sh..."
            cd ~/direwolf
            chmod +x setup-direwolf.sh
            ./setup-direwolf.sh
        fi
        
        echo "Copying files to document root..."
        cp -r ~/direwolf/* $SITE_ROOT/
        cp -r ~/direwolf/.gitignore $SITE_ROOT/ 2>/dev/null
    fi
fi
echo ""

# Check permissions
echo "=== Checking and fixing permissions ==="
echo "Current permissions:"
ls -la $SITE_ROOT | head -n 5
echo ""
echo "Setting correct permissions..."
chown -R www-data:www-data $SITE_ROOT
chmod -R 755 $SITE_ROOT
echo "New permissions:"
ls -la $SITE_ROOT | head -n 5
echo ""

# Check Nginx site configuration
echo "=== Checking Nginx site configuration ==="
if [ -f /etc/nginx/sites-available/direwolf ]; then
    echo "Nginx configuration exists: Yes"
    grep -n "root" /etc/nginx/sites-available/direwolf
else
    echo "Nginx configuration exists: No"
    echo "Creating Nginx site configuration..."
    SERVER_NAME=$(hostname -I | awk '{print $1}')
    
    cat > /etc/nginx/sites-available/direwolf << EOL
server {
    listen 80;
    listen [::]:80;

    root $SITE_ROOT;
    index index.html;

    server_name $SERVER_NAME;

    location / {
        try_files \$uri \$uri/ =404;
    }

    # Add cache-control headers for static assets
    location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
        expires 7d;
        add_header Cache-Control "public, max-age=604800";
    }

    # Enable gzip compression
    gzip on;
    gzip_vary on;
    gzip_min_length 1000;
    gzip_comp_level 5;
    gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/javascript;
}
EOL

    # Create symbolic link
    ln -sf /etc/nginx/sites-available/direwolf /etc/nginx/sites-enabled/
    
    # Check if default site exists and disable it
    if [ -f /etc/nginx/sites-enabled/default ]; then
        echo "Disabling default Nginx site..."
        rm -f /etc/nginx/sites-enabled/default
    fi
fi
echo ""

# Check if Nginx sites-enabled has the direwolf site
echo "=== Checking sites-enabled directory ==="
ls -la /etc/nginx/sites-enabled/
echo ""

# Create placeholder images if they don't exist
echo "=== Checking for placeholder images ==="
if [ ! -d "$SITE_ROOT/images" ] || [ -z "$(ls -A $SITE_ROOT/images 2>/dev/null)" ]; then
    echo "Creating placeholder images..."
    mkdir -p $SITE_ROOT/images
    
    # Create a simple colored SVG placeholder as hero-bg.jpg
    cat > "$SITE_ROOT/images/hero-bg.jpg" << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" width="1920" height="800" viewBox="0 0 1920 800">
    <rect width="100%" height="100%" fill="#2c3e50"/>
    <text x="50%" y="50%" font-family="Arial, sans-serif" font-size="40" text-anchor="middle" dominant-baseline="middle" fill="#ffffff">Hero Background</text>
</svg>
EOF

    # Create other placeholder images
    for img in ghost nymeria summer lady shaggydog grey_wind; do
        cat > "$SITE_ROOT/images/${img}.jpg" << EOF
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600" viewBox="0 0 800 600">
    <rect width="100%" height="100%" fill="#3e5c76"/>
    <text x="50%" y="50%" font-family="Arial, sans-serif" font-size="30" text-anchor="middle" dominant-baseline="middle" fill="#ffffff">${img}</text>
</svg>
EOF
    done
    
    # Set correct permissions for images
    chown -R www-data:www-data $SITE_ROOT/images
    chmod -R 755 $SITE_ROOT/images
fi
echo ""

# Restart Nginx
echo "=== Restarting Nginx ==="
systemctl restart nginx
echo "Nginx restarted."
echo ""

# Check Nginx logs for errors
echo "=== Checking Nginx error logs ==="
tail -n 20 /var/log/nginx/error.log
echo ""

# Print final message
echo "=== Troubleshooting Complete ==="
echo "The 403 error should now be fixed. Try accessing the website again at:"
echo "http://$(hostname -I | awk '{print $1}')"
echo ""
echo "If you still see a 403 error, please check the following:"
echo "1. Make sure all files are properly copied to $SITE_ROOT"
echo "2. Check that the Nginx configuration is correct"
echo "3. Examine the Nginx error logs for specific issues: tail -f /var/log/nginx/error.log"
echo ""
