<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade modal-blur" id="addUserModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content shadow-lg border-0 rounded-3">
            
            <!-- Header -->
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="addUserModalLabel">
                    <i class="fas fa-user-plus me-2"></i> Update Profile
                </h5>
                <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
            </div>

            <!-- Body -->
            <div class="modal-body p-4">
                <div class="alert alert-subtle-danger alert-dismissible fade show rounded-pill d-flex align-items-center small mb-4" role="alert">
                    <i class="bi bi-exclamation-circle-fill me-2"></i>
                    Please update your profile information.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <form id="addUserForm" data-user-id="" data-is-edit="false">

                    <!-- Section: Personal Info -->
                    <h6 class="text-primary fw-bold mb-3"><i class="mdi mdi-account me-1"></i> Personal Information</h6>
                    <div class="row g-3">
                        <div class="col-md-2">
                            <label for="title" class="form-label">Title <span class="text-danger">*</span></label>
                            <select class="form-select" id="title" name="title" required>
                            <option value="" disabled selected>Select</option>
                            <option value="Mr.">Mr.</option>
                            <option value="Ms.">Ms.</option>
                            <option value="Mrs.">Mrs.</option>
                            <option value="Dr.">Dr.</option>
                            <option value="Prof.">Prof.</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="first_name" class="form-label">First Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="first_name" name="first_name" value="${userInfo.first_name}" required>
                        </div>
                        <div class="col-md-6">
                            <label for="last_name" class="form-label">Last Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="last_name" name="last_name" value="${userInfo.last_name}" required>
                        </div>
                    </div>

                    <div class="row g-3 mt-1">
                        <div class="col-md-6">
                            <label for="middle_name" class="form-label">Middle Name(s)</label>
                            <input type="text" class="form-control" id="middle_name" name="middle_name" value="${userInfo.middle_name}">
                        </div>
                        <div class="col-md-6">
                            <label for="dob" class="form-label">Date of Birth <span class="text-danger">*</span></label>
                            <input type="date" class="form-control" id="dob" name="dob" value="${userInfo.dob}">
                        </div>
                    </div>

                    <div class="row g-3 mt-1">
                        <div class="col-md-6">
                            <label for="gender" class="form-label">Gender <span class="text-danger">*</span></label>
                            <select class="form-select" id="gender" name="gender" required>
                            <option value="" disabled selected>Select</option>
                            <option>Male</option>
                            <option>Female</option>
                            </select>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Section: Account Info -->
                    <!-- <h6 class="text-primary fw-bold mb-3"><i class="mdi mdi-key me-1"></i> Account Information</h6>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="username" class="form-label">Username <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="username" name="username" value="${userInfo.username}" required readonly>
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" id="email" name="email" value="${userInfo.email}" required readonly>
                        </div>
                    </div>

                    <div class="row g-3 mt-1">
                        <div class="col-md-6">
                            <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="col-md-6">
                            <label for="confirm_password" class="form-label">Confirm Password <span class="text-danger">*</span></label>
                            <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                        </div>
                    </div>

                    <hr class="my-4"> -->

                    <!-- Section: Contact Info -->
                    <h6 class="text-primary fw-bold mb-3"><i class="mdi mdi-contacts me-1"></i> Contact Information</h6>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="phone_number" class="form-label">Phone Number <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <select class="form-select flex-grow-0 w-auto" id="country_code" name="country_code">
                                    <option value="+233">+233</option>
                                </select>
                                <input type="text" class="form-control" placeholder="Enter phone number" id="phone_number" name="phone_number" value="${userInfo.phone_number}" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="country" class="form-label">Country <span class="text-danger">*</span></label>
                            <!-- <input type="text" class="form-control" id="country" name="country" value="Ghana" required> -->
                            <select class="form-select" id="country" name="country" required>
                                <option value="Ghana" selected>Ghana</option>
                                <option value="USA">USA</option>
                            </select>
                        </div>
                    </div>

                    <div class="row g-3 mt-1">
                        <div class="col-md-6">
                            <label for="address" class="form-label">Address <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="address" name="address" value="${userInfo.address}" required>
                        </div>
                        <div class="col-md-6">
                            <label for="zip_code" class="form-label">Zip Code</label>
                            <input type="text" class="form-control" id="zip_code" value="${userInfo.zip_code != null ? userInfo.zip_code : '00233'}" name="zip_code">
                        </div>
                    </div>

                    <div class="row g-3 mt-1">
                        <div class="col-md-6">
                            <label for="city" class="form-label">City <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="city" name="city" value="${userInfo.city}" required>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Section: Security -->
                    <h6 class="text-primary fw-bold mb-3"><i class="mdi mdi-shield-half-full me-1"></i> Security Settings</h6>
                    <div class="row mb-2 m-1" style="border-radius: 15px; background-color: var(--pe-secondary-bg-subtle);">
                        <div class="col-6 mt-4 mb-4">
                            <div class="label-01">2 Factor Authentication</div>
                            <div class="small text-muted">Two-factor authentication is an enhanced security measure. Once enabled, you'll be required to give one type of identification when you log into</div>
                        </div>
                        <div class="col-6 mt-4 mb-4">
                            <div class="form-check form-switch mb-2">
                                <input class="form-check-input two_factor" type="checkbox" id="two_factor" checked>
                                <label class="form-check-label" for="two_factor">Enable Two-Factor Authentication (SMS)</label>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input email_auth" type="checkbox" id="email_auth">
                                <label class="form-check-label" for="email_auth">Enable Email Authentication</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-2 m-1" style="border-radius: 15px; background-color: var(--pe-secondary-bg-subtle);">
                        <div class="col-6 mt-4 mb-4">
                            <div class="label">Login Notification</div>
                            <div class="small text-muted">Stay informed about account activity. When enabled, you'll receive a notification whenever a login is detected on your account.</div>
                        </div>
                        <div class="col-6 mt-4 mb-4">
                            <div class="form-check form-switch mb-3">
                                <input class="form-check-input login_notifications" type="checkbox" id="login_notifications" checked>
                                <label class="form-check-label" for="login_notifications">Enable Login Notifications</label>
                            </div>
                        </div>
                    </div>

                </form>
            </div>

            <!-- Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submitUserForm">Update User</button>
            </div>

        </div>
    </div>
</div>

<!-- Cancel Appointment Modal -->
<div class="modal fade modal-blur" id="cancelAppointmentModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Cancel Appointment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to cancel this appointment?</p>
                <div class="appointment-details mb-3 p-3 bg-light rounded">
                    <h6 id="cancelAppointmentTitle" class="mb-2"></h6>
                    <div class="text-muted small" id="cancelAppointmentTime"></div>
                    <div class="text-muted small" id="cancelAppointmentProvider"></div>
                </div>
                <div class="mb-3">
                    <label for="cancellationReason" class="form-label">Reason for cancellation (optional):</label>
                    <textarea class="form-control" id="cancellationReason" rows="3" placeholder="Please provide a reason for cancellation..."></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Keep Appointment</button>
                <button type="button" class="btn btn-warning" id="confirmCancelBtn">Cancel Appointment</button>
            </div>
        </div>
    </div>
</div>

<!-- Appointment Details Modal -->
<div class="modal fade modal-blur" id="appointmentDetailsModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="appointmentDetailsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Appointment Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="appointment-info mb-4">
                    <h6 class="text-primary mb-3" id="detailAppointmentType"></h6>
                    <div class="row mb-2">
                        <div class="col-4 fw-bold">Date & Time:</div>
                        <div class="col-8" id="detailDateTime"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 fw-bold">Provider:</div>
                        <div class="col-8" id="detailProvider"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 fw-bold">Status:</div>
                        <div class="col-8">
                            <span class="badge" id="detailStatusBadge"></span>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 fw-bold">Duration:</div>
                        <div class="col-8" id="detailDuration"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 fw-bold">Created:</div>
                        <div class="col-8" id="detailCreated"></div>
                    </div>
                </div>
                
                <div class="notes-section mb-3">
                    <h6 class="mb-2">Notes:</h6>
                    <div class="bg-light p-3 rounded" id="detailNotes">
                        <em class="text-muted">No notes provided</em>
                    </div>
                </div>
                
                <div id="cancellationInfo" class="cancellation-info mt-3 p-3 bg-light rounded" style="display: none;">
                    <h6 class="text-danger mb-2">Cancellation Information</h6>
                    <div class="small" id="detailCancelledAt"></div>
                    <div class="small" id="detailCancellationReason"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-warning" id="detailCancelBtn" style="display: none;">
                    <i class="bi bi-x-circle"></i> Cancel Appointment
                </button>
                <button type="button" class="btn btn-primary" id="detailRescheduleBtn" style="display: none;">
                    <i class="bi bi-calendar-event"></i> Reschedule
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal-blur" id="trackingModal" tabindex="-1" aria-labelledby="trackingModalLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="trackingModalLabel">
                        <i class="ri-progress-1-line me-2"></i>Application Status Tracking
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body small">
                    <!-- Application Information -->
                    <div class="application-info">
                        <h6 class="mb-3">Application Details</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="info-item">
                                    <span class="info-label">Application ID:</span>
                                    <span class="info-value">LAP-23425430032025</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Applicant:</span>
                                    <span class="info-value">Mr. Emmanuel Oppong</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Parcel ID:</span>
                                    <span class="info-value">R1203</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="info-item">
                                    <span class="info-label">Submitted:</span>
                                    <span class="info-value">Sept 17, 2025</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Land Use:</span>
                                    <span class="info-value">Residential</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Status:</span>
                                    <span class="info-value"><span class="badge bg-warning status-badge">Under Review</span></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Tracking Timeline -->
                    <h6 class="mb-3">Application Progress</h6>
                    <div class="tracking-timeline">
                        <div class="timeline-progress">
                            <div class="progress-bar" style="height: 60%;"></div>
                        </div>
                        
                        <!-- Milestone 1 -->
                        <div class="timeline-item completed">
                            <div class="timeline-icon">
                                <i class="ri-check-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">Application Submitted</h6>
                                <div class="timeline-date">Sept 18, 2023 - 10:30 AM</div>
                                <p class="timeline-description">Your lease application has been successfully submitted and received.</p>
                            </div>
                        </div>
                        
                        <!-- Milestone 2 -->
                        <div class="timeline-item completed">
                            <div class="timeline-icon">
                                <i class="ri-check-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">Initial Screening</h6>
                                <div class="timeline-date">Sept 20, 2023 - 2:15 PM</div>
                                <p class="timeline-description">Application passed initial completeness check and documentation review.</p>
                            </div>
                        </div>
                        
                        <!-- Milestone 3 -->
                        <div class="timeline-item completed">
                            <div class="timeline-icon">
                                <i class="ri-check-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">Site Evaluation</h6>
                                <div class="timeline-date">Sept 25, 2023 - 9:45 AM</div>
                                <p class="timeline-description">Parcel inspection completed. No issues found with the property.</p>
                            </div>
                        </div>
                        
                        <!-- Milestone 4 -->
                        <div class="timeline-item active">
                            <div class="timeline-icon">
                                <i class="ri-loader-4-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">Zoning Approval</h6>
                                <div class="timeline-date">In progress</div>
                                <p class="timeline-description">Awaiting zoning compliance verification from planning department.</p>
                            </div>
                        </div>
                        
                        <!-- Milestone 5 -->
                        <div class="timeline-item">
                            <div class="timeline-icon">
                                <i class="ri-time-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">Environmental Review</h6>
                                <div class="timeline-date">Pending</div>
                                <p class="timeline-description">Environmental impact assessment will be conducted.</p>
                            </div>
                        </div>
                        
                        <!-- Milestone 6 -->
                        <div class="timeline-item">
                            <div class="timeline-icon">
                                <i class="ri-time-line"></i>
                            </div>
                            <div class="timeline-content">
                                <h6 class="timeline-title">Final Approval</h6>
                                <div class="timeline-date">Pending</div>
                                <p class="timeline-description">Lease agreement preparation and final sign-off.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Estimated Completion -->
                    <div class="estimated-time">
                        <div class="time-label">Estimated Completion Time</div>
                        <div class="time-value">15-20 Business Days</div>
                        <small class="text-muted">Based on current progress and typical processing times</small>
                    </div>
                </div>
                <!-- <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-download">
                        <i class="ri-download-line me-2"></i>Download Progress Report
                    </button>
                </div> -->
            </div>
        </div>
    </div>