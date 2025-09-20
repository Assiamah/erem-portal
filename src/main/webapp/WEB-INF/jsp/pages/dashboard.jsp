<style>
        :root {
            --primary: #435ebe;
            --primary-light: #eef2ff;
            --secondary: #6c757d;
            --success: #198754;
            --warning: #ffc107;
            --danger: #dc3545;
            --info: #0dcaf0;
            --light: #f8f9fa;
            --dark: #212529;
            --card-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            --gradient-primary: linear-gradient(120deg, var(--primary), #6278df);
        }
        
        body {
            background-color: #f5f7fb;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #495057;
        }
        
        .app-wrapper {
            padding: 20px 0;
        }
        
        .main-breadcrumb {
            padding: 10px 0;
        }
        
        .breadcrumb-title {
            color: #3b3b3b;
            font-weight: 600;
        }
        
        .card {
            border: none;
            border-radius: 16px;
            box-shadow: var(--card-shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
        }
        
        .card-h-100 {
            height: 100%;
        }
        
        .card-header {
            background-color: #fff;
            border-bottom: 1px solid #eaeaea;
            padding: 20px 25px;
        }
        
        .card-title {
            font-weight: 600;
            margin-bottom: 0;
        }
        
        .stats-card {
            text-align: center;
            padding: 25px 20px;
            border-radius: 16px;
            position: relative;
            overflow: hidden;
        }
        
        .stats-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-primary);
        }
        
        .stats-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 24px;
            background: var(--primary-light);
            color: var(--primary);
        }
        
        .stats-value {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 5px;
            color: var(--dark);
        }
        
        .stats-label {
            color: var(--secondary);
            margin-bottom: 5px;
        }
        
        .stats-change {
            font-size: 14px;
            font-weight: 600;
        }
        
        .quick-action-card {
            background: var(--gradient-primary);
            color: white;
            border-radius: 16px;
            padding: 25px;
            position: relative;
            overflow: hidden;
        }
        
        .quick-action-card::after {
            content: '';
            position: absolute;
            top: -20px;
            right: -20px;
            width: 150px;
            height: 150px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }
        
        .action-icon {
            font-size: 40px;
            margin-bottom: 15px;
        }
        
        .action-text {
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 20px;
            line-height: 1.4;
        }
        
        .btn-action {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            border-radius: 10px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-action:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }
        
        .table-responsive {
            border-radius: 12px;
            overflow: hidden;
        }
        
        .table th {
            font-weight: 600;
            color: #495057;
            border-top: none;
            background-color: #f8f9fa;
            padding: 15px;
        }
        
        .table td {
            padding: 15px;
            vertical-align: middle;
        }
        
        .avatar-sm {
            width: 36px;
            height: 36px;
            border-radius: 8px;
        }
        
        .badge {
            padding: 8px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }
        
        .application-status {
            display: flex;
            align-items: center;
        }
        
        .status-indicator {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin-right: 8px;
        }
        
        .status-pending {
            background-color: var(--warning);
        }
        
        .status-approved {
            background-color: var(--success);
        }
        
        .status-rejected {
            background-color: var(--danger);
        }
        
        .status-review {
            background-color: var(--info);
        }
        
        .chart-container {
            position: relative;
            height: 250px;
        }
        
        .progress {
            height: 8px;
            border-radius: 4px;
        }
        
        .progress-bar {
            border-radius: 4px;
        }
        
        .activity-item {
            display: flex;
            align-items: flex-start;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .activity-icon {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            flex-shrink: 0;
            background: var(--primary-light);
            color: var(--primary);
        }
        
        .activity-content {
            flex-grow: 1;
        }
        
        .activity-title {
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .activity-time {
            font-size: 12px;
            color: var(--secondary);
        }
        
        .btn {
            border-radius: 10px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background: var(--gradient-primary);
            border: none;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 94, 190, 0.3);
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .stats-value {
                font-size: 24px;
            }
            
            .quick-action-card {
                text-align: center;
            }
        }
    </style>

    <main class="app-wrapper">
        <div class="container-fluid">
            <div class="main-breadcrumb d-flex align-items-center my-3 position-relative">
                <h2 class="breadcrumb-title mb-0 flex-grow-1 fs-14">Lease Application Dashboard</h2>
                <div class="flex-shrink-0">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-end mb-0">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Lease Applications</li>
                        </ol>
                    </nav>
                </div>
            </div>
            
            <!-- Stats Cards Row -->
            <div class="row">
                <div class="col-xxl-9">
                    <div class="row">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card stats-card">
                                <div class="card-body">
                                    <div class="stats-icon">
                                        <i class="ri-file-list-3-line"></i>
                                    </div>
                                    <h3 class="stats-value">24</h3>
                                    <p class="stats-label">Total Applications</p>
                                    <div class="stats-change text-success">
                                        <i class="ri-arrow-up-line"></i> 12.5% Increase
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card stats-card">
                                <div class="card-body">
                                    <div class="stats-icon" style="background-color: #e6f7ee; color: #198754;">
                                        <i class="ri-checkbox-circle-line"></i>
                                    </div>
                                    <h3 class="stats-value">14</h3>
                                    <p class="stats-label">Approved</p>
                                    <div class="stats-change text-success">
                                        <i class="ri-arrow-up-line"></i> 8% Completion Rate
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card stats-card">
                                <div class="card-body">
                                    <div class="stats-icon" style="background-color: #fff4e6; color: #ffa94d;">
                                        <i class="ri-time-line"></i>
                                    </div>
                                    <h3 class="stats-value">7</h3>
                                    <p class="stats-label">Pending Review</p>
                                    <div class="stats-change text-warning">
                                        <i class="ri-arrow-down-line"></i> 3% Decrease
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card stats-card">
                                <div class="card-body">
                                    <div class="stats-icon" style="background-color: #ffe6e6; color: #dc3545;">
                                        <i class="ri-close-circle-line"></i>
                                    </div>
                                    <h3 class="stats-value">3</h3>
                                    <p class="stats-label">Rejected</p>
                                    <div class="stats-change text-danger">
                                        <i class="ri-arrow-up-line"></i> 2% Increase
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xxl-3 mb-4">
                    <div class="quick-action-card">
                        <div class="action-icon">
                            <i class="ri-rocket-line"></i>
                        </div>
                        <p class="action-text">Start a new lease application in just a few minutes</p>
                        <a href="javascript:void(0)" class="btn btn-action">
                            <i class="ri-add-line me-2"></i>New Application
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Charts and Applications Row -->
            <div class="row">
                <div class="col-xl-8 mb-4">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Application Status Overview</h4>
                            <div class="dropdown">
                                <button class="btn btn-sm btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                    Last 30 Days
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="javascript:void(0)">Last 7 Days</a>
                                    <a class="dropdown-item" href="javascript:void(0)">Last 30 Days</a>
                                    <a class="dropdown-item" href="javascript:void(0)">Last 90 Days</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <div class="d-flex justify-content-center align-items-center h-100">
                                    <div class="text-center">
                                        <i class="ri-bar-chart-box-line text-muted" style="font-size: 48px;"></i>
                                        <p class="text-muted mt-2">Application status chart would be displayed here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 mb-4">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Recent Activity</h4>
                            <a href="javascript:void(0)" class="link">View All</a>
                        </div>
                        <div class="card-body">
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="ri-file-add-line"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-title">New application submitted</div>
                                    <p class="mb-1">Emmanuel Oppong submitted a lease application for parcel R3013</p>
                                    <div class="activity-time">2 hours ago</div>
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="ri-checkbox-circle-line"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-title">Application approved</div>
                                    <p class="mb-1">Kwame Mensah's application for C4552 has been approved</p>
                                    <div class="activity-time">1 day ago</div>
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="ri-time-line"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-title">Application under review</div>
                                    <p class="mb-1">Ama Johnson's application for I7891 is now under review</p>
                                    <div class="activity-time">2 days ago</div>
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="ri-alert-line"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-title">Additional information requested</div>
                                    <p class="mb-1">Kofi Agyeman needs to provide additional documents for A3321</p>
                                    <div class="activity-time">3 days ago</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Applications Table -->
            <div class="row">
                <div class="col-12 mb-4">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center flex-wrap gap-3">
                            <h4 class="mb-0">Recent Lease Applications</h4>
                            <div class="d-flex gap-3 align-items-center">
                                <div class="form-icon">
                                    <input type="text" class="form-control form-control-icon" placeholder="Search applications..." required>
                                    <i class="ri-search-line"></i>
                                </div>
                                <div class="btn-group">
                                    <button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                        Filter
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="javascript:void(0)">All Applications</a>
                                        <a class="dropdown-item" href="javascript:void(0)">Pending</a>
                                        <a class="dropdown-item" href="javascript:void(0)">Approved</a>
                                        <a class="dropdown-item" href="javascript:void(0)">Rejected</a>
                                        <a class="dropdown-item" href="javascript:void(0)">Under Review</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Application ID</th>
                                            <th>Applicant</th>
                                            <th>Parcel</th>
                                            <th>Land Use</th>
                                            <th>Submitted</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="fw-medium">LA-1025</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://ui-avatars.com/api/?name=Emmanuel+Oppong&background=435ebe&color=fff" class="avatar-sm rounded-2 me-3" alt="Avatar">
                                                    <div>Emmanuel Oppong</div>
                                                </div>
                                            </td>
                                            <td>R3013</td>
                                            <td>Residential</td>
                                            <td>Sept 18, 2023</td>
                                            <td>
                                                <div class="application-status">
                                                    <span class="status-indicator status-review"></span>
                                                    <span>Under Review</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="dropdown">
                                                    <button class="btn btn-sm btn-light" type="button" data-bs-toggle="dropdown">
                                                        <i class="ri-more-2-fill"></i>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="javascript:void(0)">View Details</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0)">Edit</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0)">Track Status</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fw-medium">LA-1026</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://ui-avatars.com/api/?name=Kwame+Mensah&background=198754&color=fff" class="avatar-sm rounded-2 me-3" alt="Avatar">
                                                    <div>Kwame Mensah</div>
                                                </div>
                                            </td>
                                            <td>C4552</td>
                                            <td>Commercial</td>
                                            <td>Sept 15, 2023</td>
                                            <td>
                                                <div class="application-status">
                                                    <span class="status-indicator status-approved"></span>
                                                    <span>Approved</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="dropdown">
                                                    <button class="btn btn-sm btn-light" type="button" data-bs-toggle="dropdown">
                                                        <i class="ri-more-2-fill"></i>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="javascript:void(0)">View Details</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0)">Download Approval</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0)">Contact Applicant</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fw-medium">LA-1027</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://ui-avatars.com/api/?name=Ama+Johnson&background=0dcaf0&color=fff" class="avatar-sm rounded-2 me-3" alt="Avatar">
                                                    <div>Ama Johnson</div>
                                                </div>
                                            </td>
                                            <td>I7891</td>
                                            <td>Industrial</td>
                                            <td>Sept 10, 2023</td>
                                            <td>
                                                <div class="application-status">
                                                    <span class="status-indicator status-review"></span>
                                                    <span>Under Review</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="dropdown">
                                                    <button class="btn btn-sm btn-light" type="button" data-bs-toggle="dropdown">
                                                        <i class="ri-more-2-fill"></i>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="javascript:void(0)">View Details</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0)">Edit</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0)">Track Status</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fw-medium">LA-1028</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://ui-avatars.com/api/?name=Kofi+Agyeman&background=dc3545&color=fff" class="avatar-sm rounded-2 me-3" alt="Avatar">
                                                    <div>Kofi Agyeman</div>
                                                </div>
                                            </td>
                                            <td>A3321</td>
                                            <td>Agricultural</td>
                                            <td>Sept 5, 2023</td>
                                            <td>
                                                <div class="application-status">
                                                    <span class="status-indicator status-pending"></span>
                                                    <span>Pending Info</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="dropdown">
                                                    <button class="btn btn-sm btn-light" type="button" data-bs-toggle="dropdown">
                                                        <i class="ri-more-2-fill"></i>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="javascript:void(0)">View Details</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0)">Request Info</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0)">Contact Applicant</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fw-medium">LA-1029</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://ui-avatars.com/api/?name=Abena+Sarpong&background=435ebe&color=fff" class="avatar-sm rounded-2 me-3" alt="Avatar">
                                                    <div>Abena Sarpong</div>
                                                </div>
                                            </td>
                                            <td>R1298</td>
                                            <td>Residential</td>
                                            <td>Sept 3, 2023</td>
                                            <td>
                                                <div class="application-status">
                                                    <span class="status-indicator status-approved"></span>
                                                    <span>Approved</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="dropdown">
                                                    <button class="btn btn-sm btn-light" type="button" data-bs-toggle="dropdown">
                                                        <i class="ri-more-2-fill"></i>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="javascript:void(0)">View Details</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0)">Download Approval</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0)">Contact Applicant</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Additional Info Row -->
            <div class="row">
                <div class="col-xl-6 mb-4">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Application Status Distribution</h4>
                            <div class="dropdown">
                                <button class="btn btn-sm btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                    Last 30 Days
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="javascript:void(0)">Last 7 Days</a>
                                    <a class="dropdown-item" href="javascript:void(0)">Last 30 Days</a>
                                    <a class="dropdown-item" href="javascript:void(0)">Last 90 Days</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <div class="d-flex justify-content-center align-items-center h-100">
                                    <div class="text-center">
                                        <i class="ri-pie-chart-line text-muted" style="font-size: 48px;"></i>
                                        <p class="text-muted mt-2">Application status distribution chart would be displayed here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 mb-4">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Land Use Statistics</h4>
                            <a href="javascript:void(0)" class="link">View Details</a>
                        </div>
                        <div class="card-body">
                            <div class="mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span>Residential</span>
                                    <span class="fw-medium">12 Applications</span>
                                </div>
                                <div class="progress mb-3">
                                    <div class="progress-bar bg-primary" style="width: 50%"></div>
                                </div>
                            </div>
                            <div class="mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span>Commercial</span>
                                    <span class="fw-medium">7 Applications</span>
                                </div>
                                <div class="progress mb-3">
                                    <div class="progress-bar bg-success" style="width: 29%"></div>
                                </div>
                            </div>
                            <div class="mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span>Industrial</span>
                                    <span class="fw-medium">3 Applications</span>
                                </div>
                                <div class="progress mb-3">
                                    <div class="progress-bar bg-info" style="width: 13%"></div>
                                </div>
                            </div>
                            <div>
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span>Agricultural</span>
                                    <span class="fw-medium">2 Applications</span>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-warning" style="width: 8%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Simple animation for stats cards
        document.addEventListener('DOMContentLoaded', function() {
            const statsCards = document.querySelectorAll('.stats-card');
            
            statsCards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-8px)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                });
            });
            
            // Quick action button animation
            const quickActionBtn = document.querySelector('.btn-action');
            if (quickActionBtn) {
                quickActionBtn.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-2px)';
                });
                
                quickActionBtn.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                });
            }
        });
    </script>