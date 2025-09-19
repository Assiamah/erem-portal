<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main class="app-wrapper">
    <div class="container-fluid">

        <div class="main-breadcrumb d-flex align-items-center my-3 position-relative">
            <h2 class="breadcrumb-title mb-0 flex-grow-1 fs-14">Manage Appointments</h2>
            <div class="flex-shrink-0">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-end mb-0">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Appointments</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Manage Appointments</li>
                    </ol>
                </nav>
            </div>
        </div>
        
        <div class="row">
            <!-- <div class="col-12"> -->
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="card-title mb-0">Calendar View</h5>
                            <div class="d-flex gap-2">
                                <button class="btn btn-sm btn-outline-primary" id="todayBtn">Today</button>
                                <div class="btn-group">
                                    <button class="btn btn-sm btn-outline-secondary" id="prevBtn"><i class="bi bi-chevron-left"></i></button>
                                    <button class="btn btn-sm btn-outline-secondary" id="nextBtn"><i class="bi bi-chevron-right"></i></button>
                                </div>
                                <select class="form-select form-select-sm" id="viewSelector">
                                    <option value="dayGridMonth">Month</option>
                                    <option value="timeGridWeek" selected>Week</option>
                                    <option value="timeGridDay">Day</option>
                                    <option value="listWeek">List</option>
                                </select>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="calendar"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <!-- Client Appointment List -->
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="card-title mb-0">My Appointments</h5>
                            <button class="btn btn-sm btn-outline-primary" id="refreshAppointmentsBtn">
                                <i class="bi bi-arrow-clockwise"></i>
                            </button>
                        </div>
                        <div class="card-body p-0">
                            <div class="appointment-filter mb-3 p-3 border-bottom">
                                <div class="input-group input-group-sm">
                                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                                    <input type="text" class="form-control" placeholder="Search appointments..." id="appointmentSearch">
                                </div>
                                <div class="mt-2">
                                    <select class="form-select form-select-sm" id="appointmentFilter">
                                        <option value="all">All Appointments</option>
                                        <option value="scheduled">Scheduled</option>
                                        <option value="confirmed">Confirmed</option>
                                        <option value="completed">Completed</option>
                                        <option value="cancelled">Cancelled</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="appointment-list" style="max-height: 600px; overflow-y: auto;" id="appointmentList">
                                <div class="text-center p-4">
                                    <div class="spinner-border spinner-border-sm" role="status">
                                        <span class="visually-hidden">Loading...</span>
                                    </div>
                                    <p class="mt-2 text-muted">Loading appointments...</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Upcoming Appointments Card -->
                    <div class="card mt-3">
                        <div class="card-header">
                            <h6 class="card-title mb-0">Upcoming Appointments</h6>
                        </div>
                        <div class="card-body p-0">
                            <div class="upcoming-list" style="max-height: 300px; overflow-y: auto;" id="upcomingAppointments">
                                <div class="text-center p-3">
                                    <div class="spinner-border spinner-border-sm" role="status">
                                        <span class="visually-hidden">Loading...</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- </div> -->
        </div>

    </div>

    <!-- Submit Section -->
</main>


<script>
document.addEventListener('DOMContentLoaded', function() {
    // Initialize calendar
    const calendarEl = document.getElementById('calendar');
    const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        height: 800,
        expandRows: true,  
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        events: '/api/appointments/slots',
        editable: true,
        selectable: true,
        selectMirror: true,
        dayMaxEvents: true,
        validRange: {
            start: new Date() // prevents selection before today
        },
        // select: function(info) {
        //     $('#createAppointmentModal').modal('show');
        //     $('#slotDate').val(info.startStr.substring(0, 10));
        //     $('#startTime').val(info.startStr.substring(11, 16));
        //     $('#endTime').val(info.endStr.substring(11, 16));
        // },
        eventClick: function(info) {
            scheduleAppointment(info.event);
        }
    });
    calendar.render();

    // Navigation controls
    document.getElementById('todayBtn').addEventListener('click', function() {
        calendar.today();
    });
    
    document.getElementById('prevBtn').addEventListener('click', function() {
        calendar.prev();
    });
    
    document.getElementById('nextBtn').addEventListener('click', function() {
        calendar.next();
    });
    
    document.getElementById('viewSelector').addEventListener('change', function() {
        calendar.changeView(this.value);
    });

    function scheduleAppointment(event) {

        console.log(event);
        const appointmentProps = event._def.extendedProps;

        const slotID = event._def.publicId

        // console.log(appointmentProps.is_available)

        // console.log("Slot Data:", event);

        // console.log(event.start)
        const startDate = event.start;   // JS Date object
        const endDate   = event.end;     // JS Date object

        // formatted strings (ISO 8601 from FullCalendar)
        const startStr = event.startStr; // "2025-09-20T09:00:00+00:00"
        const endStr   = event.endStr;   // "2025-09-20T10:00:00+00:00"

        // if you just want date part
        const dateOnly = (startDate.getMonth() + 1).toString().padStart(2, '0') + '/' +
                    startDate.getDate().toString().padStart(2, '0') + '/' +
                    startDate.getFullYear();

        // pretty format (local time)
        const startTime = startDate.toLocaleTimeString([], { 
            hour: 'numeric', 
            minute: '2-digit', 
            hour12: true 
        });

        const endTime = endDate.toLocaleTimeString([], { 
            hour: 'numeric', 
            minute: '2-digit', 
            hour12: true 
        });

        // console.log("Start:", startTime); // e.g. 1:31 PM
        // console.log("End:", endTime);     // e.g. 5:40 PM

        let modalHtml = "";

        if(appointmentProps.is_available){
            
                modalHtml = `
                    <div class="modal fade modal-blur" id="appointmentModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="addUserModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-md modal-dialog-centered">
                    <div class="modal-content shadow-lg rounded-4">
                        <form id="appointmentForm">
                            <div class="modal-header">
                            <h5 class="modal-title">Book Appointment</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="slotType" class="form-label">Appointment Type</label>
                                    <input type="text" class="form-control" value="`+appointmentProps.appointment_type_name+`" disabled>
                                </div>

                                <div class="col-md-6">
                                <label for="time_slot_display" class="form-label">Date</label>
                                <input type="text" id="slot_date" class="form-control" disabled>
                                </div>

                                <div class="col-md-6">
                                <label for="time_slot_display" class="form-label">Start Time</label>
                                <input type="text" id="slot_start_time" class="form-control" disabled>
                                </div>

                                <div class="col-md-6">
                                <label for="time_slot_display" class="form-label">End Time</label>
                                <input type="text" id="slot_end_time" class="form-control" disabled>
                                </div>

                                <div class="col-12">
                                <label for="notes" class="form-label">Notes</label>
                                <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
                                </div>
                            </div>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal"><i class="mdi mdi-close me-2"></i> Cancel</button>
                            <button type="submit" class="btn btn-primary" id="addAppointment"> <i class="mdi mdi-calendar-check me-2"></i> Book</button>               
                        </div>
                        </form>
                        </div>
                    </div>
                    </div>
                `;

        } else {

            swal.fire({
                title: 'Appointment Unavailable',
                text: 'This time slot is not available. Please choose another time.',
                icon: 'warning',
                confirmButtonText: 'OK'
            })
        }

        // Remove any old modal and append new
        $('#appointmentModal').remove();
        $('body').append(modalHtml);

        const modalEl = document.getElementById('appointmentModal');
        const modal = new bootstrap.Modal(modalEl);

        // Fill in values AFTER modal is in DOM
        // Set select by ID instead of name
        $('#appointment_type_name').val(appointmentProps.appointment_type_id);
        $('#slot_date').val(dateOnly);
        $('#slot_start_time').val(startTime);
        $('#slot_end_time').val(endTime);


        // (optional) fallback: if ID not available, try to match by text
        if (!$('#appointment_type_name').val()) {
        $("#appointment_type_name option").filter(function() {
            return $(this).text().trim().startsWith(appointmentProps.appointment_type_name);
        }).prop('selected', true);
        }

        $('#appointment_type_id').val(appointmentProps.appointment_type_id || '');
        $('#time_slot_id').val(slotID);
        // $('#time_slot_display').val(`${event.start.toLocaleString()} - ${event.end.toLocaleString()}`);
        $('#capacity').val(appointmentProps.current_bookings+`/`+appointmentProps.max_capacity);

        // Preselect status
        if (appointmentProps.is_available) {
            $('#status').val('pending');
        } else {
            $('#status').val('cancelled');
        }

        modal.show();

        // Attach handler to appointment form
        $(document).on('submit', '#appointmentForm', function (e) {
            e.preventDefault();

            const formData = {
                slot_id: slotID,
                notes: $('#notes').val(),
            };

            Swal.fire({
                title: 'Confirm Booking',
                text: 'Do you want to book this appointment?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, book it!',
                cancelButtonText: 'No, cancel',
                cancelButtonColor: '#d33'

            }).then(result => {
                if (result.isConfirmed) {
                    fetch('/api/appointments/book', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(formData)
                    })
                    .then(res => res.json())
                    .then(data => {
                        if (data.success) {
                            $('#appointmentModal').modal('hide');
                            calendar.refetchEvents(); // Refresh calendar
                            showNotification('Appointment booked successfully', 'success');
                        } else {
                            showNotification('Error: ' + data.message, 'error');
                        }
                    })
                    .catch(err => {
                        console.error('Error:', err);
                        showNotification('Error booking appointment: ' + err, 'error');
                    });
                }else if (result.dismiss === Swal.DismissReason.cancel) {
                        Swal.fire("Cancelled", "No action performed.", "error");
                    }
            });
        });

        
        // Remove modal from DOM when hidden
        $('#appointmentModal').on('hidden.bs.modal', function() {
            $(this).remove();
        });
    }

})

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

document.addEventListener('DOMContentLoaded', function() {
    let currentAppointmentId = null;
    let appointments = [];

    // Initialize appointment list
    loadAppointments();

    // Refresh button
    document.getElementById('refreshAppointmentsBtn').addEventListener('click', function() {
        loadAppointments();
    });

    // Search functionality
    document.getElementById('appointmentSearch').addEventListener('input', function() {
        filterAppointments();
    });

    // Filter functionality
    document.getElementById('appointmentFilter').addEventListener('change', function() {
        filterAppointments();
    });

    // Cancel appointment confirmation
    document.getElementById('confirmCancelBtn').addEventListener('click', function() {
        cancelAppointment();
    });

    // Detail modal cancel button
    document.getElementById('detailCancelBtn').addEventListener('click', function() {
        $('#appointmentDetailsModal').modal('hide');
        showCancelModal(currentAppointmentId);
    });

    // Load appointments from API
    function loadAppointments() {
        const appointmentList = document.getElementById('appointmentList');
        const upcomingList = document.getElementById('upcomingAppointments');
        
        // Show loading state
        appointmentList.innerHTML = `
            <div class="text-center p-4">
                <div class="spinner-border spinner-border-sm" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <p class="mt-2 text-muted">Loading appointments...</p>
            </div>
        `;
        
        upcomingList.innerHTML = `
            <div class="text-center p-3">
                <div class="spinner-border spinner-border-sm" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        `;

        // Fetch appointments from API
        fetch('/api/appointments/user_appointments?page=0&size=50')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // console.log(data)
            appointments = data || [];
            renderAppointments();
            
            // Also load upcoming appointments
            return fetch('/api/appointments/upcoming_appointments?days_ahead=30');
        })
        .then(response => response.json())
        .then(upcomingData => {
            renderUpcomingAppointments(upcomingData);
        })
        .catch(error => {
            console.error('Error loading appointments:', error);
            appointmentList.innerHTML = `
                <div class="text-center p-4">
                    <i class="bi bi-exclamation-triangle text-warning" style="font-size: 2rem;"></i>
                    <p class="mt-2 text-muted">Failed to load appointments</p>
                    <button class="btn btn-sm btn-primary mt-2" onclick="loadAppointments()">Try Again</button>
                </div>
            `;
        });
    }

    // Render appointments list
    function renderAppointments() {
        const appointmentList = document.getElementById('appointmentList');
        const filteredAppointments = filterAppointments();
        
        if (filteredAppointments.length === 0) {
            appointmentList.innerHTML = `
                <div class="text-center p-4">
                    <i class="bi bi-calendar-x text-muted" style="font-size: 2rem;"></i>
                    <p class="mt-2 text-muted small">No appointments found</p>
                </div>
            `;
            return;
        }

        let html = '';
        filteredAppointments.forEach(appointment => {
            const appointmentDate = new Date(appointment.start_time);
            const formattedDate = appointmentDate.toLocaleDateString();
            const formattedTime = appointmentDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
            
            const statusClass = getStatusClass(appointment.status);
            const statusBadge = getStatusBadge(appointment.status);

            const cancelAppBtn = (appointment.status === 'scheduled' || appointment.status === 'confirmed')
                ? '<button class="btn btn-sm btn-outline-danger cancel-btn" ' +
                    'data-id="' + appointment.id + '" ' +
                    'title="Cancel Appointment">' +
                    '<i class="bi bi-x-circle"></i>' +
                '</button>'
                : '';
            
            html += `
                <div class="appointment-item `+appointment.status+` p-3 border-bottom" data-id="`+appointment.id+`">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <h6 class="mb-0 text-truncate">`+appointment.appointment_type+`</h6>
                        `+statusBadge+`
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <div class="time-display text-primary">`+formattedTime+`</div>
                            <small class="text-muted">`+formattedDate+`</small>
                        </div>
                        <div class="appointment-actions">
                            <button class="btn btn-sm btn-outline-primary me-1 view-details-btn" 
                                    data-id="`+appointment.id+`"
                                    title="View Details">
                                <i class="bi bi-eye"></i>
                            </button>
                            `+cancelAppBtn+`
                        </div>
                    </div>
                    <div class="mt-2">
                        <small class="text-muted">With: `+appointment.provider_name+`</small>
                    </div>
                </div>
            `;
        });

        appointmentList.innerHTML = html;
        
        // Add event listeners to buttons
        document.querySelectorAll('.view-details-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const appointmentId = this.getAttribute('data-id');
                showAppointmentDetails(appointmentId);
            });
        });

        document.querySelectorAll('.cancel-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const appointmentId = this.getAttribute('data-id');
                showCancelModal(appointmentId);
            });
        });
    }

    // Render upcoming appointments
    function renderUpcomingAppointments() {
        const upcomingList = document.getElementById('upcomingAppointments');
        const now = new Date();
        
        const upcoming = appointments
            .filter(app => (app.status === 'scheduled' || app.status === 'confirmed') && 
                          new Date(app.start_time) > now)
            .sort((a, b) => new Date(a.start_time) - new Date(b.start_time))
            .slice(0, 5);
        
        if (upcoming.length === 0) {
            upcomingList.innerHTML = `
                <div class="text-center p-3">
                    <i class="bi bi-calendar-check text-muted"></i>
                    <p class="mt-1 text-muted small">No upcoming appointments</p>
                </div>
            `;
            return;
        }

        let html = '';
        upcoming.forEach(appointment => {
            const appointmentDate = new Date(appointment.start_time);
            const formattedDate = appointmentDate.toLocaleDateString();
            const formattedTime = appointmentDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
            
            html += `
                <div class="upcoming-item p-3 ps-5 pe-5 border-bottom">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <strong class="text-truncate" style="max-width: 70%;">`+appointment.appointment_type+`</strong>
                        <span class="badge bg-success bg-opacity-10 text-success border border-success border-opacity-25">`+formattedTime+`</span>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <small class="text-muted">`+formattedDate+`</small>
                        <!--<small class="text-muted">`+appointment.provider_name.split(' ')[0]+`</small>-->
                    </div>
                </div>
            `;
        });

        upcomingList.innerHTML = html;
    }

    // Filter appointments based on search and filter criteria
    function filterAppointments() {
        const searchTerm = document.getElementById('appointmentSearch').value.toLowerCase();
        const filterValue = document.getElementById('appointmentFilter').value;
        
        const filtered = appointments.filter(appointment => {
            const matchesSearch = appointment.appointment_type.toLowerCase().includes(searchTerm) ||
                                appointment.provider_name.toLowerCase().includes(searchTerm) ||
                                appointment.status.toLowerCase().includes(searchTerm);
            
            const matchesFilter = filterValue === 'all' || appointment.status === filterValue;
            
            return matchesSearch && matchesFilter;
        });
        
        renderFilteredAppointments(filtered);
        return filtered;
    }

    // Render filtered appointments
    function renderFilteredAppointments(filteredAppointments) {
        const appointmentList = document.getElementById('appointmentList');
        
        if (filteredAppointments.length === 0) {
            appointmentList.innerHTML = `
                <div class="text-center p-4">
                    <i class="bi bi-search text-muted" style="font-size: 2rem;"></i>
                    <p class="mt-2 text-muted small">No appointments match your criteria</p>
                </div>
            `;
            return;
        }

        let html = '';
        filteredAppointments.forEach(appointment => {
            const appointmentDate = new Date(appointment.start_time);
            const formattedDate = appointmentDate.toLocaleDateString();
            const formattedTime = appointmentDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
            
            const statusBadge = getStatusBadge(appointment.status);

            const cancelAppBtn = (appointment.status === 'scheduled' || appointment.status === 'confirmed')
                ? '<button class="btn btn-sm btn-outline-danger cancel-btn" ' +
                    'data-id="' + appointment.id + '" ' +
                    'title="Cancel Appointment">' +
                    '<i class="bi bi-x-circle"></i>' +
                '</button>'
                : '';
            
            html += `
                <div class="appointment-item `+appointment.status+` p-3 border-bottom" data-id="`+appointment.id+`">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <h6 class="mb-0 text-truncate">`+appointment.appointment_type+`</h6>
                        `+statusBadge+`
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <div class="time-display text-primary">`+formattedTime+`</div>
                            <small class="text-muted">`+formattedDate+`</small>
                        </div>
                        <div class="appointment-actions">
                            <button class="btn btn-sm btn-outline-primary me-1 view-details-btn" 
                                    data-id="`+appointment.id+`">
                                <i class="bi bi-eye"></i>
                            </button>
                            `+cancelAppBtn+`
                        </div>
                    </div>
                    <div class="mt-2">
                        <small class="text-muted">With: `+appointment.provider_name+`</small>
                    </div>
                </div>
            `;
        });

        appointmentList.innerHTML = html;
        
        // Reattach event listeners
        document.querySelectorAll('.view-details-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const appointmentId = this.getAttribute('data-id');
                showAppointmentDetails(appointmentId);
            });
        });

        document.querySelectorAll('.cancel-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const appointmentId = this.getAttribute('data-id');
                showCancelModal(appointmentId);
            });
        });
    }

    // Show appointment details modal
    function showAppointmentDetails(appointmentId) {
        const appointment = appointments.find(app => app.id == appointmentId);
        if (!appointment) return;

        currentAppointmentId = appointmentId;
        
        const startTime = new Date(appointment.start_time);
        const endTime = new Date(appointment.end_time);
        const duration = Math.round((endTime - startTime) / (1000 * 60));
        
        // Format dates and times
        const formattedDate = startTime.toLocaleDateString();
        const formattedTime = startTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        const formattedEndTime = endTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        const createdDate = new Date(appointment.created_at).toLocaleString();

        // Update modal content
        document.getElementById('detailAppointmentType').textContent = appointment.appointment_type;
        document.getElementById('detailDateTime').textContent = formattedDate+` `+formattedTime+` - `+formattedEndTime;
        document.getElementById('detailProvider').textContent = appointment.provider_name;
        document.getElementById('detailDuration').textContent = duration+` minutes`;
        document.getElementById('detailCreated').textContent = createdDate;
        
        // Update status badge
        const statusBadge = document.getElementById('detailStatusBadge');
        statusBadge.className = 'badge ' + getStatusClass(appointment.status);
        statusBadge.textContent = appointment.status.charAt(0).toUpperCase() + appointment.status.slice(1);
        
        // Update notes
        const notesElement = document.getElementById('detailNotes');
        if (appointment.notes) {
            notesElement.innerHTML = appointment.notes.replace(/\n/g, '<br>');
        } else {
            notesElement.innerHTML = '<em class="text-muted">No notes provided</em>';
        }
        
        // Show/hide cancellation info
        const cancellationInfo = document.getElementById('cancellationInfo');
        if (appointment.status === 'cancelled' && appointment.cancelled_at) {
            cancellationInfo.style.display = 'block';
            document.getElementById('detailCancelledAt').textContent = 
                `Cancelled on: `+new Date(appointment.cancelled_at).toLocaleString();
            document.getElementById('detailCancellationReason').textContent = 
                `Reason: `+appointment.cancellation_reason || `No reason provided`;
        } else {
            cancellationInfo.style.display = 'none';
        }
        
        // Show/hide action buttons
        const cancelBtn = document.getElementById('detailCancelBtn');
        const rescheduleBtn = document.getElementById('detailRescheduleBtn');
        
        if (appointment.status === 'scheduled' || appointment.status === 'confirmed') {
            cancelBtn.style.display = 'inline-block';
            rescheduleBtn.style.display = 'inline-block';
        } else {
            cancelBtn.style.display = 'none';
            rescheduleBtn.style.display = 'none';
        }
        
        // Show modal
        $('#appointmentDetailsModal').modal('show');
    }

    // Show cancel appointment modal
    function showCancelModal(appointmentId) {
        const appointment = appointments.find(app => app.id == appointmentId);
        if (!appointment) return;

        currentAppointmentId = appointmentId;
        
        const startTime = new Date(appointment.start_time);
        const formattedDate = startTime.toLocaleDateString();
        const formattedTime = startTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        
        // Update modal content
        document.getElementById('cancelAppointmentTitle').textContent = appointment.appointment_type;
        document.getElementById('cancelAppointmentTime').textContent = formattedDate+` at `+formattedTime;
        document.getElementById('cancelAppointmentProvider').textContent = `With: `+appointment.provider_name;
        document.getElementById('cancellationReason').value = '';
        
        // Show modal
        $('#cancelAppointmentModal').modal('show');
    }

    // Cancel appointment function
    function cancelAppointment() {
        const reason = document.getElementById('cancellationReason').value;
        
        fetch(`/api/appointments/cancel_appointment/`+currentAppointmentId, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                reason: reason
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                $('#cancelAppointmentModal').modal('hide');
                showToast('Appointment cancelled successfully', 'success');
                loadAppointments(); // Reload the list
            } else {
                showToast('Failed to cancel appointment: ' + data.message, 'error');
            }
        })
        .catch(error => {
            console.error('Error cancelling appointment:', error);
            showToast('Error cancelling appointment', 'error');
        });
    }

    // Helper function to get status badge HTML
    function getStatusBadge(status) {
        const statusClass = getStatusClass(status);
        const statusText = status.charAt(0).toUpperCase() + status.slice(1);
        
        return `<span class="badge `+statusClass+` status-badge">`+statusText+`</span>`;
    }

    // Helper function to get status class
    function getStatusClass(status) {
        switch(status) {
            case 'scheduled': return 'bg-info bg-opacity-10 text-info border border-info border-opacity-25';
            case 'confirmed': return 'bg-success bg-opacity-10 text-success border border-success border-opacity-25';
            case 'completed': return 'bg-secondary bg-opacity-10 text-secondary border border-secondary border-opacity-25';
            case 'cancelled': return 'bg-danger bg-opacity-10 text-danger border border-danger border-opacity-25';
            default: return 'bg-light text-dark border';
        }
    }

    // Helper function to show toast notifications
    function showToast(message, type = 'info') {
        // You can implement a toast notification system here
        // For now, we'll use a simple alert
        alert(type.toUpperCase()+`: `+message);
    }
});
</script>
