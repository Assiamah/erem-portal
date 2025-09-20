<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        }
        
        .tracking-timeline {
            position: relative;
            padding-left: 30px;
            margin: 20px 0;
        }
        
        .timeline-progress {
            position: absolute;
            left: 11px;
            top: 10px;
            bottom: 10px;
            width: 4px;
            background-color: #e9ecef;
            border-radius: 2px;
            overflow: hidden;
        }
        
        .progress-bar {
            background: linear-gradient(to bottom, var(--primary), #6278df);
            width: 100%;
            border-radius: 2px;
            transition: height 0.5s ease;
        }
        
        .timeline-item {
            position: relative;
            margin-bottom: 25px;
        }
        
        .timeline-item:last-child {
            margin-bottom: 0;
        }
        
        .timeline-icon {
            position: absolute;
            left: -30px;
            top: 0;
            width: 26px;
            height: 26px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: white;
            border: 2px solid #e9ecef;
            z-index: 2;
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
        }
        
        .timeline-content {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 15px;
            border-left: 3px solid #e9ecef;
        }
        
        .timeline-item.completed .timeline-content {
            border-left-color: var(--success);
        }
        
        .timeline-item.active .timeline-content {
            border-left-color: var(--primary);
        }
        
        .timeline-title {
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--dark);
        }
        
        .timeline-item.completed .timeline-title {
            color: var(--success);
        }
        
        .timeline-item.active .timeline-title {
            color: var(--primary);
        }
        
        .timeline-date {
            font-size: 12px;
            color: var(--secondary);
            margin-bottom: 8px;
        }
        
        .timeline-description {
            font-size: 14px;
            color: var(--secondary);
            margin-bottom: 0;
        }
        
        .application-info {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
        }
        
        .info-item {
            display: flex;
            margin-bottom: 12px;
        }
        
        .info-item:last-child {
            margin-bottom: 0;
        }
        
        .info-label {
            font-weight: 600;
            min-width: 120px;
            color: #495057;
        }
        
        .info-value {
            color: #6c757d;
        }
        
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }
        
        .modal-footer {
            border-top: 1px solid #eaeaea;
            padding: 20px 25px;
        }
        
        .btn-download {
            background: linear-gradient(120deg, var(--primary), #6278df);
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            color: white;
        }
        
        .btn-download:hover {
            background: linear-gradient(120deg, #3a52b4, #536cd8);
            color: white;
        }
        
        .estimated-time {
            background-color: var(--primary-light);
            border-radius: 8px;
            padding: 15px;
            margin-top: 20px;
        }
        
        .time-label {
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 5px;
        }
        
        .time-value {
            color: var(--dark);
            font-size: 18px;
            font-weight: 600;
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
                        <li class="breadcrumb-item active" aria-current="page">Submited Applications</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                 <div class="card">
                    <div class="card-header">
                        <!-- <h5 class="card-title mb-0"></h5> -->
                        <p class="text-muted mb-4 col-8">
                            Track and manage submitted lease applications with this interactive table.  
                            Review applicantion details, parcel information, land use, and status — all in one place.
                        </p> 
                        <button type="button" class="btn btn-success" onclick="applyForLease()">
                            <i class="ri ri-draft-line"></i> Apply for Lease
                        </button>                
                     </div>
                    <div class="card-body">
                     <div class="table-responsive">
                        <table id="application-datatable" class="table table-striped dt-responsive w-100">
                            <thead>
                                <tr>
                                    <th>Application ID</th>
                                    <th>Applicant</th>
                                    <th>Parcel Details</th>
                                    <th>Land Use</th>
                                    <th>Size</th>
                                    <th>Submitted Date</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Data will be populated by JavaScript -->
                                 <tr>
                                    <td>LAP-23425430032025</td>
                                    <td>${userInfo.full_name}</td>
                                    <td>R1203</td>
                                    <td>Residential</td>
                                    <td>0.73 Acres</td>
                                    <td>September 17, 2025</td>
                                    <td class="text-center">
                                        <div class="badge bg-warning-subtle text-warning py-1 rounded-3 border border-warning">Under Review</div>
                                    </td>
                                    <td class="text-end">
                                        <button type="button" class="btn btn-light-info icon-btn-sm btn-view" data-bs-toggle="tooltip" data-bs-custom-class="tooltip-white" data-bs-placement="top" data-bs-title="View">
                                            <i class="mdi mdi-eye"></i>
                                        </button>
                                        <button type="button" onclick="trackingModal()" class="btn btn-light-success icon-btn-sm btn-edit" data-bs-toggle="tooltip" data-bs-custom-class="tooltip-white" data-bs-placement="top" data-bs-title="Track">
                                            <i class="mdi mdi-text-search"></i>
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

    <!-- Submit Section -->
</main>


<script>
    function applyForLease() {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/lease_application';

        // Add hidden input with JSON string
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'formData';
        form.appendChild(input);

        document.body.appendChild(form);
        form.submit();
    }

    document.addEventListener('DOMContentLoaded', function () {
        let table = new DataTable('#application-datatable', {
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copyHtml5',
                    text: '<i class="mdi mdi-content-copy me-1"></i> Copy',
                    className: 'btn btn-sm btn-outline-danger me-1',
                    titleAttr: 'Copy to clipboard'
                },
                {
                    extend: 'csvHtml5',
                    text: '<i class="mdi mdi-file-excel me-1"></i> CSV',
                    className: 'btn btn-sm btn-outline-success me-1',
                    titleAttr: 'Export CSV'
                },
                // {
                //     extend: 'excelHtml5',
                //     text: '<i class="bi bi-file-earmark-excel me-1"></i> Excel',
                //     className: 'btn btn-sm btn-outline-success me-1',
                //     titleAttr: 'Export Excel'
                // },
                // {
                //     extend: 'pdfHtml5',
                //     text: '<i class="bi bi-file-earmark-pdf me-1"></i> PDF',
                //     className: 'btn btn-sm btn-outline-danger me-1',
                //     titleAttr: 'Export PDF',
                //     orientation: 'landscape',
                //     pageSize: 'A4',
                //     exportOptions: { columns: ':visible' }
                // },
                {
                    extend: 'print',
                    text: '<i class="bi bi-printer me-1"></i> Print',
                    className: 'btn btn-sm btn-outline-info me-1',
                    titleAttr: 'Print table'
                }
            ]
        });
    });

    function trackingModal(){
        $("#trackingModal").modal('show');
    }
</script>
