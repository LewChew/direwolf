# Direwolf Petshop

A responsive web application for a fictional direwolf pet shop, allowing users to browse available direwolves for adoption.

![Direwolf Petshop](https://raw.githubusercontent.com/LewChew/direwolf/main/images/screenshot.jpg)

## Description

Direwolf Petshop is a fun, Game of Thrones-inspired web application that showcases direwolves available for adoption. Users can explore the website to learn about direwolves, view available pets, and submit contact forms for adoption inquiries.

## Quick Start

### Local Development

To set up this project on a Linux/Unix-based system for local development:

1. Clone the repository
```bash
git clone https://github.com/LewChew/direwolf.git
cd direwolf
```

2. Make the setup script executable and run it
```bash
chmod +x setup-direwolf.sh
./setup-direwolf.sh
```

3. Open any HTML file in your browser to view the website

### Production Deployment with Nginx

To deploy the website with Nginx on a server:

1. Clone the repository
```bash
git clone https://github.com/LewChew/direwolf.git
cd direwolf
```

2. Make the Nginx setup script executable and run it (requires root privileges)
```bash
chmod +x setup-nginx.sh
sudo ./setup-nginx.sh
```

3. Access the website at your server's IP address or domain name

The Nginx setup script will:
- Install Nginx if not already installed
- Set up a server configuration for the website
- Create placeholder images
- Configure proper permissions
- Set up basic performance optimizations (caching, compression)
- Provide instructions for adding SSL with Let's Encrypt

## Features

- Responsive design that works on mobile, tablet, and desktop
- Interactive gallery of direwolves available for adoption
- Filtering system to sort direwolves by age, gender, and color
- About page with information about the shop and team
- Contact form with validation
- FAQ section with accordion functionality

## Technologies Used

- HTML5
- CSS3
- JavaScript (vanilla)
- Font Awesome icons
- Google Fonts
- Nginx (for production deployment)

## Project Structure

```
direwolf/
├── index.html              # Home page
├── direwolves.html         # Available direwolves page
├── about.html              # About us page
├── contact.html            # Contact page
├── css/
│   └── styles.css          # Main stylesheet
├── js/
│   └── script.js           # JavaScript functionality
├── images/                 # Image assets
├── setup-direwolf.sh       # Script to set up website files
├── setup-nginx.sh          # Script to set up Nginx deployment
└── README.md               # Project documentation
```

## Customizing the Website

- Replace placeholder images in the `images` directory with actual images
- Modify the HTML content to reflect your actual business information
- Update styles in `css/styles.css` to match your branding
- Add additional pages or features as needed

## Security Considerations

For a production deployment, consider:
- Setting up HTTPS with Let's Encrypt (instructions provided in the Nginx setup script)
- Implementing proper form validation and sanitization for the contact form
- Regularly updating your server and dependencies

## License

This project is licensed under the MIT License
