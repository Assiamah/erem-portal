<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EREM | Find Your Perfect Property</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/choices.js/public/assets/styles/choices.min.css">
    <!-- Simplebar Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.css">
    <!-- Swiper Css -->
    <link href="${pageContext.request.contextPath}/assets/libs/swiper/swiper-bundle.min.css" rel="stylesheet">
    <!-- Nouislider Css -->
    <link href="${pageContext.request.contextPath}/assets/libs/nouislider/nouislider.min.css" rel="stylesheet">
    <!--icons css-->
    <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate_.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animation_.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap_.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-select_.min.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/custom.css">
    <link href="${pageContext.request.contextPath}/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css">
    
    <style>
        :root {
            --white: #fff;
            --primary: #161326;
            --yellowgreen: #C0FAA0;
            --orchid: #C388F7;
            --khaki: #ECFF79;
            --lightskyblue: #AFC0FF;
            --black: #161326;
            --graydark: #6D6D6D;
            --gray: #A4A4A9;
            --gainsboro: #F8F8F8;
            --salmon: #FD7972;
            --lightgray: #D2DDDC;
            --orange: #24293E;
            --limeGreen: #24293E;
            --green: #2BC155;
            --gradient-1: linear-gradient(135deg, #2C5FAA, #3F51B5);
            --gradient-2: linear-gradient(135deg, #4CAF50, #43A047);
            --gradient-3: linear-gradient(135deg, #FF6B6B, #E53935);
            --gradient-bg: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
            --card-shadow: 0 15px 30px rgba(0, 0, 0, 0.08);
        }

        html {
            font-size: 80.5%;
            overflow-y: scroll;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
        }
        
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">EREM</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Properties</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Agents</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                </ul>
                <div class="d-flex align-items-center">
                    <a href="#" class="btn btn-outline-primary me-2"><i class="fas fa-heart" style="color: var(--salmon);"></i> Saved Properties</a>
                    <!-- <a href="#" class="btn btn-outline-primary me-2" id="signInBtn"><i class="fas fa-user" style="color: var(--orchid);"></i> Sign In</a> -->
                    <a href="#" class="btn btn-warning" id="signInBtn">Login or Register</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="display-4 fw-bold mb-4 mt-5">Find Your Dream Property With Us</h1>
                    <p class="lead mb-5">Browse thousands of properties for sale and rent across the country. Our advanced map technology helps you find the perfect location.</p>
                    
                    <div class="search-bar">
                        <div class="row g-0">
                            <div class="col-md-5">
                                <input type="text" class="search-input" placeholder="Enter city, address or ZIP">
                            </div>
                            <div class="col-md-3">
                                <select class="search-input">
                                    <option>All Properties</option>
                                    <option>For Sale</option>
                                    <option>For Rent</option>
                                    <option>Commercial</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <button class="search-btn w-100">Search <i class="fas fa-search ms-2"></i></button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mt-4">
                        <span class="text-white-50 me-3">Popular Searches:</span>
                        <a href="#" class="badge bg-light text-dark me-2 text-decoration-none">Accra</a>
                        <a href="#" class="badge bg-light text-dark me-2 text-decoration-none">Kumasi</a>
                        <a href="#" class="badge bg-light text-dark me-2 text-decoration-none">Cape Coast</a>
                        <a href="#" class="badge bg-light text-dark me-2 text-decoration-none">Tema</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <!-- Will contain hero image or additional content -->
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Properties -->
    <section class="py-5">
        <div class="container py-5">
            <h2 class="section-title">Featured Properties</h2>
            <div class="row mt-5">
                <div class="col-md-4">
                    <div class="property-card">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" class="property-img" alt="Luxury Villa">
                            <span class="property-badge" style="background: var(--green);">For Sale</span>
                        </div>
                        <div class="p-3">
                            <div class="property-price"><small>GHS</small>2,550,000</div>
                            <h5>Luxury Villa with Pool</h5>
                            <p class="text-gray"><i class="fas fa-map-marker-alt me-2"></i> East Legon, Accra</p>
                            <div class="d-flex justify-content-between border-top pt-3">
                                <span><i class="fas fa-bed me-2"></i> 4 Beds</span>
                                <span><i class="fas fa-bath me-2"></i> 3 Baths</span>
                                <span><i class="fas fa-ruler-combined me-2"></i> 2,500 sq.ft.</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="property-card">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" class="property-img" alt="Modern Apartment">
                            <span class="property-badge" style="background: var(--salmon);">For Rent</span>
                        </div>
                        <div class="p-3">
                            <div class="property-price"><small>GHS</small>2,800/mo</div>
                            <h5>Modern Downtown Apartment</h5>
                            <p class="text-gray"><i class="fas fa-map-marker-alt me-2"></i> Abelemkpe, Accra</p>
                            <div class="d-flex justify-content-between border-top pt-3">
                                <span><i class="fas fa-bed me-2"></i> 2 Beds</span>
                                <span><i class="fas fa-bath me-2"></i> 2 Baths</span>
                                <span><i class="fas fa-ruler-combined me-2"></i> 1,200 sq.ft.</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="property-card">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1574362848149-11496d93a7c7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" class="property-img" alt="Country House">
                            <span class="property-badge" style="background: var(--green);">For Sale</span>
                        </div>
                        <div class="p-3">
                            <div class="property-price"><small>GHS</small>5,425,000</div>
                            <h5>Countryside Family Home</h5>
                            <p class="text-gray"><i class="fas fa-map-marker-alt me-2"></i> Cantoments, Accra</p>
                            <div class="d-flex justify-content-between border-top pt-3">
                                <span><i class="fas fa-bed me-2"></i> 3 Beds</span>
                                <span><i class="fas fa-bath me-2"></i> 2 Baths</span>
                                <span><i class="fas fa-ruler-combined me-2"></i> 2,100 sq.ft.</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="#" class="btn btn-outline-primary">View All Properties <i class="fas fa-arrow-right ms-2"></i></a>
            </div>
        </div>
    </section>

    <!-- Interactive Map Section -->
    <section class="py-5 bg-light">
        <div class="container py-5">
            <h2 class="section-title">Find Properties on Map</h2>
            <p class="mb-5">Browse available properties based on location. Zoom in to see more details.</p>
            
            <div class="position-relative">
                <div id="map"></div>
                <div class="map-overlay">
                    <h5>Filter Properties</h5>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="forSale" checked>
                        <label class="form-check-label" for="forSale">For Sale</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="forRent" checked>
                        <label class="form-check-label" for="forRent">For Rent</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="commercial">
                        <label class="form-check-label" for="commercial">Commercial</label>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="priceRange" class="form-label">Price Range</label>
                        <input type="range" class="form-range" id="priceRange" min="0" max="1000000" step="50000">
                        <div class="d-flex justify-content-between">
                            <small>GHS0</small>
                            <small>GHS10,000,000</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="property-info">
                <h2>Property Types</h2>
                <div class="legend">
                    <div class="legend-item">
                        <div class="legend-icon">
                            <i class="fas fa-building sale-icon"></i>
                        </div>
                        <span>Properties for Sale</span>
                    </div>
                    <div class="legend-item">
                        <div class="legend-icon">
                            <i class="fas fa-building rent-icon"></i>
                        </div>
                        <span>Properties for Rent</span>
                    </div>
                    <div class="legend-item">
                        <div class="legend-icon">
                            <i class="fas fa-building commercial-icon"></i>
                        </div>
                        <span>Commercial Properties</span>
                    </div>
                </div>
            </div>
            
            <div class="instructions">
                <h3><i class="fas fa-info-circle"></i> How to Use the Map</h3>
                <ul>
                    <li>Click on any building icon to view property details</li>
                    <li>Use the filter panel to show/hide property types</li>
                    <li>Adjust the price range slider to filter by price</li>
                    <li>Zoom in/out to see more properties in different areas</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works">
        <div class="container">
            <h2 class="text-center" style="font-size: 2.8rem; font-weight: 700;">How It Works</h2>
            <p class="section-subtitle">Finding your perfect property has never been easier with our simple 3-step process</p>
            
            <div class="process-cards">
                <div class="process-card process-card-1">
                    <div class="step-number">1</div>
                    <div class="card-icon">
                        <i class="fas fa-search"></i>
                    </div>
                    <h3>Search</h3>
                    <p>Filter properties based on your criteria - location, price, type and more with our advanced search tools.</p>
                </div>
                
                <div class="process-card process-card-2">
                    <div class="step-number">2</div>
                    <div class="card-icon">
                        <i class="fas fa-house-user"></i>
                    </div>
                    <h3>Visit</h3>
                    <p>Schedule in-person or virtual tours of your favorite properties with our easy booking system.</p>
                </div>
                
                <div class="process-card process-card-3">
                    <div class="step-number">3</div>
                    <div class="card-icon">
                        <i class="fas fa-file-contract"></i>
                    </div>
                    <h3>Purchase</h3>
                    <p>Make an offer and complete all paperwork securely through our digital platform with expert guidance.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <!-- <section class="testimonials">
        <div class="container">
            <h2 class="section-title">What Our Clients Say</h2>
            <p class="section-subtitle">Read testimonials from our satisfied customers</p>
            
            <div class="testimonial-cards">
                <div class="testimonial-card">
                    <div class="testimonial-header">
                        <img src="https://randomuser.me/api/portraits/women/65.jpg" class="testimonial-avatar">
                        <div class="testimonial-info">
                            <h4>Sarah Johnson</h4>
                            <p>Property Buyer</p>
                        </div>
                    </div>
                    <div class="testimonial-content">
                        "EREM made finding our dream home so easy. The map feature helped us find exactly the right neighborhood!"
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                </div>
                
                <div class="testimonial-card">
                    <div class="testimonial-header">
                        <img src="https://randomuser.me/api/portraits/men/32.jpg" class="testimonial-avatar">
                        <div class="testimonial-info">
                            <h4>Michael Chen</h4>
                            <p>Property Seller</p>
                        </div>
                    </div>
                    <div class="testimonial-content">
                        "I sold my apartment in record time thanks to EREM. Their platform reached serious buyers quickly."
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
                
                <div class="testimonial-card">
                    <div class="testimonial-header">
                        <img src="https://randomuser.me/api/portraits/women/45.jpg" class="testimonial-avatar">
                        <div class="testimonial-info">
                            <h4>Emily Rodriguez</h4>
                            <p>Real Estate Investor</p>
                        </div>
                    </div>
                    <div class="testimonial-content">
                        "The investment properties I've found through EREM have outperformed all my expectations. Great ROI!"
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                </div>
            </div>
        </div>
    </section> -->

    <!-- Call to Action -->
    <section class="py-5" style="background: var(--yellowgreen); color: black;">
        <div class="container py-5 text-center">
            <h2 class="mb-4">Ready to Find Your Dream Property?</h2>
            <p class="lead mb-5">Join thousands of satisfied clients who found their perfect home through EREM</p>
            <a href="#" class="btn btn-light btn-lg px-5 py-3">Get Started <i class="fas fa-arrow-right ms-2"></i></a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer_">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <h4 class="footer-title">EREM</h4>
                    <p>Finding your perfect property has never been easier with our advanced search technology and dedicated agents.</p>
                    <div class="mt-3">
                        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mb-4">
                    <h4 class="footer-title">Quick Links</h4>
                    <a href="#" class="footer-link">Properties</a>
                    <a href="#" class="footer-link">Services</a>
                    <a href="#" class="footer-link">Agents</a>
                    <a href="#" class="footer-link">About Us</a>
                    <a href="#" class="footer-link">Contact</a>
                </div>
                <div class="col-lg-2 col-md-4 mb-4">
                    <h4 class="footer-title">Resources</h4>
                    <a href="#" class="footer-link">Blog</a>
                    <a href="#" class="footer-link">FAQ</a>
                    <a href="#" class="footer-link">Guides</a>
                    <a href="#" class="footer-link">Support</a>
                    <a href="#" class="footer-link">Privacy Policy</a>
                </div>
                <div class="col-lg-4 col-md-4 mb-4">
                    <h4 class="footer-title">Contact Us</h4>
                    <p><i class="fas fa-map-marker-alt me-2"></i> 123 Estate Avenue, East Legon, Accra</p>
                    <p><i class="fas fa-phone me-2"></i> (233) 304 456 8037</p>
                    <p><i class="fas fa-envelope me-2"></i> info@EREM.com</p>
                    <div class="mt-4">
                        <h5 class="footer-title">Newsletter</h5>
                        <div class="input-group">
                            <input type="email" class="form-control" placeholder="Your email">
                            <button class="btn btn-warning">Subscribe</button>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="mt-4 mb-4" style="border-color: rgba(255,255,255,0.1);">
            <div class="text-center">
                <p>&copy; 
                    <script type="text/javascript">
                        document.write(new Date().getFullYear());
                    </script>
                    EREM. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Offcanvas Sign-in Form -->
    <div class="offcanvas_" id="signInForm">
        <button class="btn-close" id="closeBtn">
            <i class="fas fa-times"></i>
        </button>
        
        <div class="card mx-xxl-8 shadow-none">
            <div class="card-body p-8">
                <h3 class="fw-medium text-center">Welcome back!</h3>
                <p class="mb-8 text-muted text-center">Enter your credentials to sign in</p>
                <form id="loginForm" class="mb-3">
                    <div class="mb-4">
                        <label for="email" class="form-label">Email Address <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="email" placeholder="name@example.com" required>
                    </div>
                    <div class="mb-4">
                        <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                        <div class="password-container">
                            <input type="password" class="form-control" id="password" placeholder="Enter your password" required>
                            <button type="button" class="btn-toggle-password" id="togglePassword">
                                <i class="far fa-eye"></i>
                            </button>
                        </div>
                    </div>
                    <div class="form-options">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>
                        <a href="#" class="forgot-link">Forgot password?</a>
                    </div>
                    
                    <button type="submit" class="btn-login">Sign In</button>
                    
                    <div class="divider">
                        <span class="divider-text">Or continue with</span>
                    </div>
                    
                    <button type="button" class="btn-google">
                        <img src="assets/images/google.png" alt="Google Logo" class="h-20px w-20px">
                        Sign in with Google
                    </button>
                    
                    <div class="signup-text">
                        Don't have an account? <a href="#" class="signup-link">Sign up here</a>
                    </div>
                </form>
                <!-- <div class="real-estate-bg">
                    <div class="bg-content">
                        <h5>Find Your Perfect Home</h5>
                        <p>Thousands of premium listings waiting for you</p>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
    
    <div class="overlay" id="overlay"></div>

    <script src="${pageContext.request.contextPath}/assets/libs/swiper/swiper-bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/scroll-top.init.js"></script>
    <!-- Select js -->
    <script src="${pageContext.request.contextPath}/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>
    <!-- App js -->
    <!-- <script src="assets/js/app.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Get DOM elements
            const signInBtn = document.getElementById('signInBtn');
            const closeBtn = document.getElementById('closeBtn');
            const overlay = document.getElementById('overlay');
            const signInForm = document.getElementById('signInForm');
            const loginForm = document.getElementById('loginForm');
            
            // Open offcanvas
            signInBtn.addEventListener('click', () => {
                signInForm.classList.add('active');
                overlay.classList.add('active');
                document.body.style.overflow = 'hidden';
            });
            
            // Close offcanvas
            function closeOffcanvas() {
                signInForm.classList.remove('active');
                overlay.classList.remove('active');
                document.body.style.overflow = 'auto';
            }
            
            closeBtn.addEventListener('click', closeOffcanvas);
            overlay.addEventListener('click', closeOffcanvas);
            
            // Handle form submission
            loginForm.addEventListener('submit', (e) => {
                e.preventDefault();
                const email = document.getElementById('email').value;
                const password = document.getElementById('password').value;
                
                // Here you would typically validate and send the data to a server
                console.log('Sign in attempted with:', { email, password });
                
                // Show success message (in a real app, you would handle properly)
                alert('Sign in successful! (This is just a demo)');
                closeOffcanvas();
            });
            
            // Close with Escape key
            document.addEventListener('keydown', (e) => {
                if (e.key === 'Escape' && signInForm.classList.contains('active')) {
                    closeOffcanvas();
                }
            });
        });

        // Toggle password visibility
        document.getElementById('togglePassword').addEventListener('click', function() {
            const passwordInput = document.getElementById('password');
            const icon = this.querySelector('i');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });
        // Add subtle hover animations
        document.querySelectorAll('.process-card, .testimonial-card').forEach(card => {
            card.addEventListener('mouseenter', () => {
                card.style.transform = card.classList.contains('process-card') ? 
                    'translateY(-15px)' : 'translateY(-10px)';
            });
            
            card.addEventListener('mouseleave', () => {
                card.style.transform = 'translateY(0)';
            });
        });

        // Initialize map
        var map = L.map('map').setView([40.7128, -74.0060], 13);
        
        // Add tile layer
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
        
        // Sample property data
        var properties = [
            {
                latlng: [40.7128, -74.0060], 
                type: "sale", 
                price: 550000, 
                address: "Luxury Villa, Miami, FL",
                beds: 4,
                baths: 3,
                area: 2500,
                year: 2020
            },
            {
                latlng: [40.7210, -74.0002], 
                type: "rent", 
                price: 2800, 
                address: "Modern Apartment, New York, NY",
                beds: 2,
                baths: 2,
                area: 1200,
                year: 2018
            },
            {
                latlng: [40.7050, -74.0090], 
                type: "sale", 
                price: 425000, 
                address: "Country House, Austin, TX",
                beds: 3,
                baths: 2,
                area: 2100,
                year: 2015
            },
            {
                latlng: [40.7180, -74.0150], 
                type: "commercial", 
                price: 675000, 
                address: "Downtown Loft, New York, NY",
                beds: 3,
                baths: 3,
                area: 2200,
                year: 2019
            },
            {
                latlng: [40.7080, -74.0050], 
                type: "rent", 
                price: 3200, 
                address: "Waterfront Condo, New York, NY",
                beds: 2,
                baths: 2,
                area: 1300,
                year: 2021
            },
            {
                latlng: [40.7150, -74.0120], 
                type: "sale", 
                price: 750000, 
                address: "Penthouse Suite, New York, NY",
                beds: 3,
                baths: 3,
                area: 2400,
                year: 2022
            },
            {
                latlng: [40.7100, -74.0080], 
                type: "commercial", 
                price: 1200000, 
                address: "Office Building, New York, NY",
                beds: 0,
                baths: 4,
                area: 5000,
                year: 2010
            }
        ];
        
        // Create custom building icons using DivIcon
        function createBuildingIcon(propertyType) {
            let className = 'building-icon ';
            let iconHtml = '<i class="fas fa-building"></i>';
            
            if (propertyType === 'sale') {
                className += 'sale-marker';
            } else if (propertyType === 'rent') {
                className += 'rent-marker';
            } else if (propertyType === 'commercial') {
                className += 'commercial-marker';
                iconHtml = '<i class="fas fa-store"></i>';
            }
            
            return L.divIcon({
                className: className,
                html: iconHtml,
                iconSize: [30, 30],
                iconAnchor: [15, 15]
            });
        }
        
        // Add markers to map with building icons
        var markers = [];
        
        properties.forEach(function(property) {
            var icon = createBuildingIcon(property.type);
            
            var marker = L.marker(property.latlng, {icon: icon}).addTo(map);
            
            // Create detailed popup content
            var popupContent = `
                <div style="min-width: 250px;">
                    <h3 style="margin: 0 0 10px; color: `+property.type === 'sale' ? '#2C5FAA' : property.type === 'rent' ? '#4CAF50' : '#FF6B6B'+`">`+property.address+`</h3>
                    <p style="margin: 0 0 10px; font-size: 1.2em; font-weight: bold;">
                        `+property.type === "sale" ? "For Sale" : property.type === "rent" ? "For Rent" : "Commercial"+`: GHS`+property.price.toLocaleString()+``+property.type === "rent" ? "/mo" : ""+`
                    </p>
                    <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                        <span><i class="fas fa-bed"></i> `+property.beds+` Beds</span>
                        <span><i class="fas fa-bath"></i> `+property.baths+` Baths</span>
                        <span><i class="fas fa-ruler-combined"></i> `+property.area+` sq.ft.</span>
                    </div>
                    <p style="margin: 0; font-size: 0.9em; color: #666;">Year built: `+property.year+`</p>
                    <button style="margin-top: 15px; padding: 8px 15px; background: #2C5FAA; color: white; border: none; border-radius: 4px; cursor: pointer; width: 100%;">
                        View Details
                    </button>
                </div>
            `;
            
            marker.bindPopup(popupContent);
            markers.push(marker);
        });
        
        // Add geolocation
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var userLatLng = [position.coords.latitude, position.coords.longitude];
                var userMarker = L.marker(userLatLng, {
                    icon: L.divIcon({
                        className: 'user-marker',
                        html: '<i class="fas fa-user"></i>',
                        iconSize: [25, 25],
                        iconAnchor: [12, 12]
                    })
                }).addTo(map);
                
                userMarker.bindPopup("Your Location").openPopup();
                map.setView(userLatLng, 13);
            });
        }
        
        // Add filter functionality
        document.getElementById('forSale').addEventListener('change', updateFilters);
        document.getElementById('forRent').addEventListener('change', updateFilters);
        document.getElementById('commercial').addEventListener('change', updateFilters);
        
        function updateFilters() {
            var showSale = document.getElementById('forSale').checked;
            var showRent = document.getElementById('forRent').checked;
            var showCommercial = document.getElementById('commercial').checked;
            
            markers.forEach(function(marker) {
                var propertyType = marker.options.icon.options.className.includes('sale-marker') ? 'sale' : 
                                  marker.options.icon.options.className.includes('rent-marker') ? 'rent' : 'commercial';
                
                if ((propertyType === 'sale' && showSale) || 
                    (propertyType === 'rent' && showRent) || 
                    (propertyType === 'commercial' && showCommercial)) {
                    map.addLayer(marker);
                } else {
                    map.removeLayer(marker);
                }
            });
        }
    </script>
</body>
</html>