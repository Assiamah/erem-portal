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