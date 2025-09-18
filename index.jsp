// Add this to your existing JavaScript section
document.addEventListener('DOMContentLoaded', function() {
    // Setup image hover functionality
    const propertyCards = document.querySelectorAll('.property-card');
    
    propertyCards.forEach(card => {
        const images = card.querySelectorAll('.property-img');
        if (images.length <= 1) return; // Skip if only one image
        
        let currentIndex = 0;
        let imageInterval;
        
        // Start image rotation on hover
        card.addEventListener('mouseenter', function() {
            // Clear any existing interval
            if (imageInterval) clearInterval(imageInterval);
            
            // Set up interval to change images
            imageInterval = setInterval(() => {
                // Remove active class from current image
                images[currentIndex].classList.remove('active');
                
                // Move to next image
                currentIndex = (currentIndex + 1) % images.length;
                
                // Add active class to new current image
                images[currentIndex].classList.add('active');
            }, 1000); // Change image every 1 second
        });
        
        // Stop image rotation when not hovering
        card.addEventListener('mouseleave', function() {
            if (imageInterval) {
                clearInterval(imageInterval);
                imageInterval = null;
                
                // Reset to first image
                images.forEach((img, index) => {
                    if (index === 0) {
                        img.classList.add('active');
                    } else {
                        img.classList.remove('active');
                    }
                });
                currentIndex = 0;
            }
        });
    });
});