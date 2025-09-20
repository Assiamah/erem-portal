<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EREM | Building Materials</title>
    
    <!-- CSS Libraries -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/choices.js/public/assets/styles/choices.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.css">

    <link href="${pageContext.request.contextPath}/assets/libs/nouislider/nouislider.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate_.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animation_.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap_.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-select_.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/custom.css">
    <link href="${pageContext.request.contextPath}/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&family=Roboto+Mono:wght@300;400;500&display=swap" rel="stylesheet">
    

    
    <style>
        /* Tab Content Styles */
    .tab-content {
        margin-top: 30px;
    }
    
    .tab-pane {
        display: none;
    }
    
    .tab-pane.active {
        display: block;
        animation: fadeIn 0.5s ease;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
    
    /* Product Image Carousel */
    .product-image-carousel {
        position: relative;
        width: 100%;
        height: 100%;
        overflow: hidden;
    }
    
    .product-image-carousel img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        opacity: 0;
        transition: opacity 0.5s ease;
    }
    
    .product-image-carousel img.active {
        opacity: 1;
    }
    
    .product-image-nav {
        position: absolute;
        top: 50%;
        width: 100%;
        display: flex;
        justify-content: space-between;
        padding: 0 10px;
        transform: translateY(-50%);
        z-index: 2;
        opacity: 0;
        transition: opacity 0.3s ease;
    }
    
    .product-card:hover .product-image-nav {
        opacity: 1;
    }
    
    .product-image-prev,
    .product-image-next {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.8);
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: var(--transition);
    }
    
    .product-image-prev:hover,
    .product-image-next:hover {
        background: var(--white);
        transform: scale(1.1);
    }
    
    /* Building Designs Styles */
    .designs-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 30px;
        margin-top: 30px;
    }
    
    .design-card {
        background: var(--white);
        border-radius: 12px;
        overflow: hidden;
        box-shadow: var(--card-shadow);
        transition: var(--transition);
    }
    
    .design-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
    }
    
    .design-image {
        position: relative;
        height: 220px;
        overflow: hidden;
    }
    
    .design-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }
    
    .design-card:hover .design-image img {
        transform: scale(1.05);
    }
    
    .design-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.3);
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: var(--transition);
    }
    
    .design-card:hover .design-overlay {
        opacity: 1;
    }
    
    .design-actions {
        display: flex;
        gap: 15px;
    }
    
    .design-action {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: var(--white);
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--black);
        cursor: pointer;
        transition: var(--transition);
        transform: translateY(20px);
        opacity: 0;
    }
    
    .design-card:hover .design-action {
        transform: translateY(0);
        opacity: 1;
    }
    
    .design-card:hover .design-action:nth-child(1) {
        transition-delay: 0.1s;
    }
    
    .design-card:hover .design-action:nth-child(2) {
        transition-delay: 0.2s;
    }
    
    .design-card:hover .design-action:nth-child(3) {
        transition-delay: 0.3s;
    }
    
    .design-action:hover {
        background: var(--primary);
        color: var(--white);
    }
    
    .design-info {
        padding: 20px;
    }
    
    .design-title {
        font-size: 18px;
        margin-bottom: 10px;
        color: var(--black);
    }
    
    .design-meta {
        color: var(--gray);
        font-size: 14px;
        margin-bottom: 15px;
    }
    
    .design-footer {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    
    .design-price {
        font-size: 18px;
        font-weight: 700;
        color: var(--primary);
    }
    
    .design-btn {
        padding: 8px 16px;
        background: var(--primary);
        color: var(--white);
        border: none;
        border-radius: 8px;
        font-weight: 600;
        cursor: pointer;
        transition: var(--transition);
    }
    
    .design-btn:hover {
        background: var(--black);
        transform: translateY(-2px);
    }
    
    /* Properties Styles */
    .properties-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
        gap: 30px;
        margin-top: 30px;
    }
    
    .property-card {
        background: var(--white);
        border-radius: 12px;
        overflow: hidden;
        box-shadow: var(--card-shadow);
        transition: var(--transition);
    }
    
    .property-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
    }
    
    .property-image {
        position: relative;
        height: 220px;
        overflow: hidden;
    }
    
    .property-image-carousel {
        position: relative;
        width: 100%;
        height: 100%;
    }
    
    .property-image-carousel img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        opacity: 0;
        transition: opacity 0.5s ease;
    }
    
    .property-image-carousel img.active {
        opacity: 1;
    }
    
    .property-image-nav {
        position: absolute;
        top: 50%;
        width: 100%;
        display: flex;
        justify-content: space-between;
        padding: 0 10px;
        transform: translateY(-50%);
        z-index: 2;
    }
    
    .property-image-prev,
    .property-image-next {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.8);
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: var(--transition);
    }
    
    .property-image-prev:hover,
    .property-image-next:hover {
        background: var(--white);
        transform: scale(1.1);
    }
    
    .property-badge {
        position: absolute;
        top: 15px;
        right: 15px;
        padding: 5px 12px;
        border-radius: 20px;
        font-weight: 600;
        font-size: 0.8rem;
        background: var(--primary);
        color: var(--white);
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        z-index: 2;
    }
    
    .property-info {
        padding: 20px;
    }
    
    .property-title {
        font-size: 18px;
        margin-bottom: 10px;
        color: var(--black);
    }
    
    .property-location {
        color: var(--gray);
        font-size: 14px;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 5px;
    }
    
    .property-features {
        display: flex;
        gap: 15px;
        margin-bottom: 15px;
    }
    
    .property-features span {
        display: flex;
        align-items: center;
        gap: 5px;
        color: var(--black);
        font-size: 14px;
    }
    
    .property-footer {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-top: 10px;
    }
    
    .property-price {
        font-size: 20px;
        font-weight: 700;
        color: var(--primary);
    }
    
    .property-btn {
        padding: 8px 16px;
        background: var(--primary);
        color: var(--white);
        border: none;
        border-radius: 8px;
        font-weight: 600;
        cursor: pointer;
        transition: var(--transition);
    }
    
    .property-btn:hover {
        background: var(--black);
        transform: translateY(-2px);
    }

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
            --radius: 12px;
            --transition: all 0.3s ease;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: var(--black);
            background-color: var(--white);
            line-height: 1.6;
        }
        
        h1, h2, h3, h4, h5, h6 {
            font-weight: 700;
            line-height: 1.2;
        }
        
        .container {
            width: 100%;
            max-width: 1440px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Header Styles */
        header {
            background: var(--white);
            box-shadow: var(--card-shadow);
            position: sticky;
            top: 0;
            z-index: 100;
            color: var(--black);
        }
        
        .header-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 0;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 24px;
            font-weight: 800;
            color: var(--black);
            text-decoration: none;
        }
        
        .logo i {
            color: var(--primary);
        }
        
        .search-bar {
            flex: 1;
            max-width: 500px;
            margin: 0 30px;
            position: relative;
        }
        
        .search-bar input {
            width: 100%;
            padding: 14px 20px;
            padding-left: 48px;
            border: 1px solid var(--lightgray);
            border-radius: 100px;
            font-size: 16px;
            background: var(--white);
            color: var(--black);
            transition: var(--transition);
        }
        
        .search-bar input::placeholder {
            color: var(--gray);
        }
        
        .search-bar input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(91, 102, 235, 0.2);
        }
        
        .search-bar i {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
        }
        
        .header-actions {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .header-action {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: var(--gainsboro);
            color: var(--black);
            text-decoration: none;
            position: relative;
            transition: var(--transition);
        }
        
        .header-action:hover {
            background: var(--primary);
            color: var(--white);
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(91, 102, 235, 0.2);
        }
        
        .cart-count {
            position: absolute;
            top: -5px;
            right: -5px;
            background: var(--salmon);
            color: white;
            font-size: 12px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        /* Hero Section */
        .hero {
            background: var(--gradient-bg);
            color: var(--black);
            padding: 80px 0;
            position: relative;
            overflow: hidden;
        }
        
        .hero-content {
            position: relative;
            z-index: 1;
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }
        
        .hero-title {
            font-size: 48px;
            margin-bottom: 20px;
            color: var(--black);
        }
        
        .hero-subtitle {
            font-size: 20px;
            margin-bottom: 30px;
            color: var(--graydark);
        }
        
        .hero-search {
            position: relative;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .hero-search input {
            width: 100%;
            padding: 18px 24px;
            padding-left: 54px;
            border: 1px solid var(--lightgray);
            border-radius: 100px;
            font-size: 18px;
            background: var(--white);
            color: var(--black);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        }
        
        .hero-search input::placeholder {
            color: var(--gray);
        }
        
        .hero-search input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(91, 102, 235, 0.2);
        }
        
        .hero-search i {
            position: absolute;
            left: 24px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
            font-size: 20px;
        }
        
        /* Category Tabs */
        .category-tabs {
            background: var(--white);
            border-radius: var(--radius);
            margin-top: -40px;
            position: relative;
            z-index: 10;
            box-shadow: var(--card-shadow);
            overflow: hidden;
        }
        
        .tabs {
            display: flex;
            border-bottom: 1px solid var(--lightgray);
        }
        
        .tab {
            flex: 1;
            padding: 20px;
            text-align: center;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
            color: var(--gray);
        }
        
        .tab.active {
            color: var(--primary);
        }
        
        .tab.active::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 3px;
            background: var(--primary);
            border-radius: 3px 3px 0 0;
        }
        
        .tab:hover {
            color: var(--primary);
            background: rgba(91, 102, 235, 0.05);
        }
        
        .tab i {
            margin-right: 8px;
        }
        
        /* Main Layout */
        .main-layout {
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 30px;
            margin-top: 40px;
        }
        
        /* Filter Sidebar */
        .filter-sidebar {
            position: sticky;
            top: 100px;
            height: calc(100vh - 120px);
            overflow-y: auto;
            padding-right: 15px;
            scrollbar-width: thin;
            scrollbar-color: var(--lightgray) transparent;
        }
        
        .filter-sidebar::-webkit-scrollbar {
            width: 6px;
        }
        
        .filter-sidebar::-webkit-scrollbar-track {
            background: transparent;
        }
        
        .filter-sidebar::-webkit-scrollbar-thumb {
            background-color: var(--lightgray);
            border-radius: 6px;
        }
        
        .filter-card {
            background: var(--white);
            border-radius: var(--radius);
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: var(--card-shadow);
        }
        
        .filter-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .filter-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--black);
        }
        
        .filter-reset {
            font-size: 14px;
            color: var(--primary);
            cursor: pointer;
            transition: var(--transition);
        }
        
        .filter-reset:hover {
            text-decoration: underline;
        }
        
        .category-list {
            list-style: none;
        }
        
        .category-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            cursor: pointer;
            transition: var(--transition);
            border-bottom: 1px solid var(--gainsboro);
        }
        
        .category-item:last-child {
            border-bottom: none;
        }
        
        .category-item.active {
            color: var(--primary);
            font-weight: 600;
        }
        
        .category-item:hover {
            color: var(--primary);
        }
        
        .category-count {
            font-size: 14px;
            color: var(--gray);
            background: var(--gainsboro);
            padding: 2px 8px;
            border-radius: 12px;
            transition: var(--transition);
        }
        
        .category-item.active .category-count,
        .category-item:hover .category-count {
            background: var(--primary);
            color: var(--white);
        }
        
        .price-filter {
            padding: 10px 0;
        }
        
        .price-range {
            height: 6px;
            background: var(--gainsboro);
            border-radius: 3px;
            position: relative;
            margin: 20px 0;
        }
        
        .price-range-fill {
            position: absolute;
            height: 100%;
            background: var(--primary);
            border-radius: 3px;
            left: 20%;
            right: 30%;
        }
        
        .price-range-fill::before,
        .price-range-fill::after {
            content: '';
            position: absolute;
            width: 16px;
            height: 16px;
            background: var(--white);
            border: 2px solid var(--primary);
            border-radius: 50%;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .price-range-fill::before {
            left: -8px;
        }
        
        .price-range-fill::after {
            right: -8px;
        }
        
        .price-inputs {
            display: flex;
            justify-content: space-between;
            gap: 15px;
        }
        
        .price-input {
            flex: 1;
        }
        
        .price-input label {
            display: block;
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 5px;
        }
        
        .price-input input {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--lightgray);
            border-radius: 8px;
            font-size: 14px;
            color: var(--black);
            background: var(--white);
            transition: var(--transition);
        }
        
        .price-input input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(91, 102, 235, 0.1);
        }
        
        .filter-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .filter-tag {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 6px 12px;
            background: var(--gainsboro);
            border-radius: 20px;
            font-size: 14px;
            cursor: pointer;
            transition: var(--transition);
        }
        
        .filter-tag:hover {
            background: var(--primary);
            color: var(--white);
        }
        
        .filter-tag i {
            font-size: 12px;
        }
        
        .filter-category h4 {
            font-size: 16px;
            margin-bottom: 10px;
            color: var(--black);
        }
        
        /* Featured Products Carousel */
        .featured-section {
            padding: 60px 0 40px;
            background-color: var(--white);
        }
        
        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        
        .section-title {
            font-size: 28px;
            font-weight: 700;
            position: relative;
            padding-left: 16px;
            color: var(--black);
        }
        
        .section-title::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 4px;
            height: 24px;
            background: var(--primary);
            border-radius: 2px;
        }
        
        .view-all {
            color: var(--primary);
            font-weight: 600;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: var(--transition);
        }
        
        .view-all:hover {
            color: var(--black);
        }
        
        .featured-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px 10px 40px;
        }
        
        .featured-item {
            transition: var(--transition);
        }
        
        .featured-item:hover {
            transform: translateY(-10px);
        }
        
        .product-card {
            background: var(--white);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--card-shadow);
            transition: var(--transition);
            height: 100%;
            display: flex;
            flex-direction: column;
            position: relative;
            border: 1px solid rgba(0,0,0,0.05);
        }
        
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
            border-color: rgba(91, 102, 235, 0.2);
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
            transition: transform 0.5s ease;
        }
        
        .product-card:hover .product-image img {
            transform: scale(1.05);
        }
        
        .product-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 5px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.8rem;
            background: var(--primary);
            color: var(--white);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .product-actions {
            position: absolute;
            bottom: 15px;
            left: 50%;
            transform: translateX(-50%) translateY(20px);
            display: flex;
            gap: 10px;
            opacity: 0;
            transition: var(--transition);
        }
        
        .product-card:hover .product-actions {
            opacity: 1;
            transform: translateX(-50%) translateY(0);
        }
        
        .product-action {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--black);
            cursor: pointer;
            transition: var(--transition);
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        
        .product-action:hover {
            background: var(--primary);
            color: var(--white);
            transform: translateY(-3px);
        }
        
        .product-info {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }
        
        .product-category {
            color: var(--gray);
            font-size: 14px;
            margin-bottom: 8px;
        }
        
        .product-title {
            font-size: 18px;
            margin-bottom: 12px;
            color: var(--black);
        }
        
        .product-rating {
            margin-bottom: 12px;
        }
        
        .stars {
            color: #FFD700;
        }
        
        .product-price {
            margin-top: auto;
            margin-bottom: 15px;
        }
        
        .current-price {
            font-size: 20px;
            font-weight: 700;
            color: var(--primary);
        }
        
        .old-price {
            font-size: 16px;
            color: var(--gray);
            text-decoration: line-through;
            margin-left: 8px;
        }
        
        .add-to-cart {
            background: var(--primary);
            color: var(--white);
            border: none;
            border-radius: 8px;
            padding: 12px 20px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .add-to-cart:hover {
            background: var(--black);
            transform: translateY(-2px);
        }
        
        /* Products Grid Section */
        .products-section {
            padding: 60px 0;
            background-color: var(--gainsboro);
        }
        
        .filter-bar {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .filter-options {
            display: flex;
            gap: 10px;
        }
        
        .filter-option {
            padding: 8px 16px;
            border-radius: 20px;
            background: var(--white);
            color: var(--gray);
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
        }
        
        .filter-option.active {
            background: var(--primary);
            color: var(--white);
        }
        
        .sort-select {
            padding: 8px 16px;
            border-radius: 20px;
            border: 1px solid var(--lightgray);
            background: var(--white);
            color: var(--black);
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
        }
        
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }
        
        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 50px;
            gap: 10px;
        }
        
        .page-item {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            background: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--black);
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
        }
        
        .page-item.active {
            background: var(--primary);
            color: var(--white);
        }
        
        .page-item:hover:not(.active) {
            background: var(--lightgray);
        }
        
        /* Responsive Styles */
        @media (max-width: 1200px) {
            .main-layout {
                grid-template-columns: 250px 1fr;
            }
            
            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            }
        }
        
        @media (max-width: 992px) {
            .hero-title {
                font-size: 40px;
            }
            
            .search-bar {
                max-width: 400px;
            }
            
            .main-layout {
                grid-template-columns: 220px 1fr;
            }
        }
        
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                gap: 20px;
            }
            
            .search-bar {
                max-width: 100%;
                margin: 0;
            }
            
            .hero-title {
                font-size: 32px;
            }
            
            .hero-subtitle {
                font-size: 18px;
            }
            
            .tabs {
                flex-direction: column;
            }
            
            .tab {
                padding: 15px;
            }
            
            .section-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .main-layout {
                grid-template-columns: 1fr;
            }
            
            .filter-sidebar {
                position: fixed;
                top: 0;
                left: -300px;
                width: 280px;
                height: 100vh;
                background: var(--white);
                z-index: 1000;
                padding: 20px;
                transition: var(--transition);
                box-shadow: var(--card-shadow);
            }
            
            .filter-sidebar.active {
                left: 0;
            }
            
            .filter-toggle {
                display: flex;
                align-items: center;
                gap: 8px;
                padding: 10px 16px;
                background: var(--primary);
                color: var(--white);
                border-radius: 8px;
                font-weight: 600;
                cursor: pointer;
                margin-bottom: 20px;
            }
            
            .filter-close {
                position: absolute;
                top: 20px;
                right: 20px;
                width: 30px;
                height: 30px;
                border-radius: 50%;
                background: var(--gainsboro);
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
            }
        }
        
        @media (max-width: 576px) {
            .hero-title {
                font-size: 28px;
            }
            
            .hero-search input {
                padding: 15px 20px;
                padding-left: 48px;
                font-size: 16px;
            }
            
            .filter-bar {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .products-grid {
                grid-template-columns: 1fr;
            }
        }

           .category-btn {
            padding: 10px 20px;
            border: 1px solid #ddd;
            border-radius: 30px;
            background: white;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .category-btn.active, .category-btn:hover {
            background: #3a8bbb;
            color: white;
            border-color: #3a8bbb;
        }

        .design-features, .property-features, .property-amenities {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 15px;
            font-size: 14px;
        }
        
        .design-features span, .property-features span, .property-amenities span {
            background: #f8f9fa;
            padding: 5px 10px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            gap: 5px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <div class="header-container">
                <a href="/" class="logo">
                    <i class="fas fa-building"></i>
                    <span>SmartErem</span>
                </a>
                
                <div class="search-bar">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search for materials, designs, properties...">
                </div>
                
                <div class="header-actions">
                    <a href="#" class="header-action">
                        <i class="fas fa-heart"></i>
                    </a>
                    <a href="#" class="header-action">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="cart-count">3</span>
                    </a>
                    <a href="#" class="header-action">
                        <i class="fas fa-user"></i>
                    </a>
                </div>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="hero-content">
                <h1 class="hero-title">Our Portfolio & Products</h1>
                <p class="hero-subtitle">Explore premium building designs, completed projects, and trusted materials in one place.</p>
                
                <div class="hero-search">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search properties, designs, or materials.....">
                </div>
            </div>
        </div>
    </div>

    <!-- Category Tabs -->
<div class="container">
    <div class="category-tabs">
        <div class="tabs">
            <div class="tab active" data-tab="building-materials">
                <i class="fas fa-hammer"></i> Building Materials
            </div>
            <div class="tab" data-tab="building-designs">
                <i class="fas fa-drafting-compass"></i> Building Designs
            </div>
            <div class="tab" data-tab="properties">
                <i class="fas fa-home"></i> Properties
            </div>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="container">
    <!-- Tab Content -->

    <div class="tab-content">
            <!-- Building Materials Tab (Default Active) -->
            <div class="tab-pane active" id="building-materials">
                <div class="main-layout">
                    <!-- Filter Sidebar -->
                    <aside class="filter-sidebar">
                        <!-- Filter content as provided -->
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Categories</h3>
                                <span class="filter-reset" id="reset-categories">Reset</span>
                            </div>
                            <div class="filter-category">
                                <ul class="category-list">
                                    <li class="category-item active" data-category="all">
                                        <span>All Categories</span>
                                        <span class="category-count">(128)</span>
                                    </li>
                                    <li class="category-item" data-category="properties">
                                        <span>Selling Properties</span>
                                        <span class="category-count">(42)</span>
                                    </li>
                                    <li class="category-item" data-category="materials">
                                        <span>Building Materials</span>
                                        <span class="category-count">(56)</span>
                                    </li>
                                    <li class="category-item" data-category="designs">
                                        <span>Building Designs</span>
                                        <span class="category-count">(30)</span>
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
                                        <input type="text" id="min-price" value="GHS 250">
                                    </div>
                                    <div class="price-input">
                                        <label for="max-price">Max</label>
                                        <input type="text" id="max-price" value="GHS 5,000">
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
                                        <span class="category-count">(32)</span>
                                    </li>
                                    <li class="category-item" data-brand="buildmaster">
                                        <span>BuildMaster</span>
                                        <span class="category-count">(24)</span>
                                    </li>
                                    <li class="category-item" data-brand="ecomaterials">
                                        <span>EcoMaterials</span>
                                        <span class="category-count">(18)</span>
                                    </li>
                                    <li class="category-item" data-brand="designcraft">
                                        <span>DesignCraft</span>
                                        <span class="category-count">(14)</span>
                                    </li>
                                    <li class="category-item" data-brand="urbanliving">
                                        <span>UrbanLiving</span>
                                        <span class="category-count">(9)</span>
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
                                    <li class="category-item">
                                        <span>In Stock</span>
                                        <span class="category-count">(98)</span>
                                    </li>
                                    <li class="category-item">
                                        <span>Pre-Order</span>
                                        <span class="category-count">(24)</span>
                                    </li>
                                    <li class="category-item">
                                        <span>Out of Stock</span>
                                        <span class="category-count">(6)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </aside>

                    <!-- Products Content -->
                  <div class="products-content">
                        <!-- Featured Products Carousel -->
                        <section class="featured-section">
                            <div class="section-header">
                                <h2 class="section-title">Featured Materials</h2>
                                <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
                            </div>
                            
                            <div class="featured-grid">
                                <!-- Product 1 -->
                                <div class="featured-item">
                                    <div class="product-card">
                                        <div class="product-image">
                                            <img src="https://images.unsplash.com/photo-1737093787984-b6e492231135?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Premium Hardwood">
                                            <span class="product-badge">Sale</span>
                                            
                                            <div class="product-actions">
                                                <div class="product-action">
                                                    <i class="fas fa-heart"></i>
                                                </div>
                                                <div class="product-action">
                                                    <i class="fas fa-search"></i>
                                                </div>
                                                <div class="product-action">
                                                    <i class="fas fa-share"></i>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="product-info">
                                            <div class="product-category">Hardwood</div>
                                            <h3 class="product-title">Premium Oak Flooring</h3>
                                            
                                            <div class="product-rating">
                                                <div class="stars">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                            </div>
                                            
                                            <div class="product-price">
                                                <span class="current-price">GHS 89.99</span>
                                                <span class="old-price">GHS 129.99</span>
                                            </div>
                                            
                                            <button class="add-to-cart">
                                                <i class="fas fa-shopping-cart"></i>
                                                Add to Cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Product 2 -->
                                <div class="featured-item">
                                    <div class="product-card">
                                        <div class="product-image">
                                            <img src="https://images.unsplash.com/photo-1626021546852-7565729c98c2?q=80&w=2667&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Building Bricks">
                                            <span class="product-badge">New</span>
                                            
                                            <div class="product-actions">
                                                <div class="product-action">
                                                    <i class="fas fa-heart"></i>
                                                </div>
                                                <div class="product-action">
                                                    <i class="fas fa-search"></i>
                                                </div>
                                                <div class="product-action">
                                                    <i class="fas fa-share"></i>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="product-info">
                                            <div class="product-category">Masonry</div>
                                            <h3 class="product-title">Interlocking Bricks</h3>
                                            
                                            <div class="product-rating">
                                                <div class="stars">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </div>
                                            
                                            <div class="product-price">
                                                <span class="current-price">GHS 4.50</span>
                                                <span class="old-price">GHS 5.20</span>
                                            </div>
                                            
                                            <button class="add-to-cart">
                                                <i class="fas fa-shopping-cart"></i>
                                                Add to Cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Product 3 -->
                                <div class="featured-item">
                                    <div class="product-card">
                                        <div class="product-image">
                                            <img src="https://images.unsplash.com/photo-1703960062125-ced834e903da?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Roofing Materials">
                                            <span class="product-badge">Popular</span>
                                            
                                            <div class="product-actions">
                                                <div class="product-action">
                                                    <i class="fas fa-heart"></i>
                                                </div>
                                                <div class="product-action">
                                                    <i class="fas fa-search"></i>
                                                </div>
                                                <div class="product-action">
                                                    <i class="fas fa-share"></i>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="product-info">
                                            <div class="product-category">Roofing</div>
                                            <h3 class="product-title">Classic Roof Tiles</h3>
                                            
                                            <div class="product-rating">
                                                <div class="stars">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                </div>
                                            </div>
                                            
                                            <div class="product-price">
                                                <span class="current-price">GHS 12.75</span>
                                            </div>
                                            
                                            <button class="add-to-cart">
                                                <i class="fas fa-shopping-cart"></i>
                                                Add to Cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- Product Grid Section -->
                        <section class="products-section">
                            <div class="section-header">
                                <h2 class="section-title">All Building Materials</h2>
                                
                                <div class="filter-bar">
                                    <div class="filter-options">
                                        <div class="filter-option active">All</div>
                                        <div class="filter-option">Flooring</div>
                                        <div class="filter-option">Lumber</div>
                                        <div class="filter-option">Concrete</div>
                                        <div class="filter-option">Roofing</div>
                                    </div>
                                    
                                    <select class="sort-select">
                                        <option>Sort by: Featured</option>
                                        <option>Price: Low to High</option>
                                        <option>Price: High to Low</option>
                                        <option>Newest First</option>
                                        <option>Best Rated</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="products-grid">
                                <!-- Product Cards -->
                                <!-- Product 1 -->
                                <div class="product-card">
                                    <div class="product-image">
                                        <img src="https://www.chaluminium.com/wp-content/uploads/2024/03/aluminium-roofing-sheet.jpg" alt="Aluminium Roofing Sheets">
                                        <span class="product-badge">Sale</span>
                                        
                                        <div class="product-actions">
                                            <div class="product-action">
                                                <i class="fas fa-heart"></i>
                                            </div>
                                            <div class="product-action">
                                                <i class="fas fa-search"></i>
                                            </div>
                                            <div class="product-action">
                                                <i class="fas fa-share"></i>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="product-info">
                                        <div class="product-category">Hardwood</div>
                                    <h3 class="product-title">Aluminium Roofing Sheets</h3>
                                        
                                        <div class="product-rating">
                                            <div class="stars">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                            </div>
                                        </div>
                                        
                                        <div class="product-price">
                                            <span class="current-price">GHS 89.99</span>
                                            <span class="old-price">GHS 129.99</span>
                                        </div>
                                        
                                        <button class="add-to-cart">
                                            <i class="fas fa-shopping-cart"></i>
                                            Add to Cart
                                        </button>
                                    </div>
                                </div>
                                
                                <!-- Product 2 -->
                                <div class="product-card">
                                    <div class="product-image">
                                        <img src="https://goodpappa.com/wp-content/uploads/2024/09/ghacem-cement-super-opn-500x500-1.jpg" alt="Cement Bags">
                                        <span class="product-badge">Best Value</span>
                                        
                                        <div class="product-actions">
                                            <div class="product-action">
                                                <i class="fas fa-heart"></i>
                                            </div>
                                            <div class="product-action">
                                                <i class="fas fa-search"></i>
                                            </div>
                                            <div class="product-action">
                                                <i class="fas fa-share"></i>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="product-info">
                                        <div class="product-category">Concrete</div>
                                        <h3 class="product-title">Ghacem Cement (50kg)</h3>
                                        
                                        <div class="product-rating">
                                            <div class="stars">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                        </div>
                                        
                                        <div class="product-price">
                                            <span class="current-price">GHS 45.00</span>
                                        </div>
                                        
                                        <button class="add-to-cart">
                                            <i class="fas fa-shopping-cart"></i>
                                            Add to Cart
                                        </button>
                                    </div>
                                </div>
                                
                                <!-- Product 3 -->
                                <div class="product-card">
                                    <div class="product-image">
                                        <img src="https://nyconstructionmall.com/cdn/shop/products/ironrods.jpg?v=1712659826" alt="Steel Rods">
                                        <span class="product-badge">Eco-Friendly</span>
                                        
                                        <div class="product-actions">
                                            <div class="product-action">
                                                <i class="fas fa-heart"></i>
                                            </div>
                                            <div class="product-action">
                                                <i class="fas fa-search"></i>
                                            </div>
                                            <div class="product-action">
                                                <i class="fas fa-share"></i>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="product-info">
                                        <div class="product-category">Steel</div>
                                        <h3 class="product-title"> Iron Rods</h3>
                                        
                                        <div class="product-rating">
                                            <div class="stars">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                        </div>
                                        
                                        <div class="product-price">
                                            <span class="current-price">GHS 320.00</span>
                                        </div>
                                        
                                        <button class="add-to-cart">
                                            <i class="fas fa-shopping-cart"></i>
                                            Add to Cart
                                        </button>
                                    </div>
                                </div>
                                
                                <!-- Product 4 -->
                                <div class="product-card">
                                    <div class="product-image">
                                        <img src="https://5.imimg.com/data5/MM/ZZ/HV/SELLER-31403626/rigid-pvc-pipe-500x500.jpg" alt="PVC Pipes">
                                        
                                        <div class="product-actions">
                                            <div class="product-action">
                                                <i class="fas fa-heart"></i>
                                            </div>
                                            <div class="product-action">
                                                <i class="fas fa-search"></i>
                                            </div>
                                            <div class="product-action">
                                                <i class="fas fa-share"></i>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="product-info">
                                        <div class="product-category">Plumbing</div>
                                        <h3 class="product-title">PVC Plumbing Pipes</h3>
                                        
                                        <div class="product-rating">
                                            <div class="stars">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                        
                                        <div class="product-price">
                                            <span class="current-price">GHS 18.50</span>
                                        </div>
                                        
                                        <button class="add-to-cart">
                                            <i class="fas fa-shopping-cart"></i>
                                            Add to Cart
                                        </button>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Pagination -->
                            <div class="pagination">
                                <div class="page-item"><i class="fas fa-chevron-left"></i></div>
                                <div class="page-item active">1</div>
                                <div class="page-item">2</div>
                                <div class="page-item">3</div>
                                <div class="page-item">...</div>
                                <div class="page-item">10</div>
                                <div class="page-item"><i class="fas fa-chevron-right"></i></div>
                            </div>
                        </section>
                    </div>


                </div>
            </div>
            
            <!-- Building Designs Tab -->
            <div class="tab-pane" id="building-designs">
                <div class="main-layout">
                    <!-- Filter Sidebar -->
                    <aside class="filter-sidebar">
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Design Categories</h3>
                                <span class="filter-reset" id="reset-design-categories">Reset</span>
                            </div>
                            <div class="filter-category">
                                <ul class="category-list">
                                    <li class="category-item active" data-category="all">
                                        <span>All Designs</span>
                                        <span class="category-count">(45)</span>
                                    </li>
                                    <li class="category-item" data-category="residential">
                                        <span>Residential</span>
                                        <span class="category-count">(28)</span>
                                    </li>
                                    <li class="category-item" data-category="commercial">
                                        <span>Commercial</span>
                                        <span class="category-count">(12)</span>
                                    </li>
                                    <li class="category-item" data-category="modern">
                                        <span>Modern</span>
                                        <span class="category-count">(18)</span>
                                    </li>
                                    <li class="category-item" data-category="traditional">
                                        <span>Traditional</span>
                                        <span class="category-count">(15)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Price Range</h3>
                                <span class="filter-reset" id="reset-design-price">Reset</span>
                            </div>
                            
                            <div class="price-filter">
                                <div class="price-range">
                                    <div class="price-range-fill" id="design-price-range-fill"></div>
                                </div>
                                
                                <div class="price-inputs">
                                    <div class="price-input">
                                        <label for="design-min-price">Min</label>
                                        <input type="text" id="design-min-price" value="GHS 500">
                                    </div>
                                    <div class="price-input">
                                        <label for="design-max-price">Max</label>
                                        <input type="text" id="design-max-price" value="GHS 3,000">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Design Type</h3>
                                <span class="filter-reset" id="reset-design-type">Reset</span>
                            </div>
                            
                            <div class="filter-category">
                                <ul class="category-list">
                                    <li class="category-item" data-type="floor-plans">
                                        <span>Floor Plans</span>
                                        <span class="category-count">(35)</span>
                                    </li>
                                    <li class="category-item" data-type="3d-models">
                                        <span>3D Models</span>
                                        <span class="category-count">(28)</span>
                                    </li>
                                    <li class="category-item" data-type="blueprints">
                                        <span>Blueprints</span>
                                        <span class="category-count">(22)</span>
                                    </li>
                                    <li class="category-item" data-type="elevations">
                                        <span>Elevations</span>
                                        <span class="category-count">(18)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Features</h3>
                                <span class="filter-reset" id="reset-design-features">Reset</span>
                            </div>
                            
                            <div class="filter-tags">
                                <div class="filter-tag" data-filter="eco-friendly">
                                    <span>Eco-Friendly</span>
                                    <i class="fas fa-times"></i>
                                </div>
                                <div class="filter-tag" data-filter="energy-efficient">
                                    <span>Energy Efficient</span>
                                    <i class="fas fa-times"></i>
                                </div>
                                <div class="filter-tag" data-filter="customizable">
                                    <span>Customizable</span>
                                    <i class="fas fa-times"></i>
                                </div>
                            </div>
                            <div class="filter-category">
                                <h4>Square Footage</h4>
                                <ul class="category-list">
                                    <li class="category-item">
                                        <span>Under 1,000 sq ft</span>
                                        <span class="category-count">(8)</span>
                                    </li>
                                    <li class="category-item">
                                        <span>1,000 - 2,000 sq ft</span>
                                        <span class="category-count">(22)</span>
                                    </li>
                                    <li class="category-item">
                                        <span>Over 2,000 sq ft</span>
                                        <span class="category-count">(15)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </aside>

                    <!-- Products Content -->
                    <div class="products-content">
                        <div class="tab-header">
                            <h2 class="tab-title">Building Designs & Blueprints</h2>
                            <p class="tab-description">Explore our collection of professionally designed building plans and architectural blueprints</p>
                        </div>
                        
                        <div class="designs-categories">
                    <div class="category-filter">
                        <button class="category-btn active" data-category="all">All Designs</button>
                        <button class="category-btn" data-category="residential">Residential</button>
                        <button class="category-btn" data-category="commercial">Commercial</button>
                        <button class="category-btn" data-category="modern">Modern</button>
                        <button class="category-btn" data-category="traditional">Traditional</button>
                    </div>
                </div>
                
                <div class="designs-grid">
                    <!-- Design 1 -->
                    <div class="design-card" data-category="residential modern">
                        <div class="design-image">
                            <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Modern House Design">
                            <div class="design-overlay">
                                <div class="design-actions">
                                    <div class="design-action" title="Add to Favorites"><i class="fas fa-heart"></i></div>
                                    <div class="design-action" title="Quick View"><i class="fas fa-search"></i></div>
                                    <div class="design-action" title="Share"><i class="fas fa-share"></i></div>
                                    <div class="design-action" title="Download"><i class="fas fa-download"></i></div>
                                </div>
                            </div>
                            <div class="design-badge popular">Popular</div>
                        </div>
                        <div class="design-info">
                            <div class="design-category">Residential • Modern</div>
                            <h3 class="design-title">Modern Minimalist House</h3>
                            <p class="design-meta">3 Bedrooms • 2 Bathrooms • 1,800 sq ft</p>
                            <div class="design-features">
                                <span><i class="fas fa-ruler-combined"></i> Floor Plans</span>
                                <span><i class="fas fa-cube"></i> 3D Views</span>
                                <span><i class="fas fa-file-pdf"></i> PDF Plans</span>
                            </div>
                            <div class="design-footer">
                                <div class="design-price">GHS 1,200</div>
                                <button class="design-btn">View Details</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Design 2 -->
                    <div class="design-card" data-category="residential modern">
                        <div class="design-image">
                            <img src="https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Contemporary Apartment Design">
                            <div class="design-overlay">
                                <div class="design-actions">
                                    <div class="design-action" title="Add to Favorites"><i class="fas fa-heart"></i></div>
                                    <div class="design-action" title="Quick View"><i class="fas fa-search"></i></div>
                                    <div class="design-action" title="Share"><i class="fas fa-share"></i></div>
                                    <div class="design-action" title="Download"><i class="fas fa-download"></i></div>
                                </div>
                            </div>
                            <div class="design-badge new">New</div>
                        </div>
                        <div class="design-info">
                            <div class="design-category">Residential • Contemporary</div>
                            <h3 class="design-title">Contemporary Apartment</h3>
                            <p class="design-meta">2 Bedrooms • 1 Bathroom • 950 sq ft</p>
                            <div class="design-features">
                                <span><i class="fas fa-ruler-combined"></i> Floor Plans</span>
                                <span><i class="fas fa-cube"></i> 3D Views</span>
                                <span><i class="fas fa-file-pdf"></i> PDF Plans</span>
                            </div>
                            <div class="design-footer">
                                <div class="design-price">GHS 850</div>
                                <button class="design-btn">View Details</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Design 3 -->
                    <div class="design-card" data-category="commercial modern">
                        <div class="design-image">
                            <img src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Office Building Design">
                            <div class="design-overlay">
                                <div class="design-actions">
                                    <div class="design-action" title="Add to Favorites"><i class="fas fa-heart"></i></div>
                                    <div class="design-action" title="Quick View"><i class="fas fa-search"></i></div>
                                    <div class="design-action" title="Share"><i class="fas fa-share"></i></div>
                                    <div class="design-action" title="Download"><i class="fas fa-download"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="design-info">
                            <div class="design-category">Commercial • Modern</div>
                            <h3 class="design-title">Modern Office Building</h3>
                            <p class="design-meta">5 Floors • 50,000 sq ft • Parking</p>
                            <div class="design-features">
                                <span><i class="fas fa-ruler-combined"></i> Floor Plans</span>
                                <span><i class="fas fa-cube"></i> 3D Views</span>
                                <span><i class="fas fa-file-pdf"></i> PDF Plans</span>
                            </div>
                            <div class="design-footer">
                                <div class="design-price">GHS 5,200</div>
                                <button class="design-btn">View Details</button>
                            </div>
                        </div>
                    </div>
                </div>
                    </div>
                </div>
            </div>
            
            <!-- Properties Tab -->
            <div class="tab-pane" id="properties">
                <div class="main-layout">
                    <!-- Filter Sidebar -->
                    <aside class="filter-sidebar">
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Property Type</h3>
                                <span class="filter-reset" id="reset-property-type">Reset</span>
                            </div>
                            <div class="filter-category">
                                <ul class="category-list">
                                    <li class="category-item active" data-category="all">
                                        <span>All Properties</span>
                                        <span class="category-count">(156)</span>
                                    </li>
                                    <li class="category-item" data-category="residential">
                                        <span>Residential</span>
                                        <span class="category-count">(89)</span>
                                    </li>
                                    <li class="category-item" data-category="commercial">
                                        <span>Commercial</span>
                                        <span class="category-count">(42)</span>
                                    </li>
                                    <li class="category-item" data-category="land">
                                        <span>Land</span>
                                        <span class="category-count">(25)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Price Range</h3>
                                <span class="filter-reset" id="reset-property-price">Reset</span>
                            </div>
                            
                            <div class="price-filter">
                                <div class="price-range">
                                    <div class="price-range-fill" id="property-price-range-fill"></div>
                                </div>
                                
                                <div class="price-inputs">
                                    <div class="price-input">
                                        <label for="property-min-price">Min</label>
                                        <input type="text" id="property-min-price" value="GHS 50,000">
                                    </div>
                                    <div class="price-input">
                                        <label for="property-max-price">Max</label>
                                        <input type="text" id="property-max-price" value="GHS 2,000,000">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Listing Type</h3>
                                <span class="filter-reset" id="reset-listing-type">Reset</span>
                            </div>
                            
                            <div class="filter-category">
                                <ul class="category-list">
                                    <li class="category-item" data-type="sale">
                                        <span>For Sale</span>
                                        <span class="category-count">(98)</span>
                                    </li>
                                    <li class="category-item" data-type="rent">
                                        <span>For Rent</span>
                                        <span class="category-count">(58)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Property Features</h3>
                                <span class="filter-reset" id="reset-property-features">Reset</span>
                            </div>
                            
                            <div class="filter-tags">
                                <div class="filter-tag" data-filter="furnished">
                                    <span>Furnished</span>
                                    <i class="fas fa-times"></i>
                                </div>
                                <div class="filter-tag" data-filter="parking">
                                    <span>Parking</span>
                                    <i class="fas fa-times"></i>
                                </div>
                                <div class="filter-tag" data-filter="pool">
                                    <span>Swimming Pool</span>
                                    <i class="fas fa-times"></i>
                                </div>
                            </div>
                            <div class="filter-category">
                                <h4>Bedrooms</h4>
                                <ul class="category-list">
                                    <li class="category-item">
                                        <span>1 Bedroom</span>
                                        <span class="category-count">(18)</span>
                                    </li>
                                    <li class="category-item">
                                        <span>2 Bedrooms</span>
                                        <span class="category-count">(35)</span>
                                    </li>
                                    <li class="category-item">
                                        <span>3+ Bedrooms</span>
                                        <span class="category-count">(42)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="filter-card">
                            <div class="filter-header">
                                <h3 class="filter-title">Location</h3>
                                <span class="filter-reset" id="reset-location">Reset</span>
                            </div>
                            
                            <div class="filter-category">
                                <ul class="category-list">
                                    <li class="category-item">
                                        <span>Accra</span>
                                        <span class="category-count">(78)</span>
                                    </li>
                                    <li class="category-item">
                                        <span>Kumasi</span>
                                        <span class="category-count">(45)</span>
                                    </li>
                                    <li class="category-item">
                                        <span>Tamale</span>
                                        <span class="category-count">(23)</span>
                                    </li>
                                    <li class="category-item">
                                        <span>Cape Coast</span>
                                        <span class="category-count">(10)</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </aside>

                    <!-- Products Content -->
                    <div class="products-content">
                        <div class="tab-header">
                            <h2 class="tab-title">Real Estate Properties</h2>
                            <p class="tab-description">Discover premium properties for sale and rent in prime locations</p>
                        </div>
                        
                        <div class="properties-categories">
                    <div class="category-filter">
                        <button class="category-btn active" data-category="all">All Properties</button>
                        <button class="category-btn" data-category="sale">For Sale</button>
                        <button class="category-btn" data-category="rent">For Rent</button>
                        <button class="category-btn" data-category="residential">Residential</button>
                        <button class="category-btn" data-category="commercial">Commercial</button>
                    </div>
                </div>
                
                <div class="properties-grid">
                    <!-- Property 1 -->
                    <div class="property-card" data-category="sale residential">
                        <div class="property-image">
                            <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Modern House Property">
                            <div class="property-actions">
                                <div class="property-action" title="Add to Favorites"><i class="fas fa-heart"></i></div>
                                <div class="property-action" title="Share"><i class="fas fa-share"></i></div>
                                <div class="property-action" title="Virtual Tour"><i class="fas fa-street-view"></i></div>
                            </div>
                            <div class="property-badge sale">For Sale</div>
                        </div>
                        <div class="property-info">
                            <div class="property-type">Residential • House</div>
                            <h3 class="property-title">Modern Family Home</h3>
                            <p class="property-location"><i class="fas fa-map-marker-alt"></i> 123 Main St, Anytown</p>
                            <div class="property-features">
                                <span><i class="fas fa-bed"></i> 3 Beds</span>
                                <span><i class="fas fa-bath"></i> 2 Baths</span>
                                <span><i class="fas fa-ruler-combined"></i> 1,800 sq ft</span>
                                <span><i class="fas fa-car"></i> 2 Garage</span>
                            </div>
                            <div class="property-amenities">
                                <span><i class="fas fa-swimming-pool"></i> Pool</span>
                                <span><i class="fas fa-tree"></i> Garden</span>
                                <span><i class="fas fa-shield-alt"></i> Security</span>
                            </div>
                            <div class="property-footer">
                                <div class="property-price">GHS 450,000</div>
                                <button class="property-btn">View Details</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Property 2 -->
                    <div class="property-card" data-category="rent residential">
                        <div class="property-image">
                            <img src="https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Modern Apartment">
                            <div class="property-actions">
                                <div class="property-action" title="Add to Favorites"><i class="fas fa-heart"></i></div>
                                <div class="property-action" title="Share"><i class="fas fa-share"></i></div>
                                <div class="property-action" title="Virtual Tour"><i class="fas fa-street-view"></i></div>
                            </div>
                            <div class="property-badge rent">For Rent</div>
                        </div>
                        <div class="property-info">
                            <div class="property-type">Residential • Apartment</div>
                            <h3 class="property-title">Downtown Luxury Apartment</h3>
                            <p class="property-location"><i class="fas fa-map-marker-alt"></i> 321 City Center, Downtown</p>
                            <div class="property-features">
                                <span><i class="fas fa-bed"></i> 2 Beds</span>
                                <span><i class="fas fa-bath"></i> 2 Baths</span>
                                <span><i class="fas fa-ruler-combined"></i> 1,100 sq ft</span>
                                <span><i class="fas fa-car"></i> 1 Parking</span>
                            </div>
                            <div class="property-amenities">
                                <span><i class="fas fa-dumbbell"></i> Gym</span>
                                <span><i class="fas fa-concierge-bell"></i> Concierge</span>
                                <span><i class="fas fa-city"></i> City View</span>
                            </div>
                            <div class="property-footer">
                                <div class="property-price">GHS 2,800/mo</div>
                                <button class="property-btn">View Details</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Property 3 -->
                    <div class="property-card" data-category="sale commercial">
                        <div class="property-image">
                            <img src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Office Building">
                            <div class="property-actions">
                                <div class="property-action" title="Add to Favorites"><i class="fas fa-heart"></i></div>
                                <div class="property-action" title="Share"><i class="fas fa-share"></i></div>
                                <div class="property-action" title="Virtual Tour"><i class="fas fa-street-view"></i></div>
                            </div>
                            <div class="property-badge sale">For Sale</div>
                        </div>
                        <div class="property-info">
                            <div class="property-type">Commercial • Office</div>
                            <h3 class="property-title">Premium Office Building</h3>
                            <p class="property-location"><i class="fas fa-map-marker-alt"></i> 555 Business Ave, Financial District</p>
                            <div class="property-features">
                                <span><i class="fas fa-building"></i> 12 Floors</span>
                                <span><i class="fas fa-users"></i> 200+ Capacity</span>
                                <span><i class="fas fa-ruler-combined"></i> 25,000 sq ft</span>
                                <span><i class="fas fa-car"></i> 50 Parking</span>
                            </div>
                            <div class="property-amenities">
                                <span><i class="fas fa-city"></i> Panoramic View</span>
                                <span><i class="fas fa-coffee"></i> Cafeteria</span>
                                <span><i class="fas fa-wifi"></i> High-Speed Internet</span>
                            </div>
                            <div class="property-footer">
                                <div class="property-price">GHS 4,200,000</div>
                                <button class="property-btn">View Details</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    </div>
                </div>
            </div>
          
        </div>

    <!-- Custom JS -->
    <script>

    // Wait for DOM to be fully loaded
    document.addEventListener('DOMContentLoaded', function() {
        // Tab functionality
            const tabs = document.querySelectorAll('.tab');
            const tabPanes = document.querySelectorAll('.tab-pane');
            
            tabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    // Remove active class from all tabs
                    tabs.forEach(t => t.classList.remove('active'));
                    // Add active class to clicked tab
                    tab.classList.add('active');
                    
                    // Get the target tab pane ID
                    const tabId = tab.getAttribute('data-tab');
                    
                    // Hide all tab panes
                    tabPanes.forEach(pane => pane.classList.remove('active'));
                    
                    // Show the target tab pane
                    document.getElementById(tabId).classList.add('active');
                });
            });
            
            // Additional interactivity for filter options
            const filterOptionsS = document.querySelectorAll('.filter-option');
            filterOptionsS.forEach(option => {
                option.addEventListener('click', () => {
                    filterOptionsS.forEach(o => o.classList.remove('active'));
                    option.classList.add('active');
                });
            });
            
            // Category buttons for designs and properties
            const categoryButtons = document.querySelectorAll('.category-btn');
            categoryButtons.forEach(button => {
                button.addEventListener('click', () => {
                    categoryButtons.forEach(b => b.classList.remove('active'));
                    button.classList.add('active');
                    
                    // In a real application, you would filter the content here
                    // based on the selected category
                    const category = button.getAttribute('data-category');
                    console.log(`Selected category: ${category}`);
                });
            });
    
    // Initialize product image carousels
    function initImageCarousels() {
        // Product image carousels
        const productCarousels = document.querySelectorAll('.product-image-carousel');
        
        productCarousels.forEach(carousel => {
            const images = carousel.querySelectorAll('img');
            const prevBtn = carousel.parentElement.querySelector('.product-image-prev');
            const nextBtn = carousel.parentElement.querySelector('.product-image-next');
            
            // Set first image as active
            if (images.length > 0) {
                images[0].classList.add('active');
            }
            
            let currentIndex = 0;
            
            // Add navigation functionality if there are multiple images
            if (images.length > 1 && prevBtn && nextBtn) {
                prevBtn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    images[currentIndex].classList.remove('active');
                    currentIndex = (currentIndex - 1 + images.length) % images.length;
                    images[currentIndex].classList.add('active');
                });
                
                nextBtn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    images[currentIndex].classList.remove('active');
                    currentIndex = (currentIndex + 1) % images.length;
                    images[currentIndex].classList.add('active');
                });
            }
        });
        
        // Property image carousels
        const propertyCarousels = document.querySelectorAll('.property-image-carousel');
        
        propertyCarousels.forEach(carousel => {
            const images = carousel.querySelectorAll('img');
            const prevBtn = carousel.parentElement.querySelector('.property-image-prev');
            const nextBtn = carousel.parentElement.querySelector('.property-image-next');
            
            // Set first image as active
            if (images.length > 0) {
                images[0].classList.add('active');
            }
            
            let currentIndex = 0;
            
            // Add navigation functionality
            if (prevBtn && nextBtn) {
                prevBtn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    images[currentIndex].classList.remove('active');
                    currentIndex = (currentIndex - 1 + images.length) % images.length;
                    images[currentIndex].classList.add('active');
                });
                
                nextBtn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    images[currentIndex].classList.remove('active');
                    currentIndex = (currentIndex + 1) % images.length;
                    images[currentIndex].classList.add('active');
                });
            }
        });
    }
    
    // Initialize image carousels when the page loads
    document.addEventListener('DOMContentLoaded', initImageCarousels);
    
    // Filter Options
    const filterOptions = document.querySelectorAll('.filter-option');
    filterOptions.forEach(option => {
        option.addEventListener('click', () => {
            filterOptions.forEach(o => o.classList.remove('active'));
            option.classList.add('active');
        });
    });
    
    // Category Items
    const categoryItems = document.querySelectorAll('.category-item');
    categoryItems.forEach(item => {
        item.addEventListener('click', () => {
            const parent = item.closest('.filter-category');
            parent.querySelectorAll('.category-item').forEach(i => i.classList.remove('active'));
            item.classList.add('active');
        });
    });
    
    // Filter Reset Buttons
    document.getElementById('reset-categories').addEventListener('click', () => {
        const categoryItems = document.querySelectorAll('.filter-card:nth-child(1) .category-item');
        categoryItems.forEach(item => item.classList.remove('active'));
        categoryItems[0].classList.add('active');
    });
    
    document.getElementById('reset-price').addEventListener('click', () => {
        document.getElementById('min-price').value = 'GHS 250';
        document.getElementById('max-price').value = '$GHS,000';
        document.getElementById('price-range-fill').style.left = '20%';
        document.getElementById('price-range-fill').style.right = '30%';
    });
    
    document.getElementById('reset-brand').addEventListener('click', () => {
        const brandItems = document.querySelectorAll('.filter-card:nth-child(3) .category-item');
        brandItems.forEach(item => item.classList.remove('active'));
    });
    
    document.getElementById('reset-filters').addEventListener('click', () => {
        const filterTags = document.querySelectorAll('.filter-tag');
        filterTags.forEach(tag => tag.remove());
    });
    
    // Filter Tags
    const filterTags = document.querySelectorAll('.filter-tag');
    filterTags.forEach(tag => {
        tag.addEventListener('click', () => {
            tag.remove();
        });
    });
    
    // Mobile Filter Toggle
    if (window.innerWidth <= 768) {
        const filterToggle = document.createElement('div');
        filterToggle.className = 'filter-toggle';
        filterToggle.innerHTML = '<i class="fas fa-filter"></i> Show Filters';
        
        const filterClose = document.createElement('div');
        filterClose.className = 'filter-close';
        filterClose.innerHTML = '<i class="fas fa-times"></i>';
        
        document.querySelector('.products-content').insertBefore(filterToggle, document.querySelector('.featured-section'));
        document.querySelector('.filter-sidebar').appendChild(filterClose);
        
        filterToggle.addEventListener('click', () => {
            document.querySelector('.filter-sidebar').classList.add('active');
        });
        
        filterClose.addEventListener('click', () => {
            document.querySelector('.filter-sidebar').classList.remove('active');
        });
    }
    
    }); // Close DOMContentLoaded
    </script>
</body>
</html>