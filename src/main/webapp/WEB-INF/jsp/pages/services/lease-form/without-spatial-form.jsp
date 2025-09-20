<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    :root {
        --primary: #435ebe;
        --primary-light: #eef2ff;
        --secondary: #6c757d;
        --success: #198754;
        --light: #f8f9fa;
        --dark: #212529;
        --card-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        --transition: all 0.3s ease;
    }
/*     
    .custom-stepper {
        position: relative;
        padding: 0 80px;
        margin-bottom: 40px;
    } */
    
    .btn-success {
        border-radius: 10px;
        padding: 12px 24px;
        font-weight: 500;
        transition: var(--transition);
        background: linear-gradient(120deg, var(--success), #20c374);
        border: none;
    }
    
    .btn-success:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(25, 135, 84, 0.3);
    }
    
    .info-item {
        display: flex;
        margin-bottom: 10px;
    }
    
    .info-label {
        font-weight: 600;
        min-width: 140px;
        color: #495057;
    }

    .info-value {
        color: #6c757d;
    }
    
    .application-summary {
        background-color: #f8f9fa;
        border-radius: 12px;
        padding: 25px;
    }
    
    .summary-section {
        margin-bottom: 25px;
    }
    
    .summary-section h6 {
        color: var(--primary);
        padding-bottom: 10px;
        border-bottom: 2px solid #e9ecef;
        margin-bottom: 15px;
        font-weight: 600;
    }
    
    .thank-you-container {
        background: linear-gradient(135deg, #f5f7fb 0%, #eef2ff 100%);
        border-radius: 16px;
        padding: 40px;
        text-align: center;
    }
    
    .thank-you-icon {
        font-size: 4rem;
        color: var(--success);
        margin-bottom: 20px;
    }
    
    .step-title {
        color: var(--primary);
        font-weight: 600;
        margin-bottom: 5px;
    }
    
    .step-subtitle {
        color: #6c757d;
        margin-bottom: 25px;
    }
    
    .section-divider {
        height: 1px;
        background: linear-gradient(90deg, transparent, #dee2e6, transparent);
        margin: 25px 0;
    }
</style>
<main class="app-wrapper">
    <div class="container-fluid">
        <div class="main-breadcrumb d-flex align-items-center my-3 position-relative">
            <h2 class="breadcrumb-title mb-0 flex-grow-1 fs-14">Lease Application</h2>
            <div class="flex-shrink-0">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-end mb-0">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Lease Application</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Application Process</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card card-h-100">
                    <!-- <div class="card-header">
                        <h5 class="card-title mb-0">Lease Application Process</h5>
                    </div> -->
                    <div class="card-body">
                        <!-- <p class="text-muted mb-4">Create a basic date picker by initializing Flatpickr with
                            <code>flatpickr("#basic-picker")</code> to allow users to select a single date from a
                            calendar.
                        </p> -->
                        <div class="stepper">
                            <form action="#" class="form-steps" autocomplete="off">
                                <div class="text-center pt-3 pb-4 mb-1">
                                    <h3>Application Process</h3>
                                </div>
                                <div class="custom-stepper mb-4">
                                    <div class="progress progress-xs">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
                                    </div>

                                    <ul class="nav nav-pills" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link rounded-circle p-0 avatar-md active" type="button" data-tab="0">1</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link rounded-circle p-0 avatar-md" type="button" data-tab="1">2</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link rounded-circle p-0 avatar-md" type="button" data-tab="2">3</button>
                                        </li>
                                    </ul>
                                </div>

                                <div class="tab-content">
                                    <!-- Step 1: Parcel Details -->
                                    <div class="tab-pane fade show active" data-tab="0">
                                        <h4 class="step-title">Confirm Parcel Details</h4>
                                        <p class="step-subtitle">Review the selected parcel information</p>
                                        
                                        <div class="application-summary">
                                            <h6><i class="ri-map-pin-line me-2"></i>Parcel Information</h6>
                                            <div class="info-item">
                                                <span class="info-label">Plot Number:</span>
                                                <span class="info-value" id="parcel-serial">${parcelInfo.serial_no}</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Land Use:</span>
                                                <span class="info-value" id="parcel-landuse">${parcelInfo.land_use}</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Acreage:</span>
                                                <span class="info-value" id="parcel-acreage">${parcelInfo.acreage} Acres</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Allocation Status:</span>
                                                <span class="badge bg-success rounded-pill" id="parcel-status">Available</span>
                                            </div>
                                        </div>
                                        
                                        <div class="application-summary mt-4">
                                            <h6><i class="ri-information-line me-2"></i>Additional Details</h6>
                                            <div class="info-item">
                                                <span class="info-label">Block/Plot:</span>
                                                <span class="info-value" id="parcel-blockplot">${parcelInfo.ser_blkno}</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Style:</span>
                                                <span class="info-value" id="parcel-style">${parcelInfo.style}</span>
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex align-items-start justify-content-end gap-3 mt-4">
                                            <button type="button" class="btn btn-primary nexttab">Continue</button>
                                        </div>
                                    </div>

                                    <!-- Step 2: User Information -->
                                    <div class="tab-pane fade" data-tab="1">
                                        <h4 class="step-title">Confirm Your Information</h4>
                                        <p class="step-subtitle">Please review and confirm your details</p>
                                        
                                        <div class="application-summary">
                                            <h6><i class="ri-user-line me-2"></i>Personal Information</h6>
                                            <div class="info-item">
                                                <span class="info-label">Full Name:</span>
                                                <span class="info-value" id="user-name">${userInfo.full_name}</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Email:</span>
                                                <span class="info-value" id="user-email">${userInfo.email}</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Phone:</span>
                                                <span class="info-value" id="user-phone">${userInfo.country_code} ${userInfo.phone_number}</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="info-label">Address:</span>
                                                <span class="info-value" id="user-address">${userInfo.address}</span>
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex align-items-start justify-content-between gap-3 mt-4">
                                            <button type="button" class="btn btn-outline-secondary previestab">Back</button>
                                            <button type="button" class="btn btn-primary nexttab">Continue to Review</button>
                                        </div>
                                    </div>

                                    <!-- Step 3: Application Summary -->
                                    <div class="tab-pane fade" data-tab="2">
                                        <h4 class="step-title">Application Summary</h4>
                                        <p class="step-subtitle">Please review your application before submitting</p>
                                        
                                        <div class="application-summary">
                                            <div class="summary-section">
                                                <h6>Applicant Information</h6>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="info-item">
                                                            <span class="info-label">Full Name:</span>
                                                            <span class="info-value">${userInfo.full_name}</span>
                                                        </div>
                                                        <div class="info-item">
                                                            <span class="info-label">Email:</span>
                                                            <span class="info-value">${userInfo.email}</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="info-item">
                                                            <span class="info-label">Phone:</span>
                                                            <span class="info-value">${userInfo.country_code} ${userInfo.phone_number}</span>
                                                        </div>
                                                        <div class="info-item">
                                                            <span class="info-label">Address:</span>
                                                            <span class="info-value">${userInfo.address}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="summary-section">
                                                <h6>Parcel Details</h6>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="info-item">
                                                            <span class="info-label">Plot Number:</span>
                                                            <span class="info-value">${parcelInfo.serial_no}</span>
                                                        </div>
                                                        <div class="info-item">
                                                            <span class="info-label">Land Use:</span>
                                                            <span class="info-value">${parcelInfo.land_use}</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="info-item">
                                                            <span class="info-label">Acreage:</span>
                                                            <span class="info-value">${parcelInfo.acreage} acres</span>
                                                        </div>
                                                        <div class="info-item">
                                                            <span class="info-label">Status:</span>
                                                            <span class="badge bg-success rounded-pill">Available</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="summary-section">
                                                <h6>Terms & Conditions</h6>
                                                <div class="form-check form-check-primary">
                                                    <input class="form-check-input" type="checkbox" id="termsCheck">
                                                    <label class="form-check-label" for="termsCheck">
                                                        I agree to the terms and conditions of the lease agreement
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex align-items-start justify-content-between gap-3 mt-4">
                                            <button type="button" class="btn btn-outline-secondary previestab">Back</button>
                                            <button type="button" class="btn btn-success nexttab" id="submitApplication">Submit Application</button>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade">
                                        <div class="border rounded p-4 text-center max-w-384px mx-auto">
                                           <div class="mb-4 text-center">
                                                <div class="mb-4 text-center">
                                                    <!-- <i class="fas fa-check-circle text-success pulse-icon" style="font-size: 4rem;"></i> -->
                                                    <img src="${pageContext.request.contextPath}/assets/images/success_icon_3.webp" class="pulse-icon" alt="user-image" width="60" />
                                                </div>
                                                <h5 class="mb-1">Thank You for Applying!</h5>
                                                <p class="text-muted">
                                                    We’ve received your lease application and our team will review it shortly.  
                                                    You’ll be notified once there are updates.
                                                </p>
                                            </div>
                                            <div class="d-flex justify-content-center mt-4">
                                                <a href="${pageContext.request.contextPath}/lease_application" class="btn btn-success">Go to Subimtted Application</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    document.querySelectorAll('.stepper, .form-steps-vertical').forEach(stepper => {
        const nextButtons = stepper.querySelectorAll('.nexttab');
        const prevButtons = stepper.querySelectorAll('.previestab');
        const tabs = stepper.querySelectorAll('.tab-pane');
        const progressBar = stepper.querySelector('.progress-bar');
        const tabButtons = stepper.querySelectorAll('.nav-link'); // Get all tab buttons
        let currentTab = 0;

        function updateTabs() {
            tabs.forEach((tab, index) => {
                tab.classList.remove('show', 'active');
                if (index === currentTab) {
                    tab.classList.add('show', 'active');
                }
            });

            // Determine if the stepper is vertical or horizontal
            const isVertical = stepper.classList.contains('form-steps-vertical');

            if (isVertical) {
                // Update progress bar height based on completed steps for vertical stepper
                const completedSteps = Math.min(currentTab, tabs.length - 1);
                const totalSteps = tabs.length - 2; // Excluding the last "Thank You" step
                const progressHeight = (completedSteps / totalSteps) * 100;
                progressBar.style.height = progressHeight+'%';
                progressBar.style.width = '100%'; // Ensure width is full
            } else {
                // Update progress bar width based on currentTab for horizontal stepper
                const progressPercentage = (currentTab / (tabs.length - 2)) * 100; // Excluding last step
                progressBar.style.width = progressPercentage+'%';
                progressBar.style.height = '5px'; // Default height for horizontal
            }

            // Update the active tab button
            tabButtons.forEach((button, index) => {
                button.classList.remove('active', 'activeComplete');
                if (index === currentTab) {
                    button.classList.add('active');
                } else if (index < currentTab) {
                    button.classList.add('activeComplete');
                    button.innerHTML = `<i class="ri-check-line"></i>`; // Add check icon
                }
            });
        }

        nextButtons.forEach(button => {
            button.addEventListener('click', () => {
                if (currentTab < tabs.length - 1) {
                    currentTab++;
                    updateTabs();
                }
            });
        });

        prevButtons.forEach(button => {
            button.addEventListener('click', () => {
                if (currentTab > 0) {
                    currentTab--;
                    updateTabs();
                }
            });
        });

        // Initial setup
        updateTabs();
    });
</script>