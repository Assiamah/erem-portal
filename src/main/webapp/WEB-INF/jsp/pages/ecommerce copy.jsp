<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructPro | Premium Building Solutions</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&family=Roboto+Mono:wght@300;400;500&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Swiper JS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
    
    <style>
        :root {
            --primary: #2a2f35;
            --secondary: #4a6cf7;
            --accent: #ff6b4a;
            --neutral: #f7f9fc;
            --dark: #1d2228;
            --light: #ffffff;
            --gray: #8a8f9c;
            --light-gray: #e2e6ee;
            --success: #2ecc71;
            --warning: #f39c12;
            
            --shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            --shadow-hover: 0 12px 32px rgba(0, 0, 0, 0.12);
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
            color: var(--primary);
            background-color: var(--neutral);
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
            background: var(--light);
            box-shadow: var(--shadow);
            position: sticky;
            top: 0;
            z-index: 100;
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
            color: var(--primary);
            text-decoration: none;
        }
        
        .logo i {
            color: var(--secondary);
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
            border: 1px solid var(--light-gray);
            border-radius: 100px;
            font-size: 16px;
            transition: var(--transition);
        }
        
        .search-bar input:focus {
            outline: none;
            border-color: var(--secondary);
            box-shadow: 0 0 0 3px rgba(74, 108, 247, 0.1);
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
            background: var(--neutral);
            color: var(--primary);
            text-decoration: none;
            position: relative;
            transition: var(--transition);
        }
        
        .header-action:hover {
            background: var(--secondary);
            color: var(--light);
        }
        
        .cart-count {
            position: absolute;
            top: -5px;
            right: -5px;
            background: var(--accent);
            color: white;
            font-size: 12px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        /* Main Layout */
        .main-layout {
            display: flex;
            gap: 30px;
            padding: 40px 0;
        }
        
        /* Filter Sidebar */
        .filter-sidebar {
            width: 300px;
            flex-shrink: 0;
        }
        
        .filter-card {
            background: var(--light);
            border-radius: var(--radius);
            padding: 24px;
            margin-bottom: 24px;
            box-shadow: var(--shadow);
        }
        
        .filter-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        
        .filter-title {
            font-size: 18px;
            font-weight: 700;
        }
        
        .filter-reset {
            color: var(--secondary);
            font-size: 14px;
            cursor: pointer;
        }
        
        .filter-category {
            margin-bottom: 20px;
        }
        
        .category-list {
            list-style: none;
        }
        
        .category-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid var(--light-gray);
            cursor: pointer;
            transition: var(--transition);
        }
        
        .category-item:hover {
            color: var(--secondary);
        }
        
        .category-item.active {
            color: var(--secondary);
            font-weight: 600;
        }
        
        .category-count {
            color: var(--gray);
            font-size: 14px;
        }
        
        .price-filter {
            margin-bottom: 20px;
        }
        
        .price-range {
            height: 4px;
            background: var(--light-gray);
            border-radius: 2px;
            position: relative;
            margin: 30px 0;
        }
        
        .price-range-fill {
            height: 100%;
            background: var(--secondary);
            position: absolute;
            left: 0%;
            width: 70%;
            border-radius: 2px;
        }
        
        .price-inputs {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
        }
        
        .price-input {
            flex: 1;
        }
        
        .price-input label {
            display: block;
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 6px;
        }
        
        .price-input input {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid var(--light-gray);
            border-radius: 8px;
            font-size: 14px;
        }
        
        .filter-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .filter-tag {
            padding: 8px 16px;
            background: var(--neutral);
            border-radius: 100px;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            transition: var(--transition);
        }
        
        .filter-tag:hover {
            background: var(--light-gray);
        }
        
        .filter-tag i {
            font-size: 12px;
        }
        
        /* Products Grid */
        .products-section {
            flex: 1;
        }
        
        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        
        .section-title {
            font-size: 24px;
            font-weight: 700;
        }
        
        .view-options {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        
        .view-option {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            background: var(--light);
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            transition: var(--transition);
        }
        
        .view-option.active {
            background: var(--secondary);
            color: var(--light);
        }
        
        .sort-select {
            padding: 8px 16px;
            padding-right: 40px;
            border: 1px solid var(--light-gray);
            border-radius: 8px;
            font-size: 14px;
            appearance: none;
            background: var(--light) url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%238a8f9c' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E") no-repeat right 16px center;
        }
        
        .products-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }
        
        .product-card {
            background: var(--light);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: var(--transition);
        }
        
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }
        
        .product-image {
            position: relative;
            height: 220px;
            overflow: hidden;
        }
        
        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }
        
        .product-card:hover .product-image img {
            transform: scale(1.05);
        }
        
        .product-badge {
            position: absolute;
            top: 16px;
            left: 16px;
            padding: 6px 12px;
            background: var(--accent);
            color: var(--light);
            font-size: 12px;
            font-weight: 600;
            border-radius: 4px;
        }
        
        .product-actions {
            position: absolute;
            top: 16px;
            right: 16px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        
        .product-action {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            box-shadow: var(--shadow);
            transition: var(--transition);
            opacity: 0;
            transform: translateX(10px);
        }
        
        .product-card:hover .product-action {
            opacity: 1;
            transform: translateX(0);
        }
        
        .product-action:hover {
            background: var(--secondary);
            color: var(--light);
        }
        
        .product-info {
            padding: 20px;
        }
        
        .product-category {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 8px;
        }
        
        .product-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 12px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        .product-rating {
            display: flex;
            align-items: center;
            gap: 6px;
            margin-bottom: 12px;
        }
        
        .product-rating i {
            color: var(--warning);
            font-size: 14px;
        }
        
        .product-rating span {
            font-size: 14px;
            color: var(--gray);
        }
        
        .product-price {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 16px;
        }
        
        .current-price {
            font-size: 20px;
            font-weight: 700;
            color: var(--primary);
        }
        
        .original-price {
            font-size: 16px;
            color: var(--gray);
            text-decoration: line-through;
        }
        
        .discount {
            font-size: 14px;
            color: var(--accent);
            font-weight: 600;
        }
        
        .product-meta {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-top: 1px solid var(--light-gray);
            padding-top: 16px;
            margin-top: 16px;
        }
        
        .product-meta-item {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 14px;
            color: var(--gray);
        }
        
        .product-meta-item i {
            font-size: 16px;
        }
        
        .add-to-cart {
            width: 100%;
            padding: 12px;
            background: var(--secondary);
            color: var(--light);
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .add-to-cart:hover {
            background: var(--primary);
        }
        
        /* Responsive Styles */
        @media (max-width: 1200px) {
            .products-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 900px) {
            .main-layout {
                flex-direction: column;
            }
            
            .filter-sidebar {
                width: 100%;
            }
            
            .filter-sidebar {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }
        }
        
        @media (max-width: 768px) {
            .header-container {
                flex-wrap: wrap;
            }
            
            .search-bar {
                order: 3;
                max-width: 100%;
                margin: 20px 0 0;
            }
            
            .products-grid {
                grid-template-columns: 1fr;
            }
            
            .filter-sidebar {
                grid-template-columns: 1fr;
            }
            
            .section-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 16px;
            }
            
            .view-options {
                width: 100%;
                justify-content: space-between;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <div class="header-container">
                <a href="#" class="logo">
                    <span>SmartErem</span>
                </a>
                
                <div class="search-bar">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search for properties, materials, designs...">
                </div>
                
                <div class="header-actions">
                    <a href="#" class="header-action">
                        <i class="fas fa-user"></i>
                    </a>
                    <a href="#" class="header-action">
                        <i class="fas fa-heart"></i>
                    </a>
                    <a href="#" class="header-action">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="cart-count">3</span>
                    </a>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="main-layout">
            <!-- Filter Sidebar -->
            <aside class="filter-sidebar">
                <div class="filter-card">
                    <div class="filter-header">
                        <h3 class="filter-title">Categories</h3>
                        <span class="filter-reset">Reset</span>
                    </div>
                    
                    <div class="filter-category">
                        <ul class="category-list">
                            <li class="category-item active">
                                <span>All Categories</span>
                                <span class="category-count">(128)</span>
                            </li>
                            <li class="category-item">
                                <span>Selling Properties</span>
                                <span class="category-count">(42)</span>
                            </li>
                            <li class="category-item">
                                <span>Building Materials</span>
                                <span class="category-count">(56)</span>
                            </li>
                            <li class="category-item">
                                <span>Building Designs</span>
                                <span class="category-count">(30)</span>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="filter-card">
                    <div class="filter-header">
                        <h3 class="filter-title">Price Range</h3>
                        <span class="filter-reset">Reset</span>
                    </div>
                    
                    <div class="price-filter">
                        <div class="price-range">
                            <div class="price-range-fill"></div>
                        </div>
                        
                        <div class="price-inputs">
                            <div class="price-input">
                                <label for="min-price">Min</label>
                                <input type="text" id="min-price" value="$250">
                            </div>
                            <div class="price-input">
                                <label for="max-price">Max</label>
                                <input type="text" id="max-price" value="$5,000">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="filter-card">
                    <div class="filter-header">
                        <h3 class="filter-title">Brand</h3>
                        <span class="filter-reset">Reset</span>
                    </div>
                    
                    <div class="filter-category">
                        <ul class="category-list">
                            <li class="category-item">
                                <span>ConstructPlus</span>
                                <span class="category-count">(32)</span>
                            </li>
                            <li class="category-item">
                                <span>BuildMaster</span>
                                <span class="category-count">(24)</span>
                            </li>
                            <li class="category-item">
                                <span>EcoMaterials</span>
                                <span class="category-count">(18)</span>
                            </li>
                            <li class="category-item">
                                <span>DesignCraft</span>
                                <span class="category-count">(14)</span>
                            </li>
                            <li class="category-item">
                                <span>UrbanLiving</span>
                                <span class="category-count">(9)</span>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="filter-card">
                    <div class="filter-header">
                        <h3 class="filter-title">Filters</h3>
                        <span class="filter-reset">Reset</span>
                    </div>
                    
                    <div class="filter-tags">
                        <div class="filter-tag">
                            <span>In Stock</span>
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="filter-tag">
                            <span>On Sale</span>
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="filter-tag">
                            <span>Free Shipping</span>
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="filter-tag">
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
                                <span class="category-count">(18)</span>
                            </li>
                            <li class="category-item">
                                <span>Out of Stock</span>
                                <span class="category-count">(12)</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </aside>
            
            <!-- Products Section -->
            <section class="products-section">
                <div class="section-header">
                    <h2 class="section-title">Building Materials</h2>
                    
                    <div class="view-options">
                        <div class="view-option active">
                            <i class="fas fa-grip-horizontal"></i>
                            <span>Grid</span>
                        </div>
                        <div class="view-option">
                            <i class="fas fa-list"></i>
                            <span>List</span>
                        </div>
                        
                        <select class="sort-select">
                            <option>Sort by: Newest</option>
                            <option>Sort by: Price: Low to High</option>
                            <option>Sort by: Price: High to Low</option>
                            <option>Sort by: Most Popular</option>
                        </select>
                    </div>
                </div>
                
                <div class="products-grid">
                    <!-- Product 1 -->
                    <div class="product-card">
                        <div class="product-image">
                            <img src="https://images.unsplash.com/photo-1620371350502-999c9c3e5a38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80" alt="Premium Hardwood">
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
                            <div class="product-category">Building Materials</div>
                            <h3 class="product-title">Premium Hardwood Flooring</h3>
                            
                            <div class="product-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <span>(42)</span>
                            </div>
                            
                            <div class="product-price">
                                <span class="current-price">$34.99</span>
                                <span class="original-price">$49.99</span>
                                <span class="discount">30% OFF</span>
                            </div>
                            
                            <button class="add-to-cart">
                                <i class="fas fa-shopping-cart"></i>
                                Add to Cart
                            </button>
                            
                            <div class="product-meta">
                                <div class="product-meta-item">
                                    <i class="fas fa-truck"></i>
                                    <span>Free Shipping</span>
                                </div>
                                <div class="product-meta-item">
                                    <i class="fas fa-check-circle"></i>
                                    <span>In Stock</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Product 2 -->
                    <div class="product-card">
                        <div class="product-image">
                            <img src="https://images.unsplash.com/photo-1582407947304-fd86f028f716?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80" alt="Modern Villa Design">
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
                            <div class="product-category">Building Designs</div>
                            <h3 class="product-title">Modern Villa Architectural Plan</h3>
                            
                            <div class="product-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span>(28)</span>
                            </div>
                            
                            <div class="product-price">
                                <span class="current-price">$2,499.00</span>
                                <span class="original-price">$3,200.00</span>
                                <span class="discount">22% OFF</span>
                            </div>
                            
                            <button class="add-to-cart">
                                <i class="fas fa-shopping-cart"></i>
                                Add to Cart
                            </button>
                            
                            <div class="product-meta">
                                <div class="product-meta-item">
                                    <i class="fas fa-download"></i>
                                    <span>Digital Product</span>
                                </div>
                                <div class="product-meta-item">
                                    <i class="fas fa-check-circle"></i>
                                    <span>In Stock</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Product 3 -->
                    <div class="product-card">
                        <div class="product-image">
                            <img src="https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80" alt="Luxury Apartment">
                            
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
                            <div class="product-category">Selling Properties</div>
                            <h3 class="product-title">Luxury Downtown Apartment</h3>
                            
                            <div class="product-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>
                                <span>(15)</span>
                            </div>
                            
                            <div class="product-price">
                                <span class="current-price">$475,000</span>
                            </div>
                            
                            <button class="add-to-cart">
                                <i class="fas fa-calendar"></i>
                                Schedule Tour
                            </button>
                            
                            <div class="product-meta">
                                <div class="product-meta-item">
                                    <i class="fas fa-bed"></i>
                                    <span>3 Beds</span>
                                </div>
                                <div class="product-meta-item">
                                    <i class="fas fa-bath"></i>
                                    <span>2 Baths</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Product 4 -->
                    <div class="product-card">
                        <div class="product-image">
                            <img src="https://images.unsplash.com/photo-1621114957136-4bd33c8b50f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80" alt="Smart Glass">
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
                            <div class="product-category">Building Materials</div>
                            <h3 class="product-title">Energy Efficient Smart Glass</h3>
                            
                            <div class="product-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <span>(36)</span>
                            </div>
                            
                            <div class="product-price">
                                <span class="current-price">$89.99</span>
                                <span class="original-price">$109.99</span>
                                <span class="discount">18% OFF</span>
                            </div>
                            
                            <button class="add-to-cart">
                                <i class="fas fa-shopping-cart"></i>
                                Add to Cart
                            </button>
                            
                            <div class="product-meta">
                                <div class="product-meta-item">
                                    <i class="fas fa-bolt"></i>
                                    <span>Energy Saving</span>
                                </div>
                                <div class="product-meta-item">
                                    <i class="fas fa-check-circle"></i>
                                    <span>In Stock</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Product 5 -->
                    <div class="product-card">
                        <div class="product-image">
                            <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80" alt="Family Home">
                            
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
                            <div class="product-category">Selling Properties</div>
                            <h3 class="product-title">Suburban Family Home</h3>
                            
                            <div class="product-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>
                                <span>(22)</span>
                            </div>
                            
                            <div class="product-price">
                                <span class="current-price">$625,000</span>
                            </div>
                            
                            <button class="add-to-cart">
                                <i class="fas fa-calendar"></i>
                                Schedule Tour
                            </button>
                            
                            <div class="product-meta">
                                <div class="product-meta-item">
                                    <i class="fas fa-bed"></i>
                                    <span>4 Beds</span>
                                </div>
                                <div class="product-meta-item">
                                    <i class="fas fa-bath"></i>
                                    <span>3 Baths</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Product 6 -->
                    <div class="product-card">
                        <div class="product-image">
                            <img src="https://images.unsplash.com/photo-1633380114356-5c8c61c6c4cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80" alt="Tiny House Design">
                            <span class="product-badge">Trending</span>
                            
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
                            <div class="product-category">Building Designs</div>
                            <h3 class="product-title">Eco-Friendly Tiny House Plan</h3>
                            
                            <div class="product-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span>(47)</span>
                            </div>
                            
                            <div class="product-price">
                                <span class="current-price">$1,299.00</span>
                                <span class="original-price">$1,599.00</span>
                                <span class="discount">19% OFF</span>
                            </div>
                            
                            <button class="add-to-cart">
                                <i class="fas fa-shopping-cart"></i>
                                Add to Cart
                            </button>
                            
                            <div class="product-meta">
                                <div class="product-meta-item">
                                    <i class="fas fa-leaf"></i>
                                    <span>Eco-Friendly</span>
                                </div>
                                <div class="product-meta-item">
                                    <i class="fas fa-download"></i>
                                    <span>Digital Product</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Lightbox JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.4/js/lightbox.min.js"></script>
    
    <!-- jQuery (needed for lightbox and some Bootstrap components) -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    
    <script>
        // Category filtering
        document.addEventListener('DOMContentLoaded', function() {
            const categoryButtons = document.querySelectorAll('.category-btn');
            const productItems = document.querySelectorAll('.product-col');
            
            categoryButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const category = this.getAttribute('data-category');
                    
                    // Update active button
                    categoryButtons.forEach(btn => btn.classList.remove('active'));
                    this.classList.add('active');
                    
                    // Filter products
                    productItems.forEach(item => {
                        if (category === 'all' || item.getAttribute('data-category') === category) {
                            item.style.display = 'block';
                        } else {
                            item.style.display = 'none';
                        }
                    });
                });
            });
            
            // Search functionality
            const searchInput = document.querySelector('.search-form input');
            searchInput.addEventListener('keyup', function() {
                const searchText = this.value.toLowerCase();
                
                productItems.forEach(item => {
                    const title = item.querySelector('.product-title').textContent.toLowerCase();
                    const description = item.querySelector('.product-attributes').textContent.toLowerCase();
                    
                    if (title.includes(searchText) || description.includes(searchText)) {
                        item.style.display = 'block';
                    } else {
                        item.style.display = 'none';
                    }
                });
            });
            
            // Load more products (simulated)
            const loadMoreBtn = document.getElementById('loadMore');
            loadMoreBtn.addEventListener('click', function() {
                // In a real application, this would fetch more products from the server
                alert('Loading more products...');
                // This would be replaced with an AJAX call to fetch more products
            });
            
            // Quick view modal
            const quickViewButtons = document.querySelectorAll('.quick-view-btn');
            quickViewButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const productId = this.getAttribute('data-product-id');
                    // In a real application, this would fetch product details from the server
                    const modalBody = document.querySelector('#productModal .modal-body');
                    modalBody.innerHTML = `
                        <div class="row">
                            <div class="col-md-6">
                                <img src="https://placehold.co/600x400/2c3e50/FFFFFF?text=Product+${productId}" class="img-fluid" alt="Product ${productId}">
                            </div>
                            <div class="col-md-6">
                                <h3>Product ${productId} Details</h3>
                                <p class="text-muted">This is a quick view of product ${productId}. In a real application, detailed product information would be loaded here.</p>
                                <p class="product-price">$999.99</p>
                                <div class="d-grid gap-2">
                                    <a href="${pageContext.request.contextPath}/product/${productId}" class="btn btn-primary">View Full Details</a>
                                    <button class="btn btn-outline-secondary" data-bs-dismiss="modal">Continue Shopping</button>
                                </div>
                            </div>
                        </div>
                    `;
                });
            });
        });
    </script>
</body>
</html>