<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    :root {
        --primary: #5d68ef;
        --primary-light: #eef2ff;
        --secondary: #6c757d;
        --success: #198754;
        --warning: #ffc107;
        --danger: #dc3545;
        --info: #0dcaf0;
        --light: #f8f9fa;
        --dark: #212529;
    }
    
    body {
        background-color: #f5f7fb;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #495057;
    }
    
    /* .app-wrapper {
        padding: 20px 0;
        width: 1000px;
        margin: 100px auto;
    } */
    
    .tracker-card {
        border: none;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        overflow: hidden;
        width: 1000px;
        margin: 100px auto;
    }
    
    .card-header {
        background: linear-gradient(120deg, var(--primary), #6278df);
        color: white;
        border-bottom: none;
        padding: 25px;
    }
    
    .card-title {
        font-weight: 600;
        margin-bottom: 0;
    }
    
    .search-section {
        background-color: white;
        border-radius: 12px;
        padding: 25px;
        margin-bottom: 30px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    }
    
    .form-control, .btn {
        border-radius: 10px;
        padding: 12px 20px;
    }
    
    .btn-primary {
        background: linear-gradient(120deg, var(--primary), #6278df);
        border: none;
        font-weight: 500;
    }
    
    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(67, 94, 190, 0.3);
    }
    
    .tracking-timeline {
        position: relative;
        padding-left: 40px;
        margin: 30px 0;
    }
    
    .timeline-progress {
        position: absolute;
        left: 16px;
        top: 15px;
        bottom: 15px;
        width: 6px;
        background-color: #e9ecef;
        border-radius: 3px;
        overflow: hidden;
    }
    
    .progress-bar {
        background: linear-gradient(to bottom, var(--primary), #6278df);
        width: 100%;
        border-radius: 3px;
        transition: height 1s ease;
    }
    
    .timeline-item {
        position: relative;
        margin-bottom: 30px;
    }
    
    .timeline-item:last-child {
        margin-bottom: 0;
    }
    
    .timeline-icon {
        position: absolute;
        left: -40px;
        top: 0;
        width: 34px;
        height: 34px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: white;
        border: 3px solid #e9ecef;
        z-index: 2;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    }
    
    .timeline-item.completed .timeline-icon {
        background-color: var(--success);
        border-color: var(--success);
        color: white;
    }
    
    .timeline-item.active .timeline-icon {
        background-color: var(--primary);
        border-color: var(--primary);
        color: white;
        animation: pulse 2s infinite;
    }
    
    .timeline-content {
        background-color: white;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        border-left: 4px solid #e9ecef;
        transition: all 0.3s ease;
    }
    
    .timeline-item.completed .timeline-content {
        border-left-color: var(--success);
    }
    
    .timeline-item.active .timeline-content {
        border-left-color: var(--primary);
        transform: translateX(5px);
    }
    
    .timeline-title {
        font-weight: 600;
        margin-bottom: 8px;
        color: var(--dark);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    
    .timeline-item.completed .timeline-title {
        color: var(--success);
    }
    
    .timeline-item.active .timeline-title {
        color: var(--primary);
    }
    
    .timeline-date {
        font-size: 13px;
        color: var(--secondary);
        margin-bottom: 10px;
    }
    
    .timeline-description {
        font-size: 14px;
        color: var(--secondary);
        margin-bottom: 0;
    }
    
    .application-info {
        background-color: white;
        border-radius: 12px;
        padding: 25px;
        margin-bottom: 30px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    }
    
    .info-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 20px;
    }
    
    .info-item {
        display: flex;
        margin-bottom: 15px;
    }
    
    .info-label {
        font-weight: 600;
        min-width: 150px;
        color: #495057;
    }
    
    .info-value {
        color: #6c757d;
    }
    
    .status-badge {
        padding: 8px 16px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: 600;
    }
    
    .estimated-time {
        background: linear-gradient(135deg, var(--primary-light) 0%, #e6ebff 100%);
        border-radius: 12px;
        padding: 20px;
        margin-top: 30px;
        text-align: center;
    }
    
    .time-label {
        font-weight: 600;
        color: var(--primary);
        margin-bottom: 5px;
        font-size: 16px;
    }
    
    .time-value {
        color: var(--dark);
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 10px;
    }
    
    .help-section {
        background-color: white;
        border-radius: 12px;
        padding: 25px;
        margin-top: 30px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    }
    
    .help-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 20px;
    }
    
    .help-icon {
        background-color: var(--primary-light);
        color: var(--primary);
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 15px;
        flex-shrink: 0;
    }
    
    .help-content {
        flex-grow: 1;
    }
    
    .help-title {
        font-weight: 600;
        margin-bottom: 5px;
        color: var(--dark);
    }
    
    .help-description {
        color: var(--secondary);
        margin-bottom: 0;
    }
    
    @keyframes pulse {
        0% {
            box-shadow: 0 0 0 0 rgba(67, 94, 190, 0.4);
        }
        70% {
            box-shadow: 0 0 0 10px rgba(67, 94, 190, 0);
        }
        100% {
            box-shadow: 0 0 0 0 rgba(67, 94, 190, 0);
        }
    }
    
    .no-results {
        text-align: center;
        padding: 50px 20px;
    }
    
    .no-results-icon {
        font-size: 60px;
        color: #dee2e6;
        margin-bottom: 20px;
    }
    
    .application-status {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 20px;
    }
    
    .status-display {
        display: flex;
        align-items: center;
    }
    
    .status-text {
        font-weight: 600;
        margin-right: 10px;
    }
    
    .last-updated {
        color: var(--secondary);
        font-size: 14px;
    }
</style>
<main class="app-wrapper">
    <div class="container-fluid">
        <div class="main-breadcrumb d-flex align-items-center my-3 position-relative">
            <h2 class="breadcrumb-title mb-0 flex-grow-1 fs-14">Track Application</h2>
            <div class="flex-shrink-0">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-end mb-0">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Track Application</a></li>
                        <li class="breadcrumb-item active" aria-current="page">View Application Status</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="tracker-card">
            <div class="card-header text-center">
                <h2 class="card-title"><i class="ri-progress-1-line me-2"></i>Lease Application Tracker</h2>
                <p class="mb-0">Track the status of your lease application in real-time</p>
            </div>
            
            <div class="card-body">
                <!-- Search Section -->
                <div class="search-section">
                    <h4 class="mb-4">Enter Your Application ID</h4>
                    <div class="row">
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-lg" id="applicationIdInput" placeholder="e.g. LA-1025">
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-primary btn-lg w-100" onclick="trackApplication()">
                                <i class="ri-search-line me-2"></i>Track Application
                            </button>
                        </div>
                    </div>
                    <div class="form-text mt-2">You can find your Application ID in the confirmation email we sent you.</div>
                </div>
                
                <!-- Results Section (initially hidden) -->
                <div id="resultsSection" style="display: none;">
                    <!-- Application Status -->
                    <div class="application-status ps-4 pe-4">
                        <div class="status-display">
                            <span class="status-text">Current Status:</span>
                            <span class="badge bg-warning status-badge" id="overallStatus">Under Review</span>
                        </div>
                        <div class="last-updated" id="lastUpdated">Last updated: Sept 25, 2023</div>
                    </div>
                    
                    <!-- Application Information -->
                    <div class="application-info">
                        <h5 class="mb-4">Application Details</h5>
                        <div class="info-grid">
                            <div>
                                <div class="info-item">
                                    <span class="info-label">Application ID:</span>
                                    <span class="info-value" id="appId">LA-1025</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Applicant:</span>
                                    <span class="info-value" id="appApplicant">Emmanuel Oppong</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Submitted:</span>
                                    <span class="info-value" id="appSubmitted">Sept 18, 2023</span>
                                </div>
                            </div>
                            <div>
                                <div class="info-item">
                                    <span class="info-label">Parcel ID:</span>
                                    <span class="info-value" id="appParcel">R3013</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Land Use:</span>
                                    <span class="info-value" id="appLandUse">Residential</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Size:</span>
                                    <span class="info-value" id="appSize">0.161 acres</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Tracking Timeline -->
                    <h5 class="mb-4 ps-4">Application Progress</h5>
                    <div class="tracking-timeline">
                        <div class="timeline-progress">
                            <div class="progress-bar" id="timelineProgress" style="height: 60%;"></div>
                        </div>
                        
                        <!-- Milestone 1 -->
                        <div class="timeline-item completed">
                            <div class="timeline-icon">
                                <i class="ri-check-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">
                                    Application Submitted
                                    <span class="badge bg-success">Completed</span>
                                </h6>
                                <div class="timeline-date">Sept 18, 2023 • 10:30 AM</div>
                                <p class="timeline-description">Your lease application has been successfully submitted and received.</p>
                            </div>
                        </div>
                        
                        <!-- Milestone 2 -->
                        <div class="timeline-item completed">
                            <div class="timeline-icon">
                                <i class="ri-check-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">
                                    Initial Screening
                                    <span class="badge bg-success">Completed</span>
                                </h6>
                                <div class="timeline-date">Sept 20, 2023 • 2:15 PM</div>
                                <p class="timeline-description">Application passed initial completeness check and documentation review.</p>
                            </div>
                        </div>
                        
                        <!-- Milestone 3 -->
                        <div class="timeline-item completed">
                            <div class="timeline-icon">
                                <i class="ri-check-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">
                                    Site Evaluation
                                    <span class="badge bg-success">Completed</span>
                                </h6>
                                <div class="timeline-date">Sept 25, 2023 • 9:45 AM</div>
                                <p class="timeline-description">Parcel inspection completed. No issues found with the property.</p>
                            </div>
                        </div>
                        
                        <!-- Milestone 4 -->
                        <div class="timeline-item active">
                            <div class="timeline-icon">
                                <i class="ri-loader-4-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">
                                    Zoning Approval
                                    <span class="badge bg-primary">In Progress</span>
                                </h6>
                                <div class="timeline-date">Estimated completion: Oct 2, 2023</div>
                                <p class="timeline-description">Awaiting zoning compliance verification from planning department.</p>
                            </div>
                        </div>
                        
                        <!-- Milestone 5 -->
                        <div class="timeline-item">
                            <div class="timeline-icon">
                                <i class="ri-time-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">
                                    Environmental Review
                                    <span class="badge bg-secondary">Pending</span>
                                </h6>
                                <div class="timeline-date">Not yet started</div>
                                <p class="timeline-description">Environmental impact assessment will be conducted after zoning approval.</p>
                            </div>
                        </div>
                        
                        <!-- Milestone 6 -->
                        <div class="timeline-item">
                            <div class="timeline-icon">
                                <i class="ri-time-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">
                                    Final Approval
                                    <span class="badge bg-secondary">Pending</span>
                                </h6>
                                <div class="timeline-date">Not yet started</div>
                                <p class="timeline-description">Lease agreement preparation and final sign-off.</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Estimated Completion -->
                    <div class="estimated-time">
                        <div class="time-label">Estimated Completion Time</div>
                        <div class="time-value" id="completionTime">15-20 Business Days</div>
                        <small class="text-muted">Based on current progress and typical processing times</small>
                    </div>
                    
                    <!-- Help Section -->
                    <div class="help-section">
                        <h5 class="mb-4">Need Help?</h5>
                        <div class="help-item">
                            <div class="help-icon">
                                <i class="ri-question-line"></i>
                            </div>
                            <div class="help-content">
                                <div class="help-title">What does this status mean?</div>
                                <p class="help-description">Your application is currently being reviewed by the zoning department. This typically takes 5-7 business days.</p>
                            </div>
                        </div>
                        <div class="help-item">
                            <div class="help-icon">
                                <i class="ri-phone-line"></i>
                            </div>
                            <div class="help-content">
                                <div class="help-title">Contact Support</div>
                                <p class="help-description">Have questions? Call our support team at (233) 123-4567 or email support@landlease.gov.gh</p>
                            </div>
                        </div>
                        <div class="help-item">
                            <div class="help-icon">
                                <i class="ri-calendar-event-line"></i>
                            </div>
                            <div class="help-content">
                                <div class="help-title">Check back later</div>
                                <p class="help-description">Status updates are made in real-time. Check back regularly for the latest information on your application.</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- No Results Message (initially hidden) -->
                <div id="noResults" class="no-results" style="display: none;">
                    <div class="no-results-icon">
                        <i class="ri-search-eye-line"></i>
                    </div>
                    <h4>Application Not Found</h4>
                    <p class="text-muted">We couldn't find an application with that ID. Please check your Application ID and try again.</p>
                    <button class="btn btn-outline-primary" onclick="resetSearch()">
                        <i class="ri-arrow-go-back-line me-2"></i>Try Again
                    </button>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    // Sample application data
    const applications = {
        "LA-1025": {
            id: "LA-1025",
            applicant: "Emmanuel Oppong",
            parcel: "R3013",
            landUse: "Residential",
            size: "0.161 acres",
            submittedDate: "Sept 18, 2023",
            status: "under_review",
            lastUpdated: "Sept 25, 2023",
            progress: 60,
            completionEstimate: "15-20 Business Days",
            milestones: [
                {
                    title: "Application Submitted",
                    status: "completed",
                    date: "Sept 18, 2023 • 10:30 AM",
                    description: "Your lease application has been successfully submitted and received."
                },
                {
                    title: "Initial Screening",
                    status: "completed",
                    date: "Sept 20, 2023 • 2:15 PM",
                    description: "Application passed initial completeness check and documentation review."
                },
                {
                    title: "Site Evaluation",
                    status: "completed",
                    date: "Sept 25, 2023 • 9:45 AM",
                    description: "Parcel inspection completed. No issues found with the property."
                },
                {
                    title: "Zoning Approval",
                    status: "active",
                    date: "Estimated completion: Oct 2, 2023",
                    description: "Awaiting zoning compliance verification from planning department."
                },
                {
                    title: "Environmental Review",
                    status: "pending",
                    date: "Not yet started",
                    description: "Environmental impact assessment will be conducted after zoning approval."
                },
                {
                    title: "Final Approval",
                    status: "pending",
                    date: "Not yet started",
                    description: "Lease agreement preparation and final sign-off."
                }
            ]
        },
        "LA-1026": {
            id: "LA-1026",
            applicant: "Kwame Mensah",
            parcel: "C4552",
            landUse: "Commercial",
            size: "0.245 acres",
            submittedDate: "Sept 15, 2023",
            status: "approved",
            lastUpdated: "Oct 1, 2023",
            progress: 100,
            completionEstimate: "Completed",
            milestones: [
                {
                    title: "Application Submitted",
                    status: "completed",
                    date: "Sept 15, 2023 • 9:15 AM",
                    description: "Your lease application has been successfully submitted and received."
                },
                {
                    title: "Initial Screening",
                    status: "completed",
                    date: "Sept 17, 2023 • 11:30 AM",
                    description: "Application passed initial completeness check."
                },
                {
                    title: "Site Evaluation",
                    status: "completed",
                    date: "Sept 22, 2023 • 3:20 PM",
                    description: "Parcel inspection completed successfully."
                },
                {
                    title: "Zoning Approval",
                    status: "completed",
                    date: "Sept 28, 2023 • 10:45 AM",
                    description: "Zoning compliance verification completed."
                },
                {
                    title: "Environmental Review",
                    status: "completed",
                    date: "Sept 30, 2023 • 4:10 PM",
                    description: "Environmental impact assessment passed."
                },
                {
                    title: "Final Approval",
                    status: "completed",
                    date: "Oct 1, 2023 • 11:20 AM",
                    description: "Lease agreement finalized and approved."
                }
            ]
        }
    };

    function trackApplication() {
        const applicationId = document.getElementById('applicationIdInput').value.trim().toUpperCase();
        const resultsSection = document.getElementById('resultsSection');
        const noResults = document.getElementById('noResults');
        
        if (applications[applicationId]) {
            // Application found - display results
            displayApplicationInfo(applications[applicationId]);
            resultsSection.style.display = 'block';
            noResults.style.display = 'none';
        } else {
            // Application not found - show error
            resultsSection.style.display = 'none';
            noResults.style.display = 'block';
        }
    }

    function displayApplicationInfo(app) {
        // Update basic info
        document.getElementById('overallStatus').textContent = getStatusText(app.status);
        document.getElementById('overallStatus').className = `badge `+getStatusClass(app.status)+` status-badge`;
        document.getElementById('lastUpdated').textContent = `Last updated: `+app.lastUpdated;
        document.getElementById('appId').textContent = app.id;
        document.getElementById('appApplicant').textContent = app.applicant;
        document.getElementById('appSubmitted').textContent = app.submittedDate;
        document.getElementById('appParcel').textContent = app.parcel;
        document.getElementById('appLandUse').textContent = app.landUse;
        document.getElementById('appSize').textContent = app.size;
        document.getElementById('completionTime').textContent = app.completionEstimate;
        
        // Update progress bar
        document.getElementById('timelineProgress').style.height = app.progress+'%';
        
        // Update milestones
        const timeline = document.querySelector('.tracking-timeline');
        // Remove existing milestones (except the progress bar)
        const progressBar = timeline.querySelector('.timeline-progress');
        timeline.innerHTML = '';
        timeline.appendChild(progressBar);
        
        // Add milestones
        app.milestones.forEach(milestone => {
            const milestoneElement = createMilestoneElement(milestone);
            timeline.appendChild(milestoneElement);
        });
    }

    function createMilestoneElement(milestone) {
        const item = document.createElement('div');
        item.className = `timeline-item `+milestone.status;
        
        let iconClass, badgeClass, badgeText;
        switch(milestone.status) {
            case 'completed':
                iconClass = 'ri-check-line';
                badgeClass = 'bg-success';
                badgeText = 'Completed';
                break;
            case 'active':
                iconClass = 'ri-loader-4-line';
                badgeClass = 'bg-primary';
                badgeText = 'In Progress';
                break;
            default:
                iconClass = 'ri-time-line';
                badgeClass = 'bg-secondary';
                badgeText = 'Pending';
        }
        
        item.innerHTML = `
            <div class="timeline-icon">
                <i class="`+iconClass+`"></i>
            </div>
            <div class="timeline-content">
                <h6 class="timeline-title">
                    `+milestone.title+`
                    <span class="badge `+badgeClass+`">`+badgeText+`</span>
                </h6>
                <div class="timeline-date">`+milestone.date+`</div>
                <p class="timeline-description">`+milestone.description+`</p>
            </div>
        `;
        
        return item;
    }

    function getStatusText(status) {
        switch(status) {
            case 'pending': return 'Pending';
            case 'under_review': return 'Under Review';
            case 'approved': return 'Approved';
            case 'rejected': return 'Rejected';
            default: return 'Unknown';
        }
    }

    function getStatusClass(status) {
        switch(status) {
            case 'pending': return 'bg-secondary';
            case 'under_review': return 'bg-warning';
            case 'approved': return 'bg-success';
            case 'rejected': return 'bg-danger';
            default: return 'bg-secondary';
        }
    }

    function resetSearch() {
        document.getElementById('applicationIdInput').value = '';
        document.getElementById('resultsSection').style.display = 'none';
        document.getElementById('noResults').style.display = 'none';
    }

    // Allow pressing Enter to search
    document.getElementById('applicationIdInput').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            trackApplication();
        }
    });
</script>