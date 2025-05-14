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