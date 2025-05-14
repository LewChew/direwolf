#!/bin/bash

# Nginx Setup Script for Direwolf Petshop Website
# This script will install Nginx and configure it to serve the Direwolf Petshop website

# Ensure the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo or log in as root."
    exit 1
fi

# Set variables
SITE_ROOT="/var/www/direwolf"
SERVER_NAME="direwolf.example.com"  # Change this to your actual domain if you have one
SERVER_IP=$(hostname -I | awk '{print $1}')

echo "=== Setting up Nginx for Direwolf Petshop Website ==="
echo "Server IP: $SERVER_IP"
echo "Server Name: $SERVER_NAME"
echo "Document Root: $SITE_ROOT"
echo ""

# Update package lists
echo "=== Updating package lists ==="
apt update -y

# Install Nginx
echo "=== Installing Nginx ==="
apt install -y nginx

# Create directory for website files
echo "=== Creating website directory ==="
mkdir -p $SITE_ROOT

# Clone the repository if not already done
if [ ! -d ~/direwolf ]; then
    echo "=== Cloning Direwolf repository ==="
    cd ~
    git clone https://github.com/LewChew/direwolf.git
fi

# Run the setup script from the repository if not already done
if [ ! -f ~/direwolf/index.html ]; then
    echo "=== Running Direwolf setup script ==="
    cd ~/direwolf
    chmod +x setup-direwolf.sh
    ./setup-direwolf.sh
fi

# Copy website files to Nginx document root
echo "=== Copying website files to $SITE_ROOT ==="
cp -r ~/direwolf/* $SITE_ROOT/
cp -r ~/direwolf/.gitignore $SITE_ROOT/  # Don't forget hidden files

# Create Nginx site configuration
echo "=== Creating Nginx site configuration ==="
cat > /etc/nginx/sites-available/direwolf << EOL
server {
    listen 80;
    listen [::]:80;

    root $SITE_ROOT;
    index index.html;

    server_name $SERVER_NAME $SERVER_IP;

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

# Create a symbolic link to enable the site
echo "=== Enabling site configuration ==="
ln -sf /etc/nginx/sites-available/direwolf /etc/nginx/sites-enabled/

# Test Nginx configuration
echo "=== Testing Nginx configuration ==="
nginx -t

# Reload Nginx to apply changes
echo "=== Reloading Nginx ==="
systemctl reload nginx

# Create placeholder images
echo "=== Creating placeholder images ==="
mkdir -p $SITE_ROOT/images

# Create a simple placeholder image generator
cat > /tmp/generate_placeholders.sh << 'EOL'
#!/bin/bash

IMAGE_DIR="$SITE_ROOT/images"

# Function to create a colored placeholder image with text
generate_placeholder() {
    local name=$1
    local width=$2
    local height=$3
    local color=$4
    local text_color=$5
    
    # Create a placeholder with text using HTML
    cat > "$IMAGE_DIR/$name" << EOF
<svg xmlns="http://www.w3.org/2000/svg" width="$width" height="$height" viewBox="0 0 $width $height">
    <rect width="100%" height="100%" fill="$color"/>
    <text x="50%" y="50%" font-family="Arial, sans-serif" font-size="20" text-anchor="middle" dominant-baseline="middle" fill="$text_color">$name</text>
</svg>
EOF
}

# Create placeholder images for direwolves
generate_placeholder "ghost.jpg" 800 600 "#ffffff" "#333333"
generate_placeholder "nymeria.jpg" 800 600 "#a9a9a9" "#ffffff"
generate_placeholder "summer.jpg" 800 600 "#add8e6" "#333333"
generate_placeholder "lady.jpg" 800 600 "#d3d3d3" "#333333"
generate_placeholder "shaggydog.jpg" 800 600 "#2f4f4f" "#ffffff"
generate_placeholder "grey_wind.jpg" 800 600 "#778899" "#ffffff"

# Create placeholder images for team members
generate_placeholder "brandon.jpg" 400 400 "#8b4513" "#ffffff"
generate_placeholder "tormund.jpg" 400 400 "#cd5c5c" "#ffffff"
generate_placeholder "osha.jpg" 400 400 "#556b2f" "#ffffff"
generate_placeholder "sam.jpg" 400 400 "#4682b4" "#ffffff"

# Create placeholder images for testimonials
generate_placeholder "jon.jpg" 300 300 "#2f4f4f" "#ffffff"
generate_placeholder "arya.jpg" 300 300 "#696969" "#ffffff"

# Create placeholder image for hero background
generate_placeholder "hero-bg.jpg" 1920 800 "#2c3e50" "#ffffff"

# Create placeholder image for direwolf pack
generate_placeholder "direwolf-pack.jpg" 800 500 "#3e5c76" "#ffffff"

# Create placeholder image for map
generate_placeholder "map.jpg" 1200 600 "#d5d5d5" "#333333"

# Create placeholder images for certification logos
generate_placeholder "certification1.png" 200 100 "#1e88e5" "#ffffff"
generate_placeholder "certification2.png" 200 100 "#43a047" "#ffffff"
generate_placeholder "certification3.png" 200 100 "#fb8c00" "#ffffff"
generate_placeholder "certification4.png" 200 100 "#8e24aa" "#ffffff"

echo "Placeholders generated in $IMAGE_DIR"
EOL

# Make the script executable and run it
chmod +x /tmp/generate_placeholders.sh
export SITE_ROOT="$SITE_ROOT"  # Export for the script
/tmp/generate_placeholders.sh

# Fix permissions
echo "=== Setting proper permissions ==="
chown -R www-data:www-data $SITE_ROOT
chmod -R 755 $SITE_ROOT

# Set up firewall if ufw is installed
if command -v ufw > /dev/null; then
    echo "=== Configuring firewall ==="
    ufw allow 'Nginx HTTP'
    ufw status
fi

# Display success message and next steps
echo ""
echo "=== Installation Complete! ==="
echo "Direwolf Petshop website has been set up with Nginx."
echo ""
echo "You can now access your website at:"
echo "http://$SERVER_IP"
echo ""
echo "If you have a domain name, point it to this server's IP address,"
echo "and update the server_name in /etc/nginx/sites-available/direwolf."
echo ""
echo "To make further changes to your website, edit the files in $SITE_ROOT"
echo "or update your repository and copy the files again."
echo ""
echo "For enhanced security, consider setting up HTTPS with Let's Encrypt."
echo "You can use Certbot to obtain and install SSL certificates:"
echo "apt install -y certbot python3-certbot-nginx"
echo "certbot --nginx -d $SERVER_NAME"
echo ""
