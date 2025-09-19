<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" rel="stylesheet">
    
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
        :root {
            --white: #fff;
            --primary: #5b66eb;
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
        
        /* Futuristic Property Slider Styles */
        .property-slider {
            overflow: hidden;
            border-radius: 15px;
            padding: 20px 0;
        }
        
        .property-card {
            border-radius: 12px;
            overflow: hidden;
            background: var(--white);
            box-shadow: var(--card-shadow);
            transition: all 0.4s ease;
            border: 1px solid rgba(0,0,0,0.05);
            height: 100%;
            transform: translateY(0);
        }
        
        .property-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
            border-color: rgba(91, 102, 235, 0.2);
        }

        .property-image-container {
            position: relative;
            overflow: hidden;
            height: 220px;
        }
        
        .property-img {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            object-fit: cover;
            transition: opacity 1.5s ease-in-out, transform 1.5s ease-in-out;
            opacity: 0;
            transform: scale(1.05);
        }

        .property-img.active {
            opacity: 1;
            z-index: 1;
            transform: scale(1);
        }

        .property-card:hover .property-img {
            transform: scale(1.05);
        }
        
        .property-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 5px 12px;
            border-radius: 20px;
            color: white;
            font-weight: 600;
            font-size: 0.8rem;
            backdrop-filter: blur(5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .property-price {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 8px;
        }
        
        .property-price small {
            font-size: 0.9rem;
            margin-right: 4px;
            opacity: 0.8;
        }
        
        /* Slider Navigation */
        .slider-navigation {
            position: absolute;
            top: 50%;
            width: 100%;
            z-index: 10;
            transform: translateY(-50%);
            pointer-events: none;
            display: flex;
            justify-content: space-between;
            padding: 0 -10px;
        }
        
        .slider-nav-btn {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.9);
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            pointer-events: auto;
            color: var(--primary);
            font-size: 1.2rem;
        }
        
        .slider-nav-btn:hover {
            background: var(--primary);
            color: white;
            transform: scale(1.1);
        }
        
        .prev-btn {
            margin-left: -25px;
        }
        
        .next-btn {
            margin-right: -25px;
        }
        
        /* Pagination Styles */
        .swiper-pagination {
            position: relative;
            margin-top: 20px;
        }
        
        .swiper-pagination-bullet {
            width: 10px;
            height: 10px;
            background: var(--lightgray);
            opacity: 1;
            transition: all 0.3s ease;
        }
        
        .swiper-pagination-bullet-active {
            width: 30px;
            border-radius: 5px;
            background: var(--primary);
        }
        
        /* Futuristic Navbar Styles */
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            padding: 0.8rem 0;
            padding-bottom: 25px;
        }
        
        .navbar.scrolled {
            background: rgba(255, 255, 255, 0.98);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            padding: 0.5rem 0;
        }
        
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 800;
            background: linear-gradient(135deg, var(--primary), #8b5cf6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-decoration: none;
            position: relative;
            transition: all 0.3s ease;
        }
        
        .navbar-brand::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(135deg, var(--primary), #8b5cf6);
            transition: width 0.3s ease;
        }
        
        .navbar-brand:hover::after {
            width: 100%;
        }
        
        .nav-link {
            color: var(--black) !important;
            font-weight: 600;
            font-size: 0.95rem;
            padding: 0.8rem 1.2rem !important;
            border-radius: 25px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .nav-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(91, 102, 235, 0.1), rgba(139, 92, 246, 0.1));
            transition: left 0.3s ease;
            z-index: -1;
        }
        
        .nav-link:hover {
            color: var(--primary) !important;
            transform: translateY(-2px);
        }
        
        .nav-link:hover::before {
            left: 0;
        }
        
        .btn {
            border-radius: 25px;
            font-weight: 600;
            padding: 0.6rem 1.5rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            border: none;
            text-decoration: none;
        }
        
        .btn-outline-primary {
            background: transparent;
            border: 2px solid var(--primary);
            color: var(--primary);
            position: relative;
        }
        
        .btn-outline-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: var(--primary);
            transition: left 0.3s ease;
            z-index: -1;
        }
        
        .btn-outline-primary:hover {
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(91, 102, 235, 0.3);
        }
        
        .btn-outline-primary:hover::before {
            left: 0;
        }
        
        .btn-warning {
            background: linear-gradient(135deg, #ff6b6b, #ffa726);
            color: white;
            border: none;
            position: relative;
        }
        
        .btn-warning::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #ff5252, #ff9800);
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: -1;
        }
        
        .btn-warning:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 107, 107, 0.4);
        }
        
        .btn-warning:hover::before {
            opacity: 1;
        }

        .btn-success {
            background: linear-gradient(135deg, #4caf50, #8bc34a);
            color: white;
            border: none;
            position: relative;
        }
        
        .btn-success::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #43a047, #7cb342);
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: -1;
        }
        
        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(76, 175, 80, 0.4);
        }
        
        .btn-success:hover::before {
            opacity: 1;
        }
        
        .navbar-toggler {
            border: none;
            padding: 0.5rem;
            border-radius: 8px;
            background: rgba(91, 102, 235, 0.1);
            transition: all 0.3s ease;
        }
        
        .navbar-toggler:hover {
            background: rgba(91, 102, 235, 0.2);
            transform: scale(1.05);
        }
        
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%2891, 102, 235, 1%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='m4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }
        
        /* Mobile Responsive */
        @media (max-width: 991.98px) {
            .navbar-collapse {
                background: rgba(255, 255, 255, 0.98);
                backdrop-filter: blur(20px);
                border-radius: 15px;
                margin-top: 1rem;
                padding: 1.5rem;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            }
            
            .nav-link {
                margin: 0.3rem 0;
            }
            
            .btn {
                margin: 0.5rem 0;
                width: 100%;
            }
        }
        
        /* Add padding to body to account for fixed navbar */
        body {
            padding-top: 80px;
        }
        
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">SmartErem</a>
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
                    <!-- <p>Welcome, ${userInfo.email}</p>
                    <a href="#" class="btn btn-outline-primary me-2"><i class="fas fa-heart" style="color: var(--salmon);"></i> Saved Properties</a>
                     <a href="#" class="btn btn-warning"><i class="fas fa-user" style="color: var(--dark);"></i> My Dashboard</a>
                    <a href="#" class="btn btn-warning" id="signInBtn">Login or Register</a> -->
                    <c:choose>
                        <c:when test="${not empty userInfo.email}">
                            <!-- <p>Welcome, ${userInfo.first_name}</p> -->
                            <a href="#" class="btn btn-outline-primary me-2">
                                <i class="fas fa-heart" style="color: var(--salmon);"></i> Saved Properties
                            </a>
                            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-warning">
                                <i class="fas fa-user" style="color: var(--dark);"></i> My Dashboard
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="#" class="btn btn-warning" id="signInBtn">Login or Register</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="display-4 fw-bold mb-4 mt-5">Find Your Perfect Piece of Land</h1>
                    <p class="lead mb-5">Browse available land parcels, save favorites, and apply online with our streamlined process.</p>
                    
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
                                <button class="search-btn_ w-100">Search <i class="fas fa-search ms-2"></i></button>
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
            <h2 class="section-title">Featured Collections</h2>
            <div class="position-relative mt-5">
                <!-- Slider Navigation -->
                <div class="slider-navigation">
                    <button class="slider-nav-btn prev-btn"><i class="fas fa-chevron-left"></i></button>
                    <button class="slider-nav-btn next-btn"><i class="fas fa-chevron-right"></i></button>
                </div>
                
                <!-- Swiper Slider -->
                <div class="swiper-container property-slider">
                    <div class="swiper-wrapper">
                        <!-- Property Card 1 -->
                        <div class="swiper-slide">
                            <div class="property-card">
                                <div class="position-relative property-image-container">
                                    <img src="https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" class="property-img active" alt="Luxury Villa">
                                    <img src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" class="property-img" alt="Luxury Villa Interior">
                                    <img src="https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" class="property-img" alt="Luxury Villa Kitchen">
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
                        
                        <!-- Property Card 2 -->
                        <div class="swiper-slide">
                            <div class="property-card">
                                <div class="position-relative property-image-container">
                                    <img src="https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img active" alt="Modern Apartment Exterior">
                                    <img src="https://images.unsplash.com/photo-1600585154205-91d4f3a5e6a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img" alt="Modern Apartment Living Room">
                                    <img src="https://images.unsplash.com/photo-1600585153944-41892c3d4e99?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img" alt="Modern Apartment Kitchen">
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
                        
                        <!-- Property Card 3 -->
                        <div class="swiper-slide">
                            <div class="property-card">
                                <div class="position-relative property-image-container">
                                    <img src="https://images.unsplash.com/photo-1574362848149-11496d93a7c7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img active" alt="Country House Exterior">
                                    <img src="https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img" alt="Country House Living Room">
                                    <img src="https://images.unsplash.com/photo-1600585154154-6c99b9a78f8e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img" alt="Country House Kitchen">
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
                        
                        <!-- Property Card 4 -->
                        <div class="swiper-slide">
                           <div class="property-card">
                                <div class="position-relative property-image-container">
                                    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img active" alt="Modern Villa Exterior">
                                    <img src="https://images.unsplash.com/photo-1600607687644-c997f5f9c1d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img" alt="Modern Villa Living Room">
                                    <img src="https://images.unsplash.com/photo-1600585154154-6c99b9a78f8e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img" alt="Modern Villa Kitchen">
                                    <span class="property-badge" style="background: var(--green);">For Sale</span>
                                </div>
                                <div class="p-3">
                                    <div class="property-price"><small>GHS</small>3,750,000</div>
                                    <h5>Ultra-Modern Smart Home</h5>
                                    <p class="text-gray"><i class="fas fa-map-marker-alt me-2"></i> Airport Residential, Accra</p>
                                    <div class="d-flex justify-content-between border-top pt-3">
                                        <span><i class="fas fa-bed me-2"></i> 5 Beds</span>
                                        <span><i class="fas fa-bath me-2"></i> 4 Baths</span>
                                        <span><i class="fas fa-ruler-combined me-2"></i> 3,200 sq.ft.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Property Card 5 -->
                        <div class="swiper-slide">
                           <div class="property-card">
                                <div class="position-relative property-image-container">
                                    <img src="https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img active" alt="Luxury Beachfront Apartment Exterior">
                                    <img src="https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img" alt="Luxury Beachfront Apartment Living Room">
                                    <img src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img" alt="Luxury Beachfront Apartment Kitchen">
                                    <span class="property-badge" style="background: var(--salmon);">For Rent</span>
                                </div>
                                <div class="p-3">
                                    <div class="property-price"><small>GHS</small>3,500/mo</div>
                                    <h5>Luxury Beachfront Apartment</h5>
                                    <p class="text-gray"><i class="fas fa-map-marker-alt me-2"></i> Labadi, Accra</p>
                                    <div class="d-flex justify-content-between border-top pt-3">
                                        <span><i class="fas fa-bed me-2"></i> 3 Beds</span>
                                        <span><i class="fas fa-bath me-2"></i> 3 Baths</span>
                                        <span><i class="fas fa-ruler-combined me-2"></i> 1,800 sq.ft.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Property Card 6 -->
                        <div class="swiper-slide">
                           <div class="property-card">
                                <div class="position-relative property-image-container">
                                    <img src="https://images.unsplash.com/photo-1613977257363-707ba9348227?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img active" alt="Premium Office Space Exterior">
                                    <img src="https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img" alt="Premium Office Space Interior">
                                    <img src="https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                                        class="property-img" alt="Premium Office Meeting Room">
                                    <span class="property-badge" style="background: var(--primary);">Commercial</span>
                                </div>
                                <div class="p-3">
                                    <div class="property-price"><small>GHS</small>4,200/mo</div>
                                    <h5>Premium Office Space</h5>
                                    <p class="text-gray"><i class="fas fa-map-marker-alt me-2"></i> Ridge, Accra</p>
                                    <div class="d-flex justify-content-between border-top pt-3">
                                        <span><i class="fas fa-users me-2"></i> 20 Capacity</span>
                                        <span><i class="fas fa-door-open me-2"></i> 5 Rooms</span>
                                        <span><i class="fas fa-ruler-combined me-2"></i> 2,000 sq.ft.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Pagination -->
                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="/building-materials" class="btn btn-outline-primary">Explore Our Portfolio <i class="fas fa-arrow-right ms-2"></i></a>
            </div>
        </div>
    </section>

    <!-- Interactive Map Section -->
    <section class="py-5 bg-light">
        <div class="container py-5">
            <h2 class="section-title">Find Available Parcels on the Interactive Map</h2>
            <p class="mb-5">
            Use the interactive map below to explore land parcels currently available for application. 
            Zoom in to view parcel boundaries, and click on any highlighted parcel 
            to see detailed information such as location, size, availability status, and application options. 
            For the best experience, zoom in closely to reveal more precise parcel outlines and property details.
            </p>
            
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
                         <div class="tab-pane fade show active" id="html-basic-range" role="tabpanel" aria-labelledby="html-basic-range-tab" tabindex="0">
                            <input type="range" class="form-range" id="priceRange" min="0" max="1000000" step="50000">
                        </div>
                        <div class="d-flex justify-content-between">
                            <small>GHS0</small>
                            <small>GHS10,000,000</small>
                        </div>
                    </div>
                </div>

                <!-- Parcel Details Offcanvas -->
                <div class="map-offcanvas text-small" id="parcelOffcanvas">
                    <div class="offcanvas-header__parcel">
                        <h5 class="offcanvas-title__parcel">Parcel Details</h5>
                        <button type="button" class="btn-close__parcel text-dark" onclick="hideParcelOffcanvas()"><i class="fas fa-times"></i></button>
                    </div>
                    <div class="offcanvas-body__parcel" id="parcelOffcanvasBody">
                        <!-- Content will be loaded dynamically -->
                    </div>

                    <!-- Offcanvas footer -->
                    <div class="offcanvas-footer__parcel">
                        <button class="btn btn-outline-primary btn-sm me-2" onclick="saveParcel()">
                        <i class="fas fa-heart" style="color: var(--salmon);"></i> Save Parcel
                        </button>
                        <button class="btn btn-success btn-sm" onclick="applyForParcel()">
                        <i class="fas fa-file-signature"></i> Apply Now
                        </button>
                    </div>
                </div>
            </div>
            <!-- <div class="property-info">
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
            </div> -->
            
            <div class="instructions">
                <h3><i class="fas fa-info-circle"></i> How to Use the Parcel Map</h3>
                <ul>
                    <li>Click on any highlighted parcel to view its details, including size, location, and availability.</li>
                    <li>Use the filter panel to show or hide parcels by type (e.g., residential, commercial, agricultural).</li>
                    <li>Adjust the price or size range sliders to narrow down parcels that match your preferences.</li>
                    <li>Zoom in and out or drag the map to explore different regions and discover more available parcels.</li>
                    <li>Save parcels to your favorites for quick access later, or sign in to apply directly from the detail view.</li>
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
                    <h4 class="footer-title">SmartErem</h4>
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
                    SmartErem. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Offcanvas Sign-in Form -->
    <jsp:include page="auth/auth.jsp"></jsp:include>

    <div class="overlay" id="overlay"></div>

    <div id="cookieBanner" class="cookie-banner">
        <p>We use cookies to enhance your experience. By continuing to visit this site you agree to our use of cookies.</p>
        <div class="cookie-buttons">
            <button id="acceptCookies" class="cookie-btn accept-btn">Accept All</button>
            <button id="rejectCookies" class="cookie-btn reject-btn">Reject</button>
        </div>
    </div>

    <div class="modal fade modal-blur parcel-modal" id="parcelModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="addUserModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="parcelModalLabel">Parcel Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="parcelModalBody">
                    <!-- Content will be loaded dynamically -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-favorite"><i class="fas fa-heart"></i> Save</button>
                    <button type="button" class="btn btn-contact"><i class="fas fa-envelope"></i> Contact Agent</button>
                </div>
            </div>
        </div>
    </div>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.8.0/proj4.js"></script>
    <script>
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

        let map;
        let parcelModal = new bootstrap.Modal(document.getElementById('parcelModal'));
        let highlightedParcel = null;
        let parcelLayer = null;

        // Define source (EPSG:2136) and destination (EPSG:4326)
        proj4.defs("EPSG:2136", "+proj=tmerc +lat_0=4.666666666666667 +lon_0=-1 +k=0.99975 +x_0=274319.736 +y_0=0 +ellps=clrk80 +units=m +no_defs");

        // Example point in EPSG:2136
        let point2136 = [264970, 1015339]; // [x, y]

        // Convert to EPSG:4326
        let point4326 = proj4("EPSG:2136", "EPSG:4326", point2136);

        // Leaflet expects [lat, lon]
        let leafletCenter = [point4326[1], point4326[0]];
        // console.log(leafletCenter)

        const geoserverBaseUrl = 'http://localhost:2020/geoserver';

        // Base Layers
        const osmLayer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        });

        const satelliteLayer = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
            attribution: '© Esri'
        });

        const topoLayer = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenTopoMap contributors'
        });

        // Initialize map with default base layer
        map = L.map('map', {
            center: [5.385786, -0.679827],
            zoom: 16,
            layers: [osmLayer]
        });

        // GeoServer WMS Layer with error handling
        try {
            var gcsez_boundary = L.tileLayer.wms(geoserverBaseUrl + '/wms', {
                layers: 'smarterem:gcsez_boundary', // Example layer - replace with yours
                format: 'image/png',
                transparent: true,
                version: '1.1.0',
                attribution: 'GeoServer Data'
            }).addTo(map);

            var gcsez_parceldata_02 = L.tileLayer.wms(geoserverBaseUrl + '/wms', {
                layers: 'smarterem:gcsez_parceldata_02', // Example layer - replace with yours
                format: 'image/png',
                transparent: true,
                version: '1.1.0',
                attribution: 'GeoServer Data'
            }).addTo(map);

            var gcsez_stline = L.tileLayer.wms(geoserverBaseUrl + '/wms', {
                layers: 'smarterem:gcsez_stline', // Example layer - replace with yours
                format: 'image/png',
                transparent: true,
                version: '1.1.0',
                attribution: 'GeoServer Data'
            }).addTo(map);

            var gcsez_accessroad = L.tileLayer.wms(geoserverBaseUrl + '/wms', {
                layers: 'smarterem:gcsez_accessroad', // Example layer - replace with yours
                format: 'image/png',
                transparent: true,
                version: '1.1.0',
                attribution: 'GeoServer Data'
            }).addTo(map);
            
            // Optional: Add layer control
            const baseLayers = {
                'OpenStreetMap': osmLayer,
                'Satellite': satelliteLayer,
                'Topographic': topoLayer
            };
            
            const overlays = {
                "Boundary": gcsez_boundary,
                "Parcel Data": gcsez_parceldata_02,
                "Street Line": gcsez_stline,
                "Access Road": gcsez_accessroad
            };

            // Call this function after map initialization
            initParcelHighlightLayer();

            // Modify the click handler
            map.on('click', function(e) {
                // Only process clicks if parcel layer is visible
                if (map.hasLayer(gcsez_parceldata_02)) {
                    // Clear previous highlight
                    clearParcelHighlight();
                    
                    // Get parcel info and highlight
                    getParcelInfo(e.latlng);
                    
                    // Center map on click position
                    map.panTo(e.latlng);
                }
            });
            
            L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);
            
        } catch (error) {
            console.error('Error loading GeoServer layer:', error);
            alert('Could not connect to GeoServer. Make sure it\'s running on localhost:2020');
        }

        // Initialize a GeoJSON layer for highlighting
        function initParcelHighlightLayer() {
            parcelLayer = L.geoJSON(null, {
                style: function(feature) {
                    return {
                        color: '#ff0000', // Red border
                        weight: 3,
                        opacity: 0.8,
                        fillColor: '#ff0000', // Red fill
                        fillOpacity: 0.2
                    };
                }
            }).addTo(map);
        }

        // Function to clear parcel highlight
        function clearParcelHighlight() {
            if (parcelLayer) {
                parcelLayer.clearLayers();
            }
            highlightedParcel = null;
        }

        // Function to highlight a specific parcel
        function highlightParcel(geojsonData) {
            if (!parcelLayer || !geojsonData) return;
            
            // Clear previous highlights
            clearParcelHighlight();
            
            // Add the new parcel to highlight layer
            parcelLayer.addData(geojsonData);
            
            // Store reference to highlighted parcel
            highlightedParcel = geojsonData;
            
            // Fit bounds to the highlighted parcel (optional)
            const bounds = parcelLayer.getBounds();
            if (bounds.isValid()) {
                map.fitBounds(bounds, { padding: [50, 50], maxZoom: 18 });
            }
        }

         // Function to get parcel information via WMS GetFeatureInfo
        function getParcelInfo(latlng) {
            // Show loading state in offcanvas
            document.getElementById('parcelOffcanvasBody').innerHTML = `
                <div class="loading-spinner">
                    <div class="spinner-border" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <p class="mt-3">Loading parcel information...</p>
                </div>
            `;
            
            // Show the offcanvas
            showParcelOffcanvas();
            
            // Convert latlng to map coordinates
            const point = map.latLngToContainerPoint(latlng);
            const size = map.getSize();
            
            // Prepare parameters for GetFeatureInfo request
            const params = {
                service: 'WMS',
                version: '1.1.1',
                request: 'GetFeatureInfo',
                layers: 'smarterem:gcsez_parceldata_02',
                query_layers: 'smarterem:gcsez_parceldata_02',
                info_format: 'application/json',
                feature_count: 10,
                x: Math.round(point.x),
                y: Math.round(point.y),
                width: size.x,
                height: size.y,
                srs: 'EPSG:4326',
                bbox: map.getBounds().toBBoxString()
            };
            
            // Build the URL
            const url = geoserverBaseUrl + '/wms?' + L.Util.getParamString(params);
            
            // Make the request
            // Make the request
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    // Highlight the parcel first
                    highlightParcel(data);
                    // Then display the information
                    displayParcelInfo(data);
                })
                .catch(error => {
                    console.error('Error fetching parcel info:', error);
                    document.getElementById('parcelOffcanvasBody').innerHTML = `
                        <div class="error-message">
                            <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                            <p>Error loading parcel information. Please try again.</p>
                            <p class="small">${error.message}</p>
                        </div>
                    `;
                });
        }

        // Show the custom offcanvas
        function showParcelOffcanvas() {
            const offcanvas = document.getElementById('parcelOffcanvas');
            offcanvas.style.display = 'block'; // make it visible
        }

        // Hide the custom offcanvas
        function hideParcelOffcanvas() {
            const offcanvas = document.getElementById('parcelOffcanvas');
            offcanvas.style.display = 'none'; // hide it
        }

        // Close offcanvas when clicking outside
        document.addEventListener('click', function(event) {
            const offcanvas = document.getElementById('parcelOffcanvas');
            const isClickInsideOffcanvas = offcanvas.contains(event.target);
            
            if (!isClickInsideOffcanvas && offcanvas.classList.contains('show')) {
                // Check if the click is on the map or its children
                const mapElement = document.getElementById('map');
                const isClickOnMap = mapElement.contains(event.target) || event.target === mapElement;
                
                if (isClickOnMap) {
                    hideParcelOffcanvas();
                }
            }
        });

        // Function to display parcel information in the offcanvas
        function displayParcelInfo(data) {
            console.log(data);
            const offcanvasBody = document.getElementById('parcelOffcanvasBody');
            
            if (data.features && data.features.length > 0) {
                const feature = data.features[0];
                const properties = feature.properties;
                
                // Get parcel ID for header
                const parcelId = properties.parcel_id || properties.plot_no || properties.serial_no || 'Parcel';
                
                let html = `
                    <div class="parcel-header">
                        <div class="parcel-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h6 class="parcel-title">Plot No.` +parcelId+`</h6>
                    </div>
                    
                    <div class="parcel-details-grid">
                `;
                
                // Define standardized property groups in priority order
                const propertyGroups = [
                    {
                        title: 'Identification',
                        properties: ['parcel_id', 'plot_no', 'serial_no', 'registry_no', 'survey_no']
                    },
                    {
                        title: 'Location',
                        properties: ['zone', 'location', 'address', 'coordinates']
                    },
                    {
                        title: 'Dimensions',
                        properties: ['area', 'size', 'acreage', 'dimensions', 'length', 'width']
                    },
                    {
                        title: 'Status',
                        properties: ['allocation_status', 'land_use', 'owner', 'condition', 'type']
                    },
                    {
                        title: 'Administrative',
                        properties: ['district', 'region', 'municipality', 'ward']
                    }
                ];
                
                // Render property groups
                propertyGroups.forEach(group => {
                    const groupProperties = group.properties.filter(prop => 
                        properties[prop] !== null && properties[prop] !== undefined
                    );
                    
                    if (groupProperties.length > 0) {
                        html += `
                            <div class="property-group">
                                <div class="property-group-header">`+group.title+`</div>
                                <div class="property-group-content">
                        `;
                        
                        groupProperties.forEach(prop => {
                            const allocation_status = prop == 'allocation_status' ? (properties[prop] == 0 ? 'Unallocated' : properties[prop] == 1 ? 'Allocated' : 'Processing') : '';
                            const parcel_prop = prop == 'allocation_status' ? allocation_status : formatLandValue(prop, properties[prop]);
                            html += `
                                <div class="property-item">
                                    <span class="property-label">`+formatPropertyName(prop)+`:</span>
                                    <span class="property-value">`+parcel_prop+`</span>
                                </div>
                            `;
                        });
                        
                        html += `
                                </div>
                            </div>
                        `;
                    }
                });
                
                // Add any remaining properties not in groups
                const allGroupedProperties = propertyGroups.flatMap(group => group.properties);
                const remainingProperties = Object.keys(properties)
                    .filter(key => !allGroupedProperties.includes(key) && properties[key] !== null)
                    .sort();
                    
                if (remainingProperties.length > 0) {
                    html += `
                        <div class="property-group">
                            <div class="property-group-header">Additional Information</div>
                            <div class="property-group-content">
                    `;
                    
                    remainingProperties.forEach(prop => {
                        html += `
                            <div class="property-item">
                                <span class="property-label">`+formatPropertyName(prop)+`:</span>
                                <span class="property-value">`+properties[prop]+`</span>
                            </div>
                        `;
                    });
                    
                    html += `
                            </div>
                        </div>
                    `;
                }
                
                html += `</div>`; // Close parcel-details-grid
                
                offcanvasBody.innerHTML = html;
            } else {
                offcanvasBody.innerHTML = `
                    <div class="no-data-message">
                        <div class="no-data-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h6>No Parcel Data</h6>
                        <p>No information found for this location.</p>
                    </div>
                `;
            }
        }

        // Helper function to format land-specific values
        function formatLandValue(propertyName, value) {
            // console.log(value)
            if (propertyName.includes('area') || propertyName.includes('size') || propertyName.includes('Acreage')) {
                // Format area values
                const numValue = parseFloat(value);
                if (!isNaN(numValue)) {
                    if (numValue >= 10000) {
                        return (numValue / 10000).toFixed(2) + ' hectares';
                    } else if (numValue >= 1000) {
                        return (numValue / 1000).toFixed(2) + ' acres';
                    } else {
                        return numValue + ' sq meters';
                    }
                }
            }
            
            // if (propertyName.includes('status')) {
            //     // Format status values
            //     return `<span class="status-badge status-`+value.toLowerCase()+`">`+value+`</span>`;
            // }
            
            if (propertyName.includes('date')) {
                // Format date values
                return new Date(value).toLocaleDateString();
            }
            
            return value;
        }

        // Helper function to format property names for display
        function formatPropertyName(name) {
            return name
                .replace(/_/g, ' ')
                .replace(/([A-Z])/g, ' $1')
                .replace(/\b\w/g, l => l.toUpperCase())
                .trim();
        }
        
        //Add geolocation
        // if (navigator.geolocation) {
        //     navigator.geolocation.getCurrentPosition(function(position) {
        //         var userLatLng = [position.coords.latitude, position.coords.longitude];
        //         var userMarker = L.marker(userLatLng, {
        //             icon: L.divIcon({
        //                 className: 'user-marker',
        //                 html: '<i class="fas fa-user"></i>',
        //                 iconSize: [25, 25],
        //                 iconAnchor: [12, 12]
        //             })
        //         }).addTo(map);

        //         console.log(userLatLng)
                
        //         userMarker.bindPopup("Your Location").openPopup();
        //         map.setView(userLatLng, 13);
        //     });
        // }
        
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

        // cookie-consent.js
        document.addEventListener('DOMContentLoaded', function() {
            const cookieBanner = document.getElementById('cookieBanner');
            const acceptBtn = document.getElementById('acceptCookies');
            const rejectBtn = document.getElementById('rejectCookies');

            // Check if user has already made a choice
            if (!getCookie('cookieConsent')) {
                cookieBanner.style.display = 'block';
            }

            // Accept cookies
            acceptBtn.addEventListener('click', function() {
                setCookie('cookieConsent', 'accepted', 365);
                setCookie('necessaryCookies', 'true', 365);
                setCookie('analyticsCookies', 'true', 365);
                cookieBanner.style.display = 'none';
                initializeCookies();
            });

            // Reject cookies
            rejectBtn.addEventListener('click', function() {
                setCookie('cookieConsent', 'rejected', 365);
                // Only set necessary cookies
                setCookie('necessaryCookies', 'true', 365);
                setCookie('analyticsCookies', 'false', 365);
                cookieBanner.style.display = 'none';
            });

            // Initialize cookies based on user preference
            if (getCookie('cookieConsent') === 'accepted') {
                initializeCookies();
            }
        });

        // Cookie utility functions
        function setCookie(name, value, days) {
            const date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            const expires = "expires=" + date.toUTCString();
            document.cookie = name + "=" + value + ";" + expires + ";path=/;SameSite=Lax";
        }

        function getCookie(name) {
            const nameEQ = name + "=";
            const ca = document.cookie.split(';');
            for(let i = 0; i < ca.length; i++) {
                let c = ca[i];
                while (c.charAt(0) === ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
            }
            return null;
        }

        function initializeCookies() {
            // Initialize analytics cookies (Google Analytics, etc.)
            if (getCookie('analyticsCookies') === 'true') {
                // console.log('Initializing analytics cookies...');
                // Add your analytics code here
            }
            
            // Initialize other cookies as needed
            // console.log('Cookies initialized');
        }

        // Helper function to show notification
        window.showNotification = function(message, type = 'success') {
            // You can implement a toast notification system here
            Toastify({
                text: message,
                duration: 10000,
                close: true,
                gravity: "top",
                position: "right",
                stopOnFocus: true,
                avatar: type === 'success' ? '../assets/images/notification/ok-48.png' : '../assets/images/notification/high_priority-48.png', // small icon image
                style: {
                    background: type === 'success' ? 'linear-gradient(to right, #00b09b, #96c93d)' : 'linear-gradient(to right, #ff5f6d, #ffc371)',
                    fontSize: "13px",
                },
            }).showToast();
        }

        // Initialize Property Slider
        document.addEventListener('DOMContentLoaded', function() {
            const propertySlider = new Swiper('.property-slider', {
                slidesPerView: 1,
                spaceBetween: 30, // Increased from 20 to 30 for more space between cards
                loop: true,
                autoplay: {
                    delay: 5000,
                    disableOnInteraction: false,
                    pauseOnMouseEnter: true,
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                navigation: {
                    nextEl: '.next-btn',
                    prevEl: '.prev-btn',
                },
                breakpoints: {
                    640: {
                        slidesPerView: 1,
                        spaceBetween: 20, // Added spacing for mobile view
                    },
                    768: {
                        slidesPerView: 2,
                        spaceBetween: 25, // Added medium spacing for tablet view
                    },
                    1024: {
                        slidesPerView: 3,
                        spaceBetween: 30, // Consistent spacing for desktop view
                    },
                },
                effect: 'coverflow',
                coverflowEffect: {
                    rotate: 5,
                    stretch: 0,
                    depth: 100,
                    modifier: 1,
                    slideShadows: false,
                },
                on: {
                    init: function() {
                        // Add a futuristic glow effect to the active slide
                        this.slides[this.activeIndex].style.boxShadow = '0 0 20px rgba(91, 102, 235, 0.5)';
                    },
                    slideChange: function() {
                        // Remove glow from all slides
                        this.slides.forEach(slide => {
                            slide.style.boxShadow = 'none';
                        });
                        // Add glow to active slide
                        this.slides[this.activeIndex].style.boxShadow = '0 0 20px rgba(91, 102, 235, 0.5)';
                    }
                }
            });
        });


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
                    }, 4000); // Change image every 1 second
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

        // Futuristic Navbar Scroll Effect
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Add smooth scrolling for nav links
        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', function(e) {
                const href = this.getAttribute('href');
                if (href.startsWith('#')) {
                    e.preventDefault();
                    const target = document.querySelector(href);
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                }
            });
        });

        // Add loading animation to buttons
        // document.querySelectorAll('.btn').forEach(btn => {
        //     btn.addEventListener('click', function() {
        //         if (!this.classList.contains('loading')) {
        //             this.classList.add('loading');
        //             const originalText = this.innerHTML;
        //             this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Loading...';
                    
        //             setTimeout(() => {
        //                 this.classList.remove('loading');
        //                 this.innerHTML = originalText;
        //             }, 2000);
        //         }
        //     });
        // });
    </script>
</body>
</html>