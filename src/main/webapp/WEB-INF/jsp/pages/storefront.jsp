<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EREM | Futuristic Marketplace</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&family=Orbitron:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Choices.js CSS -->
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

        /* Main Content Styles */
        .main-content {
            min-height: calc(100vh - 200px);
            padding: 2rem 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            position: relative;
        }

        .main-content::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="50" cy="50" r="1" fill="%23ffffff" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            pointer-events: none;
        }

        /* Filters Sidebar Styles */
        .filter-sidebar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 15px 35px rgba(102, 126, 234, 0.3);
            position: sticky;
            top: 2rem;
            max-height: calc(100vh - 4rem);
            overflow-y: auto;
            backdrop-filter: blur(10px);
        }

        .filters-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f1f3f4;
        }

        .filters-header h5 {
            margin: 0;
            color: #2c3e50;
            font-weight: 600;
        }

        .filter-group {
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid #e9ecef;
        }

        .filter-group:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }

        .filter-title {
            font-size: 1rem;
            font-weight: 600;
            color: #495057;
            margin-bottom: 1rem;
        }

        .filter-options {
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
        }

        .filter-option {
            display: flex;
            align-items: center;
            cursor: pointer;
            padding: 0.5rem;
            border-radius: 6px;
            transition: all 0.3s ease;
            margin: 0;
        }

        .filter-option:hover {
            background-color: #f8f9fa;
        }

        .filter-option input[type="checkbox"] {
            display: none;
        }

        .checkmark {
            width: 18px;
            height: 18px;
            border: 2px solid #dee2e6;
            border-radius: 4px;
            margin-right: 0.75rem;
            position: relative;
            transition: all 0.3s ease;
        }

        .filter-option input[type="checkbox"]:checked + .checkmark {
            background-color: #007bff;
            border-color: #007bff;
        }

        .filter-option input[type="checkbox"]:checked + .checkmark::after {
            content: '✓';
            position: absolute;
            top: -2px;
            left: 2px;
            color: white;
            font-size: 12px;
            font-weight: bold;
        }

        /* New Filter Card Styles */
        .filter-card {
            background: rgba(255, 255, 255, 0.95);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            margin-bottom: 2rem;
            overflow: hidden;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        .filter-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        .filter-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.5rem 2rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-bottom: none;
        }

        .filter-header .filter-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: #ffffff;
            margin: 0;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .filter-reset {
            color: #ffffff;
            font-size: 0.9rem;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .filter-reset:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }

        .filter-category {
            padding: 2rem;
        }

        .category-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .category-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.2rem 1.5rem;
            margin-bottom: 1rem;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            border: 2px solid transparent;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(5px);
            font-weight: 600;
            color: #2c3e50;
            position: relative;
            overflow: hidden;
        }

        .category-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .category-item:hover::before {
            left: 100%;
        }

        .category-item:hover {
            background: rgba(102, 126, 234, 0.2);
            transform: translateX(10px) scale(1.03);
            border-color: rgba(102, 126, 234, 0.4);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
        }

        .category-item.active {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-color: rgba(255, 255, 255, 0.3);
            transform: translateX(5px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.5);
        }

        .category-item.active .category-count {
            color: rgba(255, 255, 255, 1);
            background: rgba(255, 255, 255, 0.2);
        }

        .category-count {
            font-size: 0.9rem;
            color: #2c3e50;
            font-weight: 700;
            background: rgba(255, 255, 255, 0.8);
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            min-width: 35px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .filter-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.8rem;
            margin-bottom: 2rem;
            padding: 0 2rem;
        }

        .filter-tag {
            display: flex;
            align-items: center;
            gap: 0.6rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #ffffff;
            padding: 0.8rem 1.2rem;
            border-radius: 25px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            border: 2px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
            backdrop-filter: blur(10px);
            position: relative;
            overflow: hidden;
        }

        .filter-tag::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .filter-tag:hover::before {
            left: 100%;
        }

        .filter-tag:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
            border-color: rgba(255, 255, 255, 0.5);
        }

        .filter-tag i {
            font-size: 0.8rem;
            opacity: 0.9;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.2);
            padding: 0.3rem;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .filter-tag:hover i {
            opacity: 1;
            background: rgba(255, 255, 255, 0.3);
            transform: rotate(90deg);
        }

        .filter-category h4 {
            font-size: 0.95rem;
            font-weight: 600;
            color: #495057;
            margin-bottom: 1rem;
            margin-top: 0;
        }

        .count {
            margin-left: auto;
            color: #6c757d;
            font-size: 0.875rem;
        }

        .filter-search {
            margin-bottom: 1rem;
        }

        .filter-search .form-control {
            border-radius: 6px;
            border: 1px solid #dee2e6;
        }

        /* Price Range Styles */
        .price-range-container {
            padding: 1rem 0;
        }

        .price-inputs {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .price-input label {
            display: block;
            font-size: 0.875rem;
            color: #6c757d;
            margin-bottom: 0.5rem;
        }

        .price-slider {
            position: relative;
            margin: 1rem 0;
        }

        .slider-track {
            height: 4px;
            background: #dee2e6;
            border-radius: 2px;
            position: relative;
        }

        .slider {
            position: absolute;
            top: -6px;
            width: 100%;
            height: 4px;
            background: transparent;
            outline: none;
            -webkit-appearance: none;
        }

        .slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            width: 16px;
            height: 16px;
            background: #007bff;
            border-radius: 50%;
            cursor: pointer;
        }

        .slider::-moz-range-thumb {
            width: 16px;
            height: 16px;
            background: #007bff;
            border-radius: 50%;
            cursor: pointer;
            border: none;
        }

        .price-display {
            text-align: center;
            font-weight: 600;
            color: #495057;
        }

        /* Stars Rating */
        .stars {
            display: inline-flex;
            gap: 2px;
        }

        .stars i {
            color: #ffc107;
            font-size: 0.875rem;
        }

        /* Products Toolbar */
        .products-toolbar {
            background: #ffffff;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .results-info {
            font-weight: 500;
            color: #495057;
        }

        .toolbar-right {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .view-options {
            display: flex;
            border: 1px solid #dee2e6;
            border-radius: 6px;
            overflow: hidden;
        }

        .view-btn {
            background: #ffffff;
            border: none;
            padding: 0.5rem 0.75rem;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #6c757d;
        }

        .view-btn:hover,
        .view-btn.active {
            background: #007bff;
            color: #ffffff;
        }

        .sort-options select {
            border-radius: 6px;
            border: 1px solid #dee2e6;
            padding: 0.5rem 1rem;
        }

        /* Products Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }

        .product-card {
            background: rgba(255, 255, 255, 0.95);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
        }

        .fade-in {
            opacity: 1;
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .product-card:hover {
            transform: translateY(-15px) scale(1.02);
            box-shadow: 0 20px 60px rgba(102, 126, 234, 0.2);
            border-color: rgba(102, 126, 234, 0.3);
        }

        .product-image {
            position: relative;
            overflow: hidden;
            height: 220px;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .product-card:hover .product-image img {
            transform: scale(1.1);
        }

        .product-badge {
            position: absolute;
            top: 1.5rem;
            left: 1.5rem;
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
            color: white;
            padding: 0.6rem 1.2rem;
            border-radius: 25px;
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.4);
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.2);
            letter-spacing: 0.5px;
        }

        .product-badge.new {
            background: linear-gradient(135deg, #00d2ff 0%, #3a7bd5 100%);
            box-shadow: 0 4px 15px rgba(0, 210, 255, 0.4);
        }

        .product-badge.popular {
            background: linear-gradient(135deg, #ffd89b 0%, #19547b 100%);
            color: #ffffff;
            box-shadow: 0 4px 15px rgba(255, 216, 155, 0.4);
        }

        .product-actions {
            position: absolute;
            top: 1.5rem;
            right: 1.5rem;
            display: flex;
            flex-direction: column;
            gap: 0.8rem;
            opacity: 0;
            transform: translateX(30px);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .product-card:hover .product-actions {
            opacity: 1;
            transform: translateX(0);
        }

        .action-btn {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.3);
            background: rgba(255, 255, 255, 0.95);
            color: #667eea;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            backdrop-filter: blur(15px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            font-size: 1.1rem;
        }

        .action-btn:hover {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            transform: scale(1.15) rotate(10deg);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .product-info {
            padding: 1.5rem;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.5rem;
            line-height: 1.4;
        }

        .product-category {
            color: #6c757d;
            font-size: 0.875rem;
            margin-bottom: 0.75rem;
        }

        .product-rating {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .rating-count {
            color: #6c757d;
            font-size: 0.875rem;
        }

        .product-price {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1rem;
        }

        .current-price {
            font-size: 1.25rem;
            font-weight: 700;
            color: #007bff;
        }

        .original-price {
            font-size: 1rem;
            color: #6c757d;
            text-decoration: line-through;
        }

        .add-to-cart-btn {
            width: 100%;
            background: linear-gradient(135deg, #007bff, #0056b3);
            border: none;
            color: white;
            padding: 0.75rem;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .add-to-cart-btn:hover {
            background: linear-gradient(135deg, #0056b3, #004085);
            transform: translateY(-2px);
        }

        /* Shopping Cart Sidebar */
        .cart-sidebar {
            position: fixed;
            top: 0;
            right: -400px;
            width: 400px;
            height: 100vh;
            background: #ffffff;
            box-shadow: -4px 0 20px rgba(0, 0, 0, 0.15);
            transition: right 0.3s ease;
            z-index: 1050;
            display: flex;
            flex-direction: column;
        }

        .cart-sidebar.open {
            right: 0;
        }

        .cart-header {
            padding: 1.5rem;
            border-bottom: 1px solid #e9ecef;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .cart-header h5 {
            margin: 0;
            color: #2c3e50;
            font-weight: 600;
        }

        .cart-body {
            flex: 1;
            overflow-y: auto;
            padding: 1rem;
        }

        .cart-item {
            display: flex;
            align-items: center;
            padding: 1rem;
            border-bottom: 1px solid #f1f3f4;
            gap: 1rem;
        }

        .cart-item-image {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            overflow: hidden;
        }

        .cart-item-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .cart-item-details {
            flex: 1;
        }

        .cart-item-title {
            font-weight: 600;
            color: #2c3e50;
            font-size: 0.9rem;
            margin-bottom: 0.25rem;
        }

        .cart-item-price {
            color: #007bff;
            font-weight: 600;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 0.5rem;
        }

        .quantity-btn {
            width: 30px;
            height: 30px;
            border: 1px solid #dee2e6;
            background: #ffffff;
            border-radius: 4px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .quantity-btn:hover {
            background: #f8f9fa;
            border-color: #007bff;
        }

        .quantity-input {
            width: 50px;
            text-align: center;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            padding: 0.25rem;
        }

        .cart-footer {
            padding: 1.5rem;
            border-top: 1px solid #e9ecef;
            background: #f8f9fa;
        }

        .cart-total {
            margin-bottom: 1.5rem;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
        }

        .total-final {
            font-weight: 700;
            font-size: 1.1rem;
            padding-top: 0.5rem;
            border-top: 1px solid #dee2e6;
        }

        .cart-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1040;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }

        .cart-overlay.active {
            opacity: 1;
            visibility: visible;
        }

        /* Cart Counter Badge */
        .cart-counter {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            z-index: 1030;
        }

        .cart-toggle {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, #007bff, #0056b3);
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            box-shadow: 0 4px 20px rgba(0, 123, 255, 0.4);
            transition: all 0.3s ease;
            position: relative;
        }

        .cart-toggle:hover {
            transform: scale(1.1);
            box-shadow: 0 6px 25px rgba(0, 123, 255, 0.6);
        }

        .cart-count {
            position: absolute;
            top: -8px;
            right: -8px;
            background: #dc3545;
            color: white;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.75rem;
            font-weight: 600;
        }

        /* Pagination */
        .pagination-container {
            margin-top: 3rem;
        }

        .pagination .page-link {
            border-radius: 8px;
            margin: 0 0.25rem;
            border: 1px solid #dee2e6;
            color: #495057;
            padding: 0.75rem 1rem;
        }

        .pagination .page-link:hover {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            border-color: #007bff;
        }

        /* Quick View Modal */
        .modal-content {
            border-radius: 12px;
            border: none;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }

        .product-image-container {
            border-radius: 8px;
            overflow: hidden;
            height: 400px;
        }

        .product-image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            }
        }

        @media (max-width: 992px) {
            .filters-sidebar {
                position: static;
                margin-bottom: 2rem;
            }
            
            .products-toolbar {
                flex-direction: column;
                align-items: stretch;
            }
            
            .toolbar-right {
                justify-content: space-between;
            }
        }

        @media (max-width: 768px) {
            .main-content {
                padding: 1rem 0;
            }
            
            .filters-sidebar {
                padding: 1rem;
            }
            
            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 1rem;
            }
            
            .cart-sidebar {
                width: 100%;
                right: -100%;
            }
        }

        @media (max-width: 576px) {
            .products-grid {
                grid-template-columns: 1fr;
            }
            
            .price-inputs {
                grid-template-columns: 1fr;
            }
            
            .view-options {
                order: 2;
                width: 100%;
                justify-content: center;
            }
            
            .sort-options {
                order: 1;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">SmartErem</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pages/storefront">Storefront</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pages/ecommerce">E-commerce</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pages/building-materials">Materials</a></li>
                </ul>
                <div class="d-flex align-items-center">
                    <c:choose>
                        <c:when test="${not empty userInfo.email}">
                            <a href="${pageContext.request.contextPath}/saved-properties" class="btn btn-outline-primary me-2">
                                <i class="fas fa-heart" style="color: var(--salmon);"></i> Saved Properties
                            </a>
                            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-warning">
                                <i class="fas fa-user" style="color: var(--dark);"></i> My Dashboard
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-warning" id="signInBtn">Login or Register</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main E-commerce Content -->
    <main class="main-content">
        <div class="container-fluid">
            <div class="row">
                <!-- Filters Sidebar -->
                <div class="col-lg-3 col-md-4">
                    <aside class="filter-sidebar">
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Categories</h3>
                                <span class="filter-reset" id="reset-categories">Reset</span>
                            </div>
                            <div class="filter-category">
                                <ul class="category-list">
                                    <li class="category-item active" data-category="all">
                                        <span>All Categories</span>
                                        <span class="category-count">(299)</span>
                                    </li>
                                    <li class="category-item" data-category="properties">
                                        <span>Selling Properties</span>
                                        <span class="category-count">(24)</span>
                                    </li>
                                    <li class="category-item" data-category="materials">
                                        <span>Building Materials</span>
                                        <span class="category-count">(156)</span>
                                    </li>
                                    <li class="category-item" data-category="designs">
                                        <span>Building Designs</span>
                                        <span class="category-count">(18)</span>
                                    </li>
                                    <li class="category-item" data-category="tools">
                                        <span>Construction Tools</span>
                                        <span class="category-count">(89)</span>
                                    </li>
                                    <li class="category-item" data-category="equipment">
                                        <span>Heavy Equipment</span>
                                        <span class="category-count">(12)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Price Range</h3>
                                <span class="filter-reset" id="reset-price">Reset</span>
                            </div>
                            
                            <div class="price-filter">
                                <div class="price-range">
                                    <div class="price-range-fill" id="price-range-fill"></div>
                                </div>
                                
                                <div class="price-inputs">
                                    <div class="price-input">
                                        <label for="min-price">Min</label>
                                        <input type="text" id="min-price" value="$0">
                                    </div>
                                    <div class="price-input">
                                        <label for="max-price">Max</label>
                                        <input type="text" id="max-price" value="$10,000">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Brand</h3>
                                <span class="filter-reset" id="reset-brand">Reset</span>
                            </div>
                            
                            <div class="filter-category">
                                <ul class="category-list">
                                    <li class="category-item" data-brand="constructplus">
                                        <span>ConstructPlus</span>
                                        <span class="category-count">(45)</span>
                                    </li>
                                    <li class="category-item" data-brand="buildmaster">
                                        <span>BuildMaster</span>
                                        <span class="category-count">(32)</span>
                                    </li>
                                    <li class="category-item" data-brand="ecomaterials">
                                        <span>EcoMaterials</span>
                                        <span class="category-count">(28)</span>
                                    </li>
                                    <li class="category-item" data-brand="designcraft">
                                        <span>DesignCraft</span>
                                        <span class="category-count">(21)</span>
                                    </li>
                                    <li class="category-item" data-brand="urbanliving">
                                        <span>UrbanLiving</span>
                                        <span class="category-count">(19)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Filters</h3>
                                <span class="filter-reset" id="reset-filters">Reset</span>
                            </div>
                            
                            <div class="filter-tags">
                                <div class="filter-tag" data-filter="stock">
                                    <span>In Stock</span>
                                    <i class="fas fa-times"></i>
                                </div>
                                <div class="filter-tag" data-filter="sale">
                                    <span>On Sale</span>
                                    <i class="fas fa-times"></i>
                                </div>
                                <div class="filter-tag" data-filter="shipping">
                                    <span>Free Shipping</span>
                                    <i class="fas fa-times"></i>
                                </div>
                                <div class="filter-tag" data-filter="eco">
                                    <span>Eco-Friendly</span>
                                    <i class="fas fa-times"></i>
                                </div>
                            </div>
                            
                            <div class="filter-category">
                                <h4>Availability</h4>
                                <ul class="category-list">
                                    <li class="category-item" data-availability="in-stock">
                                        <span>In Stock</span>
                                        <span class="category-count">(234)</span>
                                    </li>
                                    <li class="category-item" data-availability="on-sale">
                                        <span>On Sale</span>
                                        <span class="category-count">(67)</span>
                                    </li>
                                    <li class="category-item" data-availability="new-arrivals">
                                        <span>New Arrivals</span>
                                        <span class="category-count">(23)</span>
                                    </li>
                                    <li class="category-item" data-availability="featured">
                                        <span>Featured</span>
                                        <span class="category-count">(15)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Rating Filter -->
                        <div class="filter-group">
                            <h6 class="filter-title">Customer Rating</h6>
                            <div class="filter-options">
                                <label class="filter-option">
                                    <input type="checkbox" value="5-stars" name="rating">
                                    <span class="checkmark"></span>
                                    <div class="stars">
                                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                                    </div>
                                    <span class="count">(45)</span>
                                </label>
                                <label class="filter-option">
                                    <input type="checkbox" value="4-stars" name="rating">
                                    <span class="checkmark"></span>
                                    <div class="stars">
                                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
                                    </div>
                                    <span class="count">(89)</span>
                                </label>
                                <label class="filter-option">
                                    <input type="checkbox" value="3-stars" name="rating">
                                    <span class="checkmark"></span>
                                    <div class="stars">
                                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
                                    </div>
                                    <span class="count">(67)</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Products Area -->
                <div class="col-lg-9 col-md-8">
                    <!-- Toolbar -->
                    <div class="products-toolbar">
                        <div class="toolbar-left">
                            <div class="results-info">
                                <span id="resultsCount">299</span> products found
                            </div>
                        </div>
                        <div class="toolbar-right">
                            <div class="view-options">
                                <button class="view-btn active" data-view="grid" title="Grid View">
                                    <i class="fas fa-th"></i>
                                </button>
                                <button class="view-btn" data-view="list" title="List View">
                                    <i class="fas fa-list"></i>
                                </button>
                            </div>
                            <div class="sort-options">
                                <select class="form-select" id="sortBy">
                                    <option value="popularity">Sort by Popularity</option>
                                    <option value="price-low">Price: Low to High</option>
                                    <option value="price-high">Price: High to Low</option>
                                    <option value="newest">Newest First</option>
                                    <option value="rating">Customer Rating</option>
                                    <option value="name">Name A-Z</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Products Grid -->
                    <div class="products-grid" id="productsGrid">
                        <!-- Product cards will be dynamically generated here -->
                    </div>

                    <!-- Pagination -->
                    <div class="pagination-container">
                        <nav aria-label="Products pagination">
                            <ul class="pagination justify-content-center">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Shopping Cart Sidebar -->
    <div class="cart-sidebar" id="cartSidebar">
        <div class="cart-header">
            <h5><i class="fas fa-shopping-cart me-2"></i>Shopping Cart</h5>
            <button class="btn-close" id="closeCart"></button>
        </div>
        <div class="cart-body">
            <div class="cart-items" id="cartItems">
                <!-- Cart items will be dynamically added here -->
            </div>
        </div>
        <div class="cart-footer">
            <div class="cart-total">
                <div class="total-row">
                    <span>Subtotal:</span>
                    <span id="cartSubtotal">$0.00</span>
                </div>
                <div class="total-row">
                    <span>Tax:</span>
                    <span id="cartTax">$0.00</span>
                </div>
                <div class="total-row total-final">
                    <span>Total:</span>
                    <span id="cartTotal">$0.00</span>
                </div>
            </div>
            <div class="cart-actions">
                <button class="btn btn-outline-secondary btn-block mb-2" id="viewCart">View Cart</button>
                <button class="btn btn-primary btn-block" id="checkout">Checkout</button>
            </div>
        </div>
    </div>

    <!-- Cart Overlay -->
    <div class="cart-overlay" id="cartOverlay"></div>

    <!-- Product Quick View Modal -->
    <div class="modal fade" id="quickViewModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Quick View</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="product-image-container">
                                <img id="quickViewImage" src="" alt="Product" class="img-fluid">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="product-details">
                                <h4 id="quickViewTitle"></h4>
                                <div class="product-rating">
                                    <div class="stars" id="quickViewRating"></div>
                                    <span class="rating-count" id="quickViewRatingCount"></span>
                                </div>
                                <div class="product-price">
                                    <span class="current-price" id="quickViewPrice"></span>
                                    <span class="original-price" id="quickViewOriginalPrice"></span>
                                </div>
                                <div class="product-description">
                                    <p id="quickViewDescription"></p>
                                </div>
                                <div class="product-options">
                                    <div class="quantity-selector">
                                        <label>Quantity:</label>
                                        <div class="quantity-controls">
                                            <button class="quantity-btn" data-action="decrease">-</button>
                                            <input type="number" class="quantity-input" value="1" min="1" id="quickViewQuantity">
                                            <button class="quantity-btn" data-action="increase">+</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-actions">
                                    <button class="btn btn-primary btn-lg" id="quickViewAddToCart">
                                        <i class="fas fa-cart-plus me-2"></i>Add to Cart
                                    </button>
                                    <button class="btn btn-outline-secondary" id="quickViewWishlist">
                                        <i class="fas fa-heart"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Cart Counter Badge -->
    <div class="cart-counter" id="cartCounter">
        <button class="cart-toggle" id="cartToggle">
            <i class="fas fa-shopping-cart"></i>
            <span class="cart-count" id="cartCount">0</span>
        </button>
    </div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
  
    
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <h5>SmartErem</h5>
                    <p>Your trusted partner in construction and building materials. We provide quality products and services for all your construction needs.</p>
                    <div class="social-links mt-3">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mb-4">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Products</a></li>
                        <li><a href="#">Services</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Support</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-4 mb-4">
                    <h5>Categories</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Building Materials</a></li>
                        <li><a href="#">Construction Tools</a></li>
                        <li><a href="#">Heavy Equipment</a></li>
                        <li><a href="#">Safety Equipment</a></li>
                        <li><a href="#">Electrical Supplies</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-4 mb-4">
                    <h5>Contact Info</h5>
                    <p><i class="fas fa-map-marker-alt me-2"></i> 123 Construction Ave, Industrial Area, Accra</p>
                    <p><i class="fas fa-phone me-2"></i> (233) 304 456 8037</p>
                    <p><i class="fas fa-envelope me-2"></i> info@smarterem.com</p>
                    <div class="newsletter mt-4">
                        <h5>Newsletter</h5>
                        <p>Subscribe to get updates on new products and offers</p>
                        <div class="input-group">
                            <input type="email" class="form-control" placeholder="Your email address">
                            <button class="btn btn-primary">Subscribe</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; 
                    <script type="text/javascript">
                        document.write(new Date().getFullYear());
                    </script>
                    SmartErem E-commerce. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        // Sample product data
        const products = [
            {
                id: 1,
                title: "Professional Hammer Drill",
                category: "Power Tools",
                price: 299.99,
                originalPrice: 349.99,
                rating: 4.8,
                reviews: 124,
                image: "https://images.unsplash.com/photo-1504148455328-c376907d081c?w=400",
                badge: "sale",
                inStock: true
            },
            {
                id: 2,
                title: "Steel Reinforcement Bars",
                category: "Building Materials",
                price: 45.99,
                originalPrice: null,
                rating: 4.6,
                reviews: 89,
                image: "https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=400",
                badge: "new",
                inStock: true
            },
            {
                id: 3,
                title: "Concrete Mixer Machine",
                category: "Heavy Equipment",
                price: 1299.99,
                originalPrice: 1499.99,
                rating: 4.9,
                reviews: 56,
                image: "https://images.unsplash.com/photo-1541888946425-d81bb19240f5?w=400",
                badge: "popular",
                inStock: true
            },
            {
                id: 4,
                title: "Safety Helmet Set",
                category: "Safety Equipment",
                price: 29.99,
                originalPrice: null,
                rating: 4.7,
                reviews: 203,
                image: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400",
                badge: null,
                inStock: true
            },
            {
                id: 5,
                title: "Ceramic Floor Tiles",
                category: "Building Materials",
                price: 12.99,
                originalPrice: 15.99,
                rating: 4.5,
                reviews: 167,
                image: "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400",
                badge: "sale",
                inStock: true
            },
            {
                id: 6,
                title: "Electric Circular Saw",
                category: "Power Tools",
                price: 189.99,
                originalPrice: null,
                rating: 4.8,
                reviews: 92,
                image: "https://images.unsplash.com/photo-1572981779307-38b8cabb2407?w=400",
                badge: "new",
                inStock: true
            }
        ];

        // Shopping cart functionality
        let cart = [];
        let cartCount = 0;

        // Initialize the page
        document.addEventListener('DOMContentLoaded', function() {
            renderProducts(products);
            initializeFilters();
            initializeCart();
        });

        // Render products
        function renderProducts(productsToRender) {
            const productsGrid = document.getElementById('productsGrid');
            if (!productsGrid) return;
            
            productsGrid.innerHTML = '';

            productsToRender.forEach(product => {
                const productCard = createProductCard(product);
                productsGrid.appendChild(productCard);
            });

            // Update results count
            const resultsCountElement = document.getElementById('resultsCount');
            if (resultsCountElement) {
                resultsCountElement.textContent = productsToRender.length;
            }
        }

        // Create product card
        function createProductCard(product) {
            const card = document.createElement('div');
            card.className = 'product-card fade-in';
            
            const badgeHtml = product.badge ? `<div class="product-badge ${product.badge}">${product.badge}</div>` : '';
            const originalPriceHtml = product.originalPrice ? `<span class="original-price">$${product.originalPrice}</span>` : '';
            
            card.innerHTML = `
                <div class="product-image">
                    <img src="${product.image}" alt="${product.title}">
                    ${badgeHtml}
                    <div class="product-actions">
                        <button class="action-btn" onclick="quickView(${product.id})" title="Quick View">
                            <i class="fas fa-eye"></i>
                        </button>
                        <button class="action-btn" onclick="toggleWishlist(${product.id})" title="Add to Wishlist">
                            <i class="fas fa-heart"></i>
                        </button>
                    </div>
                </div>
                <div class="product-info">
                    <div class="product-category">${product.category}</div>
                    <h3 class="product-title">${product.title}</h3>
                    <div class="product-rating">
                        <div class="stars">
                            ${generateStars(product.rating)}
                        </div>
                        <span class="rating-count">(${product.reviews})</span>
                    </div>
                    <div class="product-price">
                        <span class="current-price">$${product.price}</span>
                        ${originalPriceHtml}
                    </div>
                    <button class="add-to-cart-btn" onclick="addToCart(${product.id})">
                        <i class="fas fa-cart-plus me-2"></i>Add to Cart
                    </button>
                </div>
            `;
            
            return card;
        }

        // Generate star rating
        function generateStars(rating) {
            const fullStars = Math.floor(rating);
            const hasHalfStar = rating % 1 !== 0;
            let starsHtml = '';
            
            for (let i = 0; i < fullStars; i++) {
                starsHtml += '<i class="fas fa-star"></i>';
            }
            
            if (hasHalfStar) {
                starsHtml += '<i class="fas fa-star-half-alt"></i>';
            }
            
            const emptyStars = 5 - Math.ceil(rating);
            for (let i = 0; i < emptyStars; i++) {
                starsHtml += '<i class="far fa-star"></i>';
            }
            
            return starsHtml;
        }

        // Add to cart functionality
        function addToCart(productId) {
            const product = products.find(p => p.id === productId);
            if (!product) return;

            const existingItem = cart.find(item => item.id === productId);
            if (existingItem) {
                existingItem.quantity += 1;
            } else {
                cart.push({ ...product, quantity: 1 });
            }

            updateCartUI();
            showToast('Product added to cart!', 'success');
        }

        // Update cart UI
        function updateCartUI() {
            cartCount = cart.reduce((total, item) => total + item.quantity, 0);
            document.getElementById('cartCount').textContent = cartCount;
            
            // Update cart items
            const cartItems = document.getElementById('cartItems');
            cartItems.innerHTML = '';
            
            if (cart.length === 0) {
                cartItems.innerHTML = '<div class="text-center p-4"><p>Your cart is empty</p></div>';
            } else {
                cart.forEach(item => {
                    const cartItem = createCartItem(item);
                    cartItems.appendChild(cartItem);
                });
            }
            
            updateCartTotals();
        }

        // Create cart item
        function createCartItem(item) {
            const cartItem = document.createElement('div');
            cartItem.className = 'cart-item';
            cartItem.innerHTML = `
                <div class="cart-item-image">
                    <img src="${item.image}" alt="${item.title}">
                </div>
                <div class="cart-item-details">
                    <div class="cart-item-title">${item.title}</div>
                    <div class="cart-item-price">$${item.price}</div>
                    <div class="quantity-controls">
                        <button class="quantity-btn" onclick="updateQuantity(${item.id}, -1)">-</button>
                        <input type="number" class="quantity-input" value="${item.quantity}" min="1" onchange="setQuantity(${item.id}, this.value)">
                        <button class="quantity-btn" onclick="updateQuantity(${item.id}, 1)">+</button>
                    </div>
                </div>
                <button class="btn btn-sm btn-outline-danger" onclick="removeFromCart(${item.id})">
                    <i class="fas fa-trash"></i>
                </button>
            `;
            return cartItem;
        }

        // Update quantity
        function updateQuantity(productId, change) {
            const item = cart.find(item => item.id === productId);
            if (item) {
                item.quantity += change;
                if (item.quantity <= 0) {
                    removeFromCart(productId);
                } else {
                    updateCartUI();
                }
            }
        }

        // Set quantity
        function setQuantity(productId, quantity) {
            const item = cart.find(item => item.id === productId);
            if (item) {
                item.quantity = Math.max(1, parseInt(quantity) || 1);
                updateCartUI();
            }
        }

        // Remove from cart
        function removeFromCart(productId) {
            cart = cart.filter(item => item.id !== productId);
            updateCartUI();
            showToast('Product removed from cart', 'info');
        }

        // Update cart totals
        function updateCartTotals() {
            const subtotal = cart.reduce((total, item) => total + (item.price * item.quantity), 0);
            const tax = subtotal * 0.08; // 8% tax
            const total = subtotal + tax;
            
            document.getElementById('cartSubtotal').textContent = `$${subtotal.toFixed(2)}`;
            document.getElementById('cartTax').textContent = `$${tax.toFixed(2)}`;
            document.getElementById('cartTotal').textContent = `$${total.toFixed(2)}`;
        }

        // Initialize cart
        function initializeCart() {
            const cartToggle = document.getElementById('cartToggle');
            const cartSidebar = document.getElementById('cartSidebar');
            const cartOverlay = document.getElementById('cartOverlay');
            const closeCart = document.getElementById('closeCart');
            
            cartToggle.addEventListener('click', () => {
                cartSidebar.classList.add('open');
                cartOverlay.classList.add('active');
            });
            
            closeCart.addEventListener('click', () => {
                cartSidebar.classList.remove('open');
                cartOverlay.classList.remove('active');
            });
            
            cartOverlay.addEventListener('click', () => {
                cartSidebar.classList.remove('open');
                cartOverlay.classList.remove('active');
            });
        }

        // Initialize filters
        function initializeFilters() {
            // Category filter items
            const categoryItems = document.querySelectorAll('.category-item[data-category]');
            categoryItems.forEach(item => {
                item.addEventListener('click', function() {
                    // Remove active class from all category items
                    categoryItems.forEach(ci => ci.classList.remove('active'));
                    // Add active class to clicked item
                    this.classList.add('active');
                    applyFilters();
                });
            });
            
            // Brand filter items
            const brandItems = document.querySelectorAll('.category-item[data-brand]');
            brandItems.forEach(item => {
                item.addEventListener('click', function() {
                    this.classList.toggle('active');
                    applyFilters();
                });
            });
            
            // Availability filter items
            const availabilityItems = document.querySelectorAll('.category-item[data-availability]');
            availabilityItems.forEach(item => {
                item.addEventListener('click', function() {
                    this.classList.toggle('active');
                    applyFilters();
                });
            });
            
            // Filter tags removal
            const filterTags = document.querySelectorAll('.filter-tag');
            filterTags.forEach(tag => {
                const closeBtn = tag.querySelector('i.fa-times');
                if (closeBtn) {
                    closeBtn.addEventListener('click', function(e) {
                        e.stopPropagation();
                        tag.style.display = 'none';
                        applyFilters();
                    });
                }
            });
            
            // Reset buttons
            const resetCategories = document.getElementById('reset-categories');
            if (resetCategories) {
                resetCategories.addEventListener('click', function() {
                    categoryItems.forEach(item => item.classList.remove('active'));
                    document.querySelector('.category-item[data-category="all"]').classList.add('active');
                    applyFilters();
                });
            }
            
            const resetBrand = document.getElementById('reset-brand');
            if (resetBrand) {
                resetBrand.addEventListener('click', function() {
                    brandItems.forEach(item => item.classList.remove('active'));
                    applyFilters();
                });
            }
            
            const resetFilters = document.getElementById('reset-filters');
            if (resetFilters) {
                resetFilters.addEventListener('click', function() {
                    availabilityItems.forEach(item => item.classList.remove('active'));
                    filterTags.forEach(tag => tag.style.display = 'flex');
                    applyFilters();
                });
            }
            
            // Price range functionality (if exists)
            const minPriceInput = document.getElementById('min-price');
            const maxPriceInput = document.getElementById('max-price');
            if (minPriceInput && maxPriceInput) {
                minPriceInput.addEventListener('input', applyFilters);
                maxPriceInput.addEventListener('input', applyFilters);
            }
            
            // Sort functionality
            const sortBy = document.getElementById('sortBy');
            if (sortBy) {
                sortBy.addEventListener('change', applySorting);
            }
            
            // View toggle
            const viewBtns = document.querySelectorAll('.view-btn');
            viewBtns.forEach(btn => {
                btn.addEventListener('click', () => {
                    viewBtns.forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');
                });
            });
        }

        // Apply filters
        function applyFilters() {
            let filteredProducts = [...products];
            
            // Category filters
            const activeCategory = document.querySelector('.category-item[data-category].active');
            if (activeCategory && activeCategory.dataset.category !== 'all') {
                const categoryFilter = activeCategory.dataset.category;
                filteredProducts = filteredProducts.filter(product => {
                    switch(categoryFilter) {
                        case 'properties':
                            return product.category.toLowerCase().includes('property') || product.category.toLowerCase().includes('real estate');
                        case 'materials':
                            return product.category.toLowerCase().includes('material') || product.category.toLowerCase().includes('building');
                        case 'designs':
                            return product.category.toLowerCase().includes('design') || product.category.toLowerCase().includes('plan');
                        default:
                            return product.category.toLowerCase().includes(categoryFilter);
                    }
                });
            }
            
            // Brand filters
            const activeBrands = Array.from(document.querySelectorAll('.category-item[data-brand].active'));
            if (activeBrands.length > 0) {
                const brandFilters = activeBrands.map(item => item.dataset.brand);
                filteredProducts = filteredProducts.filter(product => 
                    brandFilters.some(brand => product.brand && product.brand.toLowerCase().includes(brand))
                );
            }
            
            // Availability filters
            const activeAvailability = Array.from(document.querySelectorAll('.category-item[data-availability].active'));
            if (activeAvailability.length > 0) {
                const availabilityFilters = activeAvailability.map(item => item.dataset.availability);
                filteredProducts = filteredProducts.filter(product => {
                    return availabilityFilters.some(filter => {
                        switch(filter) {
                            case 'in-stock':
                                return product.inStock !== false;
                            case 'on-sale':
                                return product.originalPrice && product.originalPrice > product.price;
                            case 'new-arrivals':
                                return product.badge === 'New';
                            case 'featured':
                                return product.badge === 'Featured';
                            default:
                                return true;
                        }
                    });
                });
            }
            
            // Filter tags (visible ones)
            const visibleTags = Array.from(document.querySelectorAll('.filter-tag')).filter(tag => tag.style.display !== 'none');
            if (visibleTags.length > 0) {
                const tagFilters = visibleTags.map(tag => tag.dataset.filter);
                filteredProducts = filteredProducts.filter(product => {
                    return tagFilters.every(filter => {
                        switch(filter) {
                            case 'stock':
                                return product.inStock !== false;
                            case 'sale':
                                return product.originalPrice && product.originalPrice > product.price;
                            case 'shipping':
                                return true; // Assume all products have free shipping
                            case 'eco':
                                return product.category.toLowerCase().includes('eco') || product.title.toLowerCase().includes('eco');
                            default:
                                return true;
                        }
                    });
                });
            }
            
            // Price range filter (if inputs exist)
            const minPriceInput = document.getElementById('min-price');
            const maxPriceInput = document.getElementById('max-price');
            if (minPriceInput && maxPriceInput) {
                const minPrice = parseFloat(minPriceInput.value.replace('$', '').replace(',', '')) || 0;
                const maxPrice = parseFloat(maxPriceInput.value.replace('$', '').replace(',', '')) || 999999;
                filteredProducts = filteredProducts.filter(product => 
                    product.price >= minPrice && product.price <= maxPrice
                );
            }
            
            renderProducts(filteredProducts);
        }

        // Apply sorting
        function applySorting() {
            const sortValue = document.getElementById('sortBy').value;
            let sortedProducts = [...products];
            
            switch (sortValue) {
                case 'price-low':
                    sortedProducts.sort((a, b) => a.price - b.price);
                    break;
                case 'price-high':
                    sortedProducts.sort((a, b) => b.price - a.price);
                    break;
                case 'rating':
                    sortedProducts.sort((a, b) => b.rating - a.rating);
                    break;
                case 'name':
                    sortedProducts.sort((a, b) => a.title.localeCompare(b.title));
                    break;
                default:
                    // popularity - keep original order
                    break;
            }
            
            renderProducts(sortedProducts);
        }

        // Reset all filters
        function resetAllFilters() {
            // Reset category filters
            document.querySelectorAll('.category-item[data-category]').forEach(item => item.classList.remove('active'));
            const allCategoryItem = document.querySelector('.category-item[data-category="all"]');
            if (allCategoryItem) allCategoryItem.classList.add('active');
            
            // Reset brand filters
            document.querySelectorAll('.category-item[data-brand]').forEach(item => item.classList.remove('active'));
            
            // Reset availability filters
            document.querySelectorAll('.category-item[data-availability]').forEach(item => item.classList.remove('active'));
            
            // Reset filter tags
            document.querySelectorAll('.filter-tag').forEach(tag => tag.style.display = 'flex');
            
            // Reset price inputs
            const minPriceInput = document.getElementById('min-price');
            const maxPriceInput = document.getElementById('max-price');
            if (minPriceInput) minPriceInput.value = '$250';
            if (maxPriceInput) maxPriceInput.value = '$5,000';
            
            // Reset sort
            const sortBy = document.getElementById('sortBy');
            if (sortBy) sortBy.value = 'popularity';
            
            renderProducts(products);
        }

        // Quick view functionality
        function quickView(productId) {
            const product = products.find(p => p.id === productId);
            if (!product) return;
            
            document.getElementById('quickViewImage').src = product.image;
            document.getElementById('quickViewTitle').textContent = product.title;
            document.getElementById('quickViewRating').innerHTML = generateStars(product.rating);
            document.getElementById('quickViewRatingCount').textContent = `(${product.reviews} reviews)`;
            document.getElementById('quickViewPrice').textContent = `$${product.price}`;
            document.getElementById('quickViewOriginalPrice').textContent = product.originalPrice ? `$${product.originalPrice}` : '';
            document.getElementById('quickViewDescription').textContent = `High-quality ${product.category.toLowerCase()} perfect for professional and DIY projects.`;
            
            const modal = new bootstrap.Modal(document.getElementById('quickViewModal'));
            modal.show();
        }

        // Wishlist functionality
        function toggleWishlist(productId) {
            showToast('Added to wishlist!', 'success');
        }

        // Toast notification
        function showToast(message, type = 'info') {
            if (typeof Toastify !== 'undefined') {
                Toastify({
                    text: message,
                    duration: 3000,
                    gravity: "top",
                    position: "right",
                    backgroundColor: type === 'success' ? "#28a745" : type === 'error' ? "#dc3545" : "#007bff"
                }).showToast();
            }
        }

        // Navbar scroll effect
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });
    </script>
</body>
</html>