#!/bin/bash

# Setup script for Direwolf Petshop website - Part 2 (CSS completion and JavaScript)

# Create CSS file (continuation)
cat >> css/styles.css << 'EOL'
/* Testimonials Section */
.testimonials {
    padding: 60px 0;
    background-color: var(--light-color);
    text-align: center;
}

.testimonials h2 {
    font-size: 2rem;
    margin-bottom: 40px;
}

.testimonial {
    max-width: 600px;
    margin: 0 auto 40px;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.testimonial-img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 20px;
}

.testimonial blockquote {
    font-style: italic;
    font-size: 1.1rem;
    margin-bottom: 10px;
}

.testimonial cite {
    font-weight: 600;
    color: var(--primary-color);
}

/* Footer */
footer {
    background-color: var(--dark-color);
    color: #fff;
    padding: 20px 0;
    text-align: center;
}

footer .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

footer .social a {
    color: #fff;
    margin-left: 15px;
    font-size: 1.2rem;
    transition: color 0.3s ease;
}

footer .social a:hover {
    color: var(--secondary-color);
}

/* Page Headers */
.page-header {
    background-color: var(--primary-color);
    color: #fff;
    padding: 60px 0;
    text-align: center;
}

.page-header h2 {
    font-size: 2.5rem;
    margin-bottom: 10px;
}

/* Available Direwolves Page */
.direwolves {
    padding: 60px 0;
}

.direwolves .container {
    display: grid;
    grid-template-columns: 1fr 3fr;
    gap: 30px;
}

.filter {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    align-self: start;
}

.filter h3 {
    margin-bottom: 20px;
    font-size: 1.5rem;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: 600;
}

.form-group select,
.form-group input[type="text"],
.form-group input[type="email"],
.form-group input[type="tel"],
.form-group textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.direwolf-list {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 30px;
}

.direwolf-card {
    background-color: #fff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
}

.direwolf-card:hover {
    transform: translateY(-5px);
}

.direwolf-card img {
    width: 100%;
    height: 250px;
    object-fit: cover;
}

.direwolf-info {
    padding: 20px;
}

.direwolf-info h3 {
    font-size: 1.5rem;
    margin-bottom: 10px;
    color: var(--primary-color);
}

.direwolf-info p {
    margin-bottom: 10px;
}

.direwolf-info .btn {
    margin-top: 15px;
}

/* About Page */
.about {
    padding: 60px 0;
}

.about-content {
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 30px;
    margin-bottom: 40px;
}

.about-image img {
    width: 100%;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.about-text h3 {
    font-size: 1.8rem;
    margin-bottom: 20px;
    color: var(--primary-color);
}

.about-text p {
    margin-bottom: 15px;
}

.about-text ul {
    margin-bottom: 20px;
    padding-left: 20px;
}

.about-text ul li {
    list-style-type: disc;
    margin-bottom: 10px;
}

.team h3 {
    font-size: 1.8rem;
    margin-bottom: 30px;
    text-align: center;
}

.team-members {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 30px;
}

.team-member {
    text-align: center;
}

.team-member img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 15px;
}

.team-member h4 {
    font-size: 1.2rem;
    margin-bottom: 5px;
}

.certifications {
    padding: 60px 0;
    background-color: var(--light-color);
    text-align: center;
}

.certifications h3 {
    font-size: 1.8rem;
    margin-bottom: 30px;
}

.certification-logos {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 30px;
}

.certification-logos img {
    height: 80px;
}

/* Contact Page */
.contact {
    padding: 60px 0;
}

.contact .container {
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 30px;
}

.contact-info {
    background-color: var(--primary-color);
    color: #fff;
    padding: 30px;
    border-radius: 10px;
}

.contact-info h3 {
    font-size: 1.8rem;
    margin-bottom: 30px;
}

.info-item {
    display: flex;
    margin-bottom: 20px;
}

.info-item i {
    font-size: 1.5rem;
    margin-right: 15px;
    color: var(--secondary-color);
}

.info-item h4 {
    font-size: 1.2rem;
    margin-bottom: 5px;
}

.social-links {
    margin-top: 30px;
    display: flex;
    gap: 15px;
}

.social-links a {
    display: inline-block;
    width: 40px;
    height: 40px;
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    transition: all 0.3s ease;
}

.social-links a:hover {
    background-color: var(--secondary-color);
    transform: translateY(-5px);
}

.contact-form {
    background-color: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.contact-form h3 {
    font-size: 1.8rem;
    margin-bottom: 30px;
    color: var(--primary-color);
}

.radio-group {
    display: flex;
    gap: 20px;
}

.map {
    padding: 60px 0;
    background-color: var(--light-color);
}

.map h3 {
    font-size: 1.8rem;
    margin-bottom: 30px;
    text-align: center;
}

.map-container {
    height: 400px;
    border-radius: 10px;
    overflow: hidden;
}

.map-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.faq {
    padding: 60px 0;
}

.faq h3 {
    font-size: 1.8rem;
    margin-bottom: 30px;
    text-align: center;
}

.accordion-item {
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.accordion-header {
    padding: 15px;
    background-color: #f9f9f9;
    font-weight: 600;
    cursor: pointer;
    position: relative;
}

.accordion-header:after {
    content: '+';
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
}

.accordion-content {
    padding: 0 15px;
    max-height: 0;
    overflow: hidden;
    transition: all 0.3s ease;
}

.accordion-item.active .accordion-content {
    padding: 15px;
    max-height: 1000px;
}

.accordion-item.active .accordion-header:after {
    content: '-';
}

/* Responsive Styles */
@media (max-width: 768px) {
    header .container {
        flex-direction: column;
    }

    nav ul {
        margin-top: 20px;
    }

    .direwolves .container {
        grid-template-columns: 1fr;
    }

    .about-content {
        grid-template-columns: 1fr;
    }

    .contact .container {
        grid-template-columns: 1fr;
    }
}
EOL

# Create JavaScript file
mkdir -p js
cat > js/script.js << 'EOL'
// DOM Elements
document.addEventListener('DOMContentLoaded', function() {
    // Mobile Menu Toggle
    const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
    const nav = document.querySelector('nav');
    
    if (mobileMenuToggle) {
        mobileMenuToggle.addEventListener('click', function() {
            nav.classList.toggle('active');
        });
    }

    // Accordion Functionality for FAQs
    const accordionItems = document.querySelectorAll('.accordion-item');
    
    if (accordionItems.length > 0) {
        accordionItems.forEach(item => {
            const header = item.querySelector('.accordion-header');
            
            header.addEventListener('click', function() {
                // Close all other accordion items
                accordionItems.forEach(otherItem => {
                    if (otherItem !== item) {
                        otherItem.classList.remove('active');
                    }
                });
                
                // Toggle the current item
                item.classList.toggle('active');
            });
        });
    }

    // Form Validation
    const contactForm = document.getElementById('contact-form');
    
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form inputs
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const message = document.getElementById('message').value.trim();
            
            // Simple validation
            if (name === '') {
                showError('Please enter your name');
                return;
            }
            
            if (email === '') {
                showError('Please enter your email');
                return;
            }
            
            if (!isValidEmail(email)) {
                showError('Please enter a valid email');
                return;
            }
            
            if (message === '') {
                showError('Please enter your message');
                return;
            }
            
            // If validation passes, show success message
            showSuccess('Your message has been sent! We will contact you soon.');
            
            // Reset form
            contactForm.reset();
        });
    }

    // Filter Functionality for Direwolves
    const filterForm = document.getElementById('filter-form');
    const direwolfCards = document.querySelectorAll('.direwolf-card');
    
    if (filterForm && direwolfCards.length > 0) {
        filterForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const age = document.getElementById('age').value;
            const gender = document.getElementById('gender').value;
            const color = document.getElementById('color').value;
            
            direwolfCards.forEach(card => {
                const cardInfo = card.querySelector('.direwolf-info');
                const cardAge = cardInfo.querySelector('p:nth-child(2)').textContent;
                const cardGender = cardInfo.querySelector('p:nth-child(3)').textContent;
                const cardColor = cardInfo.querySelector('p:nth-child(4)').textContent;
                
                let showCard = true;
                
                if (age && !cardAge.toLowerCase().includes(age.toLowerCase())) {
                    showCard = false;
                }
                
                if (gender && !cardGender.toLowerCase().includes(gender.toLowerCase())) {
                    showCard = false;
                }
                
                if (color && !cardColor.toLowerCase().includes(color.toLowerCase())) {
                    showCard = false;
                }
                
                if (showCard) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    }

    // Adoption Button Click Events
    const adoptButtons = document.querySelectorAll('.direwolf-card .btn');
    
    if (adoptButtons.length > 0) {
        adoptButtons.forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                
                const direwolfName = this.closest('.direwolf-info').querySelector('h3').textContent;
                alert(`Thank you for your interest in adopting ${direwolfName}! Please fill out the contact form, and our team will reach out to you with more information.`);
            });
        });
    }

    // Smooth Scrolling for Navigation Links
    const navLinks = document.querySelectorAll('nav a');
    
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            // Only apply to hash links that point to an anchor on the current page
            if (this.getAttribute('href').startsWith('#')) {
                e.preventDefault();
                
                const targetId = this.getAttribute('href');
                const targetElement = document.querySelector(targetId);
                
                if (targetElement) {
                    window.scrollTo({
                        top: targetElement.offsetTop - 100,
                        behavior: 'smooth'
                    });
                }
            }
        });
    });
});

// Helper Functions
function showError(message) {
    alert(message);
}

function showSuccess(message) {
    alert(message);
}

function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}
EOL

# Create README.md
cat > README.md << 'EOL'
# Direwolf Petshop

A responsive web application for a fictional direwolf pet shop, allowing users to browse available direwolves for adoption.

## Description

Direwolf Petshop is a fun, Game of Thrones-inspired web application that showcases direwolves available for adoption. Users can explore the website to learn about direwolves, view available pets, and submit contact forms for adoption inquiries.

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
├── images/                 # Image assets (not included in repository)
└── README.md               # Project documentation
```

## Setup and Installation

1. Clone the repository:
   ```
   git clone https://github.com/LewChew/direwolf.git
   ```

2. Open the project in your favorite code editor

3. Since this is a static website, you can view it by opening any of the HTML files in your web browser, or by using a local development server.

## Usage

- Navigate through the website using the navigation menu
- Browse available direwolves on the "Available Direwolves" page
- Use the filter options to find specific direwolves
- Learn about the company on the "About Us" page
- Contact the shop using the form on the "Contact" page

## Future Enhancements

- Add user authentication for adoption applications
- Implement a shopping cart for direwolf accessories
- Create a blog section with direwolf care tips
- Add a gallery page with customer photos

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Inspiration from Game of Thrones direwolves
- Font Awesome for the icons
- All images are placeholder and should be replaced with actual images for production use
EOL

# Create .gitignore
cat > .gitignore << 'EOL'
# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor directories and files
.idea/
.vscode/
*.sublime-project
*.sublime-workspace

# Node.js dependencies
node_modules/
npm-debug.log
yarn-error.log
yarn-debug.log
package-lock.json

# Build files
dist/
build/
.tmp/

# Environment files
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Log files
logs/
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Temporary files
*.tmp
*.swp
*.swo
EOL

# Create images directory and placeholder image
mkdir -p images
touch images/.gitkeep

# Initialize git repository
git init
git add .
git config --global user.name "LewChew"
git config --global user.email "example@example.com"
git commit -m "Initial commit for Direwolf Petshop website"

# Set up GitHub connection
cat > /root/github-setup.sh << 'EOL'
#!/bin/bash

# GitHub repository setup instructions
echo "======================= GitHub Setup Instructions ======================="
echo "To connect this repository to GitHub, follow these steps:"
echo ""
echo "1. Create a new repository named 'direwolf' on GitHub:"
echo "   - Visit https://github.com/new"
echo "   - Name: direwolf"
echo "   - Set it to Public"
echo "   - Do NOT initialize with README, .gitignore, or license"
echo "   - Click 'Create repository'"
echo ""
echo "2. Generate an SSH key (if you don't already have one):"
echo "   ssh-keygen -t ed25519 -C 'your-email@example.com'"
echo "   (Press Enter to accept default locations and create without passphrase)"
echo ""
echo "3. View and copy your public SSH key:"
echo "   cat ~/.ssh/id_ed25519.pub"
echo ""
echo "4. Add this SSH key to your GitHub account:"
echo "   - Go to https://github.com/settings/ssh/new"
echo "   - Title: Linode Direwolf VM"
echo "   - Key: Paste the content copied in step 3"
echo "   - Click 'Add SSH key'"
echo ""
echo "5. Connect your local repository to GitHub and push:"
echo "   git remote add origin git@github.com:LewChew/direwolf.git"
echo "   git push -u origin main"
echo ""
echo "Alternative method using HTTPS (if SSH doesn't work):"
echo "1. Generate a personal access token on GitHub:"
echo "   - Go to https://github.com/settings/tokens"
echo "   - Generate new token with 'repo' permissions"
echo ""
echo "2. Connect and push using HTTPS:"
echo "   git remote add origin https://github.com/LewChew/direwolf.git"
echo "   git push -u origin main"
echo "   (Use your GitHub username and the personal access token as password)"
echo "==================================================================="
EOL

chmod +x /root/github-setup.sh
echo "Setup complete! Run /root/github-setup.sh for GitHub connection instructions."
