<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


  <style>
        :root {
            --primary: #2c3e50;
            --secondary: #e74c3c;
            --accent: #3498db;
            --success: #27ae60;
            --warning: #f39c12;
            --danger: #e74c3c;
            --lease: #5b66eb;
            --rent: #1abc9c;
            --ecommerce: #f1c40f;
            --appointment: #e67e22;
            --light: #ecf0f1;
            --dark: #2c3e50;
        }
        
        body {
            background-color: #f8f9fa;
        }
        
        .app-wrapper {
            padding: 20px;
        }
        
        .user-welcome {
            background: linear-gradient(120deg, #5b66eb, var(--accent));
            color: white;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 24px;
        }
        
        .breadcrumb-title {
            color: var(--primary);
            font-weight: 600;
        }
        
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 24px;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        
        .card-header {
            background-color: white;
            border-bottom: 1px solid #eef2f6;
            padding: 16px 20px;
            border-radius: 12px 12px 0 0 !important;
        }
        
        .stat-card {
            padding: 20px;
            display: flex;
            align-items: center;
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            margin-right: 15px;
            font-size: 24px;
        }
        
        .stat-icon.primary {
            background-color: rgba(44, 62, 80, 0.1);
            color: var(--primary);
        }
        
        .stat-icon.lease {
            background-color: rgba(91, 102, 235, 0.1);
            color: var(--lease);
        }
        
        .stat-icon.rent {
            background-color: rgba(26, 188, 156, 0.1);
            color: var(--rent);
        }
        
        .stat-icon.ecommerce {
            background-color: rgba(241, 196, 15, 0.1);
            color: var(--ecommerce);
        }
        
        .stat-icon.appointment {
            background-color: rgba(230, 126, 34, 0.1);
            color: var(--appointment);
        }
        
        .stat-number {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stat-title {
            color: #6c757d;
            font-size: 14px;
            margin-bottom: 0;
        }
        
        .badge {
            padding: 6px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .badge-confirmed {
            background-color: rgba(39, 174, 96, 0.15);
            color: var(--success);
        }
        
        .badge-pending {
            background-color: rgba(243, 156, 18, 0.15);
            color: var(--warning);
        }
        
        .badge-cancelled {
            background-color: rgba(231, 76, 60, 0.15);
            color: var(--danger);
        }
        
        .badge-completed {
            background-color: rgba(52, 152, 219, 0.15);
            color: var(--accent);
        }
        
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            margin-bottom: 24px;
        }
        
        .action-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px 15px;
            border-radius: 12px;
            background-color: white;
            text-align: center;
            transition: all 0.2s;
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }
        
        .action-btn:hover {
            background-color: var(--light);
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        
        .action-icon {
            font-size: 24px;
            margin-bottom: 10px;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
        }
        
        .action-icon.lease {
            background-color: rgba(91, 102, 235, 0.1);
            color: var(--lease);
        }
        
        .action-icon.rent {
            background-color: rgba(26, 188, 156, 0.1);
            color: var(--rent);
        }
        
        .action-icon.ecommerce {
            background-color: rgba(241, 196, 15, 0.1);
            color: var(--ecommerce);
        }
        
        .action-icon.appointment {
            background-color: rgba(230, 126, 34, 0.1);
            color: var(--appointment);
        }
        
        .action-title {
            font-size: 14px;
            font-weight: 600;
            color: var(--dark);
        }
        
        .chart-container {
            position: relative;
            height: 250px;
        }
        
        .dashboard-section {
            margin-bottom: 30px;
        }
        
        .section-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eef2f6;
        }
        
        .property-thumb {
            width: 60px;
            height: 40px;
            border-radius: 4px;
            object-fit: cover;
        }
        
        .agent-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .table th {
            font-weight: 600;
            color: var(--dark);
            font-size: 13px;
            text-transform: uppercase;
        }
        
        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        .btn-primary:hover {
            background-color: #1a2530;
            border-color: #1a2530;
        }
        
        .btn-lease {
            background-color: var(--lease);
            border-color: var(--lease);
            color: white;
        }
        
        .btn-rent {
            background-color: var(--rent);
            border-color: var(--rent);
            color: white;
        }
        
        .btn-ecommerce {
            background-color: var(--ecommerce);
            border-color: var(--ecommerce);
            color: white;
        }
        
        .btn-appointment {
            background-color: var(--appointment);
            border-color: var(--appointment);
            color: white;
        }
        
        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: var(--secondary);
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
        }
        
        .notification-item {
            padding: 12px 15px;
            border-left: 3px solid var(--accent);
            margin-bottom: 10px;
            background-color: #f8f9fa;
            border-radius: 4px;
        }
        
        .notification-item.warning {
            border-left-color: var(--warning);
        }
        
        .notification-item.important {
            border-left-color: var(--secondary);
        }
    </style>

    
 <main class="app-wrapper">
        <div class="container-fluid">
            <!-- User Welcome Section -->
            <div class="user-welcome">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h2>Welcome back, ${userInfo.first_name} ${userInfo.last_name}</h2>
                        <p class="mb-0">Here's what's happening with your properties and applications today.</p>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
           

            <!-- Statistics Overview -->
            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card stat-card">
                        <div class="stat-icon lease">
                            <i class="bi bi-house-door"></i>
                        </div>
                        <div>
                            <div class="stat-number">2</div>
                            <div class="stat-title">My Properties</div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card stat-card">
                        <div class="stat-icon rent">
                            <i class="bi bi-cash-stack"></i>
                        </div>
                        <div>
                            <div class="stat-number">GHS 850</div>
                            <div class="stat-title">Monthly Rent</div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card stat-card">
                        <div class="stat-icon ecommerce">
                            <i class="bi bi-bag"></i>
                        </div>
                        <div>
                            <div class="stat-number">3</div>
                            <div class="stat-title">Active Orders</div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card stat-card">
                        <div class="stat-icon appointment">
                            <i class="bi bi-calendar-check"></i>
                        </div>
                        <div>
                            <div class="stat-number">2</div>
                            <div class="stat-title">Upcoming Viewings</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Left Column -->
                <div class="col-lg-8">
                    <!-- Notifications & Alerts -->
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Notifications & Reminders</h4>
                            <a href="#" class="btn btn-sm btn-outline-primary">View All</a>
                        </div>
                        <div class="card-body">
                            <div class="notification-item">
                                <div class="d-flex justify-content-between">
                                    <h6 class="mb-1">Rent Payment Due</h6>
                                    <small class="text-muted">2 days ago</small>
                                </div>
                                <p class="mb-0">Your rent payment of GHS 850 for Modern Apartment B34 is due in 5 days.</p>
                            </div>
                            <div class="notification-item warning">
                                <div class="d-flex justify-content-between">
                                    <h6 class="mb-1">Application Update</h6>
                                    <small class="text-muted">1 day ago</small>
                                </div>
                                <p class="mb-0">Your lease application for Luxury Villa A12 is pending review.</p>
                            </div>
                            <div class="notification-item important">
                                <div class="d-flex justify-content-between">
                                    <h6 class="mb-1">Appointment Reminder</h6>
                                    <small class="text-muted">Today</small>
                                </div>
                                <p class="mb-0">You have a property viewing scheduled for tomorrow at 11:30 AM.</p>
                            </div>
                        </div>
                    </div>

                    <!-- My Properties -->
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">My Properties</h4>
                            <a href="#" class="btn btn-sm btn-lease">View All</a>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <div class="card h-100">
                                        <img src="https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" class="card-img-top" alt="Property Image">
                                        <div class="card-body">
                                            <h5 class="card-title">Modern Apartment B34</h5>
                                            <p class="card-text">3 Bedroom • 2 Bathroom • 1200 sq ft</p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span class="badge bg-success">Rented</span>
                                                <span class="fw-bold">GHS 850/mo</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <div class="card h-100">
                                        <img src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" class="card-img-top" alt="Property Image">
                                        <div class="card-body">
                                            <h5 class="card-title">Luxury Villa A12</h5>
                                            <p class="card-text">4 Bedroom • 3 Bathroom • 2400 sq ft</p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span class="badge bg-warning">Application Pending</span>
                                                <span class="fw-bold">GHS 2,200/mo</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column -->
                <div class="col-lg-4">
                    <!-- Upcoming Appointments -->
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Upcoming Appointments</h4>
                            <a href="#" class="btn btn-sm btn-appointment">Schedule New</a>
                        </div>
                        <div class="card-body">
                            <div class="appointment-item">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <h6 class="mb-0">Tomorrow, 11:30 AM</h6>
                                    <span class="badge badge-confirmed">Confirmed</span>
                                </div>
                                <p class="mb-1">Property Viewing - Luxury Villa A12</p>
                                <small class="text-muted">Agent: Emma Johnson</small>
                            </div>
                            <div class="appointment-item">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <h6 class="mb-0">Nov 15, 2:00 PM</h6>
                                    <span class="badge badge-pending">Pending</span>
                                </div>
                                <p class="mb-1">Lease Signing - Modern Apartment B34</p>
                                <small class="text-muted">Agent: John Smith</small>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Transactions -->
                    <div class="card">
                        <div class="card-header">
                            <h4 class="mb-0">Recent Transactions</h4>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div>
                                    <h6 class="mb-0">Rent Payment</h6>
                                    <small class="text-muted">Oct 28, 2025</small>
                                </div>
                                <div class="text-end">
                                    <h6 class="mb-0 text-success">-GHS 850</h6>
                                    <small class="text-success">Completed</small>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div>
                                    <h6 class="mb-0">Building Materials</h6>
                                    <small class="text-muted">Oct 25, 2025</small>
                                </div>
                                <div class="text-end">
                                    <h6 class="mb-0 text-danger">-GHS 420</h6>
                                    <small class="text-success">Delivered</small>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="mb-0">Security Deposit</h6>
                                    <small class="text-muted">Oct 15, 2025</small>
                                </div>
                                <div class="text-end">
                                    <h6 class="mb-0 text-danger">-GHS 1,700</h6>
                                    <small class="text-success">Completed</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Links -->
                    <div class="card">
                        <div class="card-header">
                            <h4 class="mb-0">Quick Links</h4>
                        </div>
                        <div class="card-body">
                            <div class="d-grid gap-2">
                                <a href="#" class="btn btn-outline-primary btn-sm text-start">
                                    <i class="bi bi-file-text me-2"></i> My Lease Agreements
                                </a>
                                <a href="#" class="btn btn-outline-primary btn-sm text-start">
                                    <i class="bi bi-receipt me-2"></i> Payment History
                                </a>
                                <a href="#" class="btn btn-outline-primary btn-sm text-start">
                                    <i class="bi bi-question-circle me-2"></i> Support Center
                                </a>
                                <a href="#" class="btn btn-outline-primary btn-sm text-start">
                                    <i class="bi bi-gear me-2"></i> Account Settings
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Orders Section -->
            <div class="dashboard-section">
                <h3 class="section-title">My Recent Orders</h3>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h4 class="mb-0">Building Materials Orders</h4>
                                <a href="#" class="btn btn-sm btn-ecommerce">Shop Now</a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Date</th>
                                                <th>Items</th>
                                                <th>Amount</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#ORD-7841</td>
                                                <td>Oct 25, 2025</td>
                                                <td>Paint, Brushes, Tools</td>
                                                <td>GHS 420</td>
                                                <td><span class="badge bg-success">Delivered</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="bi bi-eye"></i> View
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#ORD-7830</td>
                                                <td>Oct 18, 2025</td>
                                                <td>Ceramic Tiles, Grout</td>
                                                <td>GHS 780</td>
                                                <td><span class="badge bg-success">Delivered</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="bi bi-eye"></i> View
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#ORD-7815</td>
                                                <td>Oct 5, 2025</td>
                                                <td>Tool Kit, Hardware</td>
                                                <td>GHS 350</td>
                                                <td><span class="badge bg-success">Delivered</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="bi bi-eye"></i> View
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>