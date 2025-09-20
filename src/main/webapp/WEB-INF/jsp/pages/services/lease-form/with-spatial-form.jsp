<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        <div class="stepper">
                            <form action="#" class="form-steps" autocomplete="off">
                                <div class="text-center pt-3 pb-4 mb-1">
                                    <h5>Application Process</h5>
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
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link rounded-circle p-0 avatar-md" type="button" data-tab="3">4</button>
                                        </li>
                                    </ul>
                                </div>

                                <div class="tab-content">
                                    <div class="tab-pane fade show active" data-tab="0">
                                        <div class="mb-4">
                                            <h5 class="mb-1">Select Parcel</h5>
                                            <p class="text-muted">Please select a parcel from the map to begin your application.</p>

                                            <div class="position-relative">
                                                <div class="w-100 min-h-320px" id="map"></div>
                                                <div class="map-overlay">
                                                    <h5>Filter Properties</h5>
                                                    <div class="form-check form-check-primary">
                                                        <input class="form-check-input" type="checkbox" id="forSale" checked>
                                                        <label class="form-check-label" for="forSale">For Sale</label>
                                                    </div>
                                                    <div class="form-check form-check-primary">
                                                        <input class="form-check-input" type="checkbox" id="forRent" checked>
                                                        <label class="form-check-label" for="forRent">For Rent</label>
                                                    </div>
                                                    <div class="form-check form-check-primary">
                                                        <input class="form-check-input" type="checkbox" id="commercial">
                                                        <label class="form-check-label" for="commercial">Commercial</label>
                                                    </div> 
                                                    <hr>
                                                    <div class="form-group">
                                                        <label for="priceRange" class="form-label">Price Range</label>
                                                        <input type="range" class="form-range" id="priceRange" min="0" max="1000000" step="50000">
                                                        <div class="d-flex justify-content-between">
                                                            <small>GHS0</small>
                                                            <small>GHS10,000,000</small>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Parcel Details Offcanvas -->
                                                <div class="map-offcanvas text-small" id="parcelOffcanvas">
                                                    <div class="offcanvas-header__parcel">
                                                        <h5 class="offcanvas-title__parcel">Parcel Details</h5>
                                                        <button type="button" class="btn-close__parcel text-dark" onclick="hideParcelOffcanvas()"><i class="fas fa-times"></i></button>
                                                    </div>
                                                    <div class="offcanvas-body__parcel" id="parcelOffcanvasBody">
                                                        <!-- Content will be loaded dynamically -->
                                                    </div>

                                                    <!-- Offcanvas footer -->
                                                    <div class="offcanvas-footer__parcel ps-4 pe-4">
                                                        <button class="btn btn-map w-100 btn-outline-primary btn-sm me-2" onclick="saveParcel()">
                                                        <i class="fas fa-heart" style="color: var(--salmon);"></i> Save Parcel
                                                        </button>
                                                        <button class="btn btn-map w-100 btn-warning btn-sm" onclick="applyForParcel()">
                                                        <i class="fas fa-file-signature"></i> Apply Now
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start justify-content-end gap-3 mt-4">
                                            <button type="button" class="btn btn-primary nexttab" id="step1Next" disabled>Next</button>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" data-tab="1">
                                        <div class="mb-4">
                                            <h5 class="mb-1">Confirm Parcel Details</h5>
                                            <p class="text-muted">Review the selected parcel details.</p>
                                            <div id="parcelReviewDetails" class="p-3 bg-light rounded">
                                                <p class="text-center text-muted">No parcel selected yet. Please go back to step 1 and select a parcel.</p>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start justify-content-between gap-3 mt-4">
                                            <button type="button" class="btn btn-outline-secondary previestab">Previous</button>
                                            <button type="button" class="btn btn-primary nexttab">Next</button>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" data-tab="2">
                                        <div class="mb-4">
                                            <h5 class="mb-1">Provide Personal Information</h5>
                                            <p class="text-muted">Please provide your personal details.</p>
                                            <div class="row g-4">
                                                <div class="col-xl-6">
                                                    <input type="text" placeholder="First Name" class="form-control" id="firstNameInput">
                                                </div>
                                                <div class="col-xl-6">
                                                    <input type="text" placeholder="Last Name" class="form-control" id="lastNameInput">
                                                </div>
                                                <div class="col-xl-6">
                                                    <input type="text" placeholder="Phone Number" class="form-control" id="phoneNumberInput">
                                                </div>
                                                <div class="col-xl-6">
                                                    <input type="email" placeholder="Email Address" class="form-control" id="emailInput">
                                                </div>
                                                <div class="col-xl-12">
                                                    <textarea placeholder="Purpose of Lease" class="form-control" id="purposeInput" rows="3"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start justify-content-between gap-3 mt-4">
                                            <button type="button" class="btn btn-outline-secondary previestab">Previous</button>
                                            <button type="button" class="btn btn-primary nexttab">Next</button>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" data-tab="3">
                                        <div class="mb-4">
                                            <h5 class="mb-1">Review Application Details</h5>
                                            <p class="text-muted">Please review your application before submitting.</p>
                                            <div class="card">
                                                <div class="card-body">
                                                    <div id="applicationSummary">
                                                        <p class="text-center text-muted">Application details will appear here after completing previous steps.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start justify-content-between gap-3 mt-4">
                                            <button type="button" class="btn btn-outline-secondary previestab">Previous</button>
                                            <button type="button" class="btn btn-success" id="submitApplication">Submit Application</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--End row-->
    </div><!--End container-fluid-->
</main><!--End app-wrapper-->
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.8.0/proj4.js"></script>

<script>
    // Global variables to store application data
    let selectedParcel = null;
    let applicationData = {
        parcel: null,
        personalInfo: null
    };
    
    // Map variables
    let map;
    let highlightedParcel = null;
    let parcelLayer = null;

    // Helper function to show notification
    window.showNotification = function(message, type = 'success') {
        // You can implement a toast notification system here
        alert(type.toUpperCase() + ": " + message); // Simple alert for demo
    }

    // Initialize stepper functionality
    document.addEventListener('DOMContentLoaded', function() {
        const stepper = document.querySelector('.stepper');
        const nextButtons = stepper.querySelectorAll('.nexttab');
        const prevButtons = stepper.querySelectorAll('.previestab');
        const tabs = stepper.querySelectorAll('.tab-pane');
        const progressBar = stepper.querySelector('.progress-bar');
        const tabButtons = stepper.querySelectorAll('.nav-link');
        let currentTab = 0;

        function updateTabs() {
            tabs.forEach((tab, index) => {
                tab.classList.remove('show', 'active');
                if (index === currentTab) {
                    tab.classList.add('show', 'active');
                }
            });

            // Update progress bar width based on currentTab
            const progressPercentage = (currentTab / (tabs.length - 1)) * 100;
            progressBar.style.width = progressPercentage+`%`;

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

            // Special handling for step transitions
            if (currentTab === 1) {
                updateParcelReview();
            } else if (currentTab === 3) {
                updateApplicationSummary();
            }
        }

        // Add event listener for each tab button
        tabButtons.forEach((button, index) => {
            button.addEventListener('click', () => {
                if (index <= currentTab || (index === 1 && selectedParcel)) {
                    currentTab = index;
                    updateTabs();
                }
            });
        });

        nextButtons.forEach(button => {
            button.addEventListener('click', () => {
                // Validate current step before proceeding
                if (validateStep(currentTab)) {
                    if (currentTab < tabs.length - 1) {
                        currentTab++;
                        updateTabs();
                    }
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

        // Step validation
        function validateStep(step) {
            switch(step) {
                case 0: // Parcel selection
                    if (!selectedParcel) {
                        showNotification('Please select a parcel to continue', 'error');
                        return false;
                    }
                    return true;
                case 1: // Parcel review
                    return true; // No validation needed
                case 2: // Personal info
                    const firstName = document.getElementById('firstNameInput').value;
                    const lastName = document.getElementById('lastNameInput').value;
                    const phone = document.getElementById('phoneNumberInput').value;
                    const email = document.getElementById('emailInput').value;
                    
                    if (!firstName || !lastName || !phone || !email) {
                        showNotification('Please fill all required fields', 'error');
                        return false;
                    }
                    
                    // Save personal info
                    applicationData.personalInfo = {
                        firstName, lastName, phone, email,
                        purpose: document.getElementById('purposeInput').value
                    };
                    
                    return true;
                default:
                    return true;
            }
        }

        // Update parcel review in step 2
        function updateParcelReview() {
            const reviewContainer = document.getElementById('parcelReviewDetails');
            
            if (selectedParcel) {
                const properties = selectedParcel.properties;
                reviewContainer.innerHTML = `
                    <h6>Selected Parcel: `+properties.plot_no || properties.parcel_id || 'N/A'+`</h6>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <p><strong>Location:</strong> `+properties.location || 'N/A'+`</p>
                            <p><strong>Zone:</strong> `+properties.zone || 'N/A'+`</p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Area:</strong> `+properties.area ? properties.area + ' sqm' : 'N/A'+`</p>
                            <p><strong>Status:</strong> `+properties.allocation_status === '0' ? 'Available' : 'Occupied'+`</p>
                        </div>
                    </div>
                `;
            } else {
                reviewContainer.innerHTML = '<p class="text-center text-muted">No parcel selected yet. Please go back to step 1 and select a parcel.</p>';
            }
        }

        // Update application summary in final step
        function updateApplicationSummary() {
            const summaryContainer = document.getElementById('applicationSummary');
            
            if (selectedParcel && applicationData.personalInfo) {
                const parcel = selectedParcel.properties;
                const personal = applicationData.personalInfo;
                
                summaryContainer.innerHTML = `
                    <h6>Application Summary</h6>
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <h6>Parcel Details</h6>
                            <p><strong>Parcel ID:</strong> `+parcel.plot_no || parcel.parcel_id || 'N/A'+`</p>
                            <p><strong>Location:</strong> `+parcel.location || 'N/A'+`</p>
                            <p><strong>Area:</strong> `+parcel.area ? parcel.area + ' sqm' : 'N/A'+`</p>
                        </div>
                        <div class="col-md-6">
                            <h6>Personal Information</h6>
                            <p><strong>Name:</strong> `+personal.firstName+` `+personal.lastName+`</p>
                            <p><strong>Phone:</strong> `+personal.phone+`</p>
                            <p><strong>Email:</strong> `+personal.email+`</p>
                            <p><strong>Purpose:</strong> `+personal.purpose || 'Not specified'+`</p>
                        </div>
                    </div>
                `;
            } else {
                summaryContainer.innerHTML = '<p class="text-center text-muted">Application details incomplete. Please complete all steps.</p>';
            }
        }

        // Submit application
        document.getElementById('submitApplication').addEventListener('click', function() {
            if (selectedParcel && applicationData.personalInfo) {
                // Here you would typically send the data to your server
                showNotification('Application submitted successfully!', 'success');
                
                // Simulate successful submission
                setTimeout(function() {
                    alert('Your application has been submitted successfully. You will receive a confirmation email shortly.');
                    // You could redirect to a confirmation page here
                }, 1000);
            } else {
                showNotification('Please complete all steps before submitting', 'error');
            }
        });

        // Initial setup
        updateTabs();

        // Initialize map
        initMap();
    });

    // Map initialization
    function initMap() {
        // Define source (EPSG:2136) and destination (EPSG:4326)
        proj4.defs("EPSG:2136", "+proj=tmerc +lat_0=4.666666666666667 +lon_0=-1 +k=0.99975 +x_0=274319.736 +y_0=0 +ellps=clrk80 +units=m +no_defs");

        // Example point in EPSG:2136
        let point2136 = [264970, 1015339]; // [x, y]

        // Convert to EPSG:4326
        let point4326 = proj4("EPSG:2136", "EPSG:4326", point2136);

        // Leaflet expects [lat, lon]
        let leafletCenter = [point4326[1], point4326[0]];
        
        const geoserverBaseUrl = 'http://localhost:2020/geoserver';

        // Base Layers
        const osmLayer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        });

        const satelliteLayer = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
            attribution: '© Esri'
        });

        const topoLayer = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenTopoMap contributors'
        });

        // Initialize map with default base layer
        map = L.map('map', {
            center: [5.385786, -0.679827],
            zoom: 16,
            layers: [osmLayer]
        });

        // GeoServer WMS Layer with error handling
        try {
            var gcsez_boundary = L.tileLayer.wms(geoserverBaseUrl + '/wms', {
                layers: 'smarterem:gcsez_boundary',
                format: 'image/png',
                transparent: true,
                version: '1.1.0',
                attribution: 'GeoServer Data'
            }).addTo(map);

            var gcsez_parceldata_02 = L.tileLayer.wms(geoserverBaseUrl + '/wms', {
                layers: 'smarterem:gcsez_parceldata_02',
                format: 'image/png',
                transparent: true,
                version: '1.1.0',
                attribution: 'GeoServer Data'
            }).addTo(map);

            var gcsez_stline = L.tileLayer.wms(geoserverBaseUrl + '/wms', {
                layers: 'smarterem:gcsez_stline',
                format: 'image/png',
                transparent: true,
                version: '1.1.0',
                attribution: 'GeoServer Data'
            }).addTo(map);

            var gcsez_accessroad = L.tileLayer.wms(geoserverBaseUrl + '/wms', {
                layers: 'smarterem:gcsez_accessroad',
                format: 'image/png',
                transparent: true,
                version: '1.1.0',
                attribution: 'GeoServer Data'
            }).addTo(map);
            
            // Optional: Add layer control
            const baseLayers = {
                'OpenStreetMap': osmLayer,
                'Satellite': satelliteLayer,
                'Topographic': topoLayer
            };
            
            const overlays = {
                "Boundary": gcsez_boundary,
                "Parcel Data": gcsez_parceldata_02,
                "Street Line": gcsez_stline,
                "Access Road": gcsez_accessroad
            };

            // Initialize parcel highlight layer
            initParcelHighlightLayer();

            // Modify the click handler
            map.on('click', function(e) {
                // Only process clicks if parcel layer is visible
                if (map.hasLayer(gcsez_parceldata_02)) {
                    // Clear previous highlight
                    clearParcelHighlight();
                    
                    // Get parcel info and highlight
                    getParcelInfo(e.latlng);
                    
                    // Center map on click position
                    map.panTo(e.latlng);
                }
            });
            
            L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);
            
        } catch (error) {
            console.error('Error loading GeoServer layer:', error);
            showNotification('Could not connect to GeoServer. Make sure it\'s running on localhost:2020', 'error');
        }
    }

    // Initialize a GeoJSON layer for highlighting
    function initParcelHighlightLayer() {
        parcelLayer = L.geoJSON(null, {
            style: function(feature) {
                return {
                    color: '#ff0000', // Red border
                    weight: 3,
                    opacity: 0.8,
                    fillColor: '#ff0000', // Red fill
                    fillOpacity: 0.2
                };
            }
        }).addTo(map);
    }

    // Function to clear parcel highlight
    function clearParcelHighlight() {
        if (parcelLayer) {
            parcelLayer.clearLayers();
        }
        highlightedParcel = null;
    }

    // Function to highlight a specific parcel
    function highlightParcel(geojsonData) {
        if (!parcelLayer || !geojsonData) return;
        
        // Clear previous highlights
        clearParcelHighlight();
        
        // Add the new parcel to highlight layer
        parcelLayer.addData(geojsonData);
        
        // Store reference to highlighted parcel
        highlightedParcel = geojsonData;
        
        // Fit bounds to the highlighted parcel (optional)
        const bounds = parcelLayer.getBounds();
        if (bounds.isValid()) {
            map.fitBounds(bounds, { padding: [50, 50], maxZoom: 18 });
        }
    }

    // Function to get parcel information via WMS GetFeatureInfo
    function getParcelInfo(latlng) {
        // Show loading state in offcanvas
        document.getElementById('parcelOffcanvasBody').innerHTML = `
            <div class="loading-spinner">
                <div class="spinner-border" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <p class="mt-3">Loading parcel information...</p>
            </div>
        `;
        
        // Show the offcanvas
        showParcelOffcanvas();
        
        // Convert latlng to map coordinates
        const point = map.latLngToContainerPoint(latlng);
        const size = map.getSize();
        
        // Prepare parameters for GetFeatureInfo request
        const params = {
            service: 'WMS',
            version: '1.1.1',
            request: 'GetFeatureInfo',
            layers: 'smarterem:gcsez_parceldata_02',
            query_layers: 'smarterem:gcsez_parceldata_02',
            info_format: 'application/json',
            feature_count: 10,
            x: Math.round(point.x),
            y: Math.round(point.y),
            width: size.x,
            height: size.y,
            srs: 'EPSG:4326',
            bbox: map.getBounds().toBBoxString()
        };
        
        // Build the URL
        const geoserverBaseUrl = 'http://localhost:2020/geoserver';
        const url = geoserverBaseUrl + '/wms?' + L.Util.getParamString(params);
        
        // Make the request
        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Highlight the parcel first
                highlightParcel(data);
                // Then display the information
                displayParcelInfo(data);
            })
            .catch(error => {
                console.error('Error fetching parcel info:', error);
                document.getElementById('parcelOffcanvasBody').innerHTML = `
                    <div class="error-message">
                        <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                        <p>Error loading parcel information. Please try again.</p>
                        <p class="small">`+error.message+`</p>
                    </div>
                `;
            });
    }

    // Show the custom offcanvas
    function showParcelOffcanvas() {
        const offcanvas = document.getElementById('parcelOffcanvas');
        offcanvas.style.display = 'block';
    }

    // Hide the custom offcanvas
    function hideParcelOffcanvas() {
        const offcanvas = document.getElementById('parcelOffcanvas');
        offcanvas.style.display = 'none';
    }

    // Close offcanvas when clicking outside
    document.addEventListener('click', function(event) {
        const offcanvas = document.getElementById('parcelOffcanvas');
        const isClickInsideOffcanvas = offcanvas.contains(event.target);
        
        if (!isClickInsideOffcanvas && offcanvas.style.display === 'block') {
            // Check if the click is on the map or its children
            const mapElement = document.getElementById('map');
            const isClickOnMap = mapElement.contains(event.target) || event.target === mapElement;
            
            if (isClickOnMap) {
                hideParcelOffcanvas();
            }
        }
    });

    // Function to display parcel information in the offcanvas
    function displayParcelInfo(data) {
        const offcanvasBody = document.getElementById('parcelOffcanvasBody');
        
        if (data.features && data.features.length > 0) {
            const feature = data.features[0];
            const properties = feature.properties;
            
            // Store the parcel data globally for the apply button
            window.currentParcelData = data;
            
            // Get parcel ID for header
            const parcelId = properties.parcel_id || properties.plot_no || properties.serial_no || 'Parcel';
            
            let html = `
                <div class="parcel-header">
                    <div class="parcel-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <h6 class="parcel-title">Plot No.`+parcelId+`</h6>
                </div>
                
                <div class="parcel-details-grid">
                <textarea style="display:none;" id="parcelData" readonly>`+JSON.stringify(properties)+`</textarea>
            `;
            
            // Define standardized property groups in priority order
            const propertyGroups = [
                {
                    title: 'Identification',
                    properties: ['parcel_id', 'plot_no', 'serial_no', 'registry_no', 'survey_no']
                },
                {
                    title: 'Location',
                    properties: ['zone', 'location', 'address', 'coordinates']
                },
                {
                    title: 'Dimensions',
                    properties: ['area', 'size', 'acreage', 'dimensions', 'length', 'width']
                },
                {
                    title: 'Status',
                    properties: ['allocation_status', 'land_use', 'owner', 'condition', 'type']
                },
                {
                    title: 'Administrative',
                    properties: ['district', 'region', 'municipality', 'ward']
                }
            ];
            
            // Render property groups
            propertyGroups.forEach(group => {
                const groupProperties = group.properties.filter(prop => 
                    properties[prop] !== null && properties[prop] !== undefined
                );
                
                if (groupProperties.length > 0) {
                    html += `
                        <div class="property-group">
                            <div class="property-group-header">`+group.title+`</div>
                            <div class="property-group-content">
                    `;
                    
                    groupProperties.forEach(prop => {
                        const allocation_status = prop == 'allocation_status' ? (properties[prop] == 0 ? 'Unallocated' : properties[prop] == 1 ? 'Allocated' : 'Processing') : '';
                        const parcel_prop = prop == 'allocation_status' ? allocation_status : formatLandValue(prop, properties[prop]);
                        html += `
                            <div class="property-item">
                                <span class="property-label">`+formatPropertyName(prop)+`:</span>
                                <span class="property-value">`+parcel_prop+`</span>
                            </div>
                        `;
                    });
                    
                    html += `
                            </div>
                        </div>
                    `;
                }
            });
            
            // Add any remaining properties not in groups
            const allGroupedProperties = propertyGroups.flatMap(group => group.properties);
            const remainingProperties = Object.keys(properties)
                .filter(key => !allGroupedProperties.includes(key) && properties[key] !== null)
                .sort();
                
            if (remainingProperties.length > 0) {
                html += `
                    <div class="property-group">
                        <div class="property-group-header">Additional Information</div>
                        <div class="property-group-content">
                `;
                
                remainingProperties.forEach(prop => {
                    html += `
                        <div class="property-item">
                            <span class="property-label">`+formatPropertyName(prop)+`:</span>
                            <span class="property-value">`+properties[prop]+`</span>
                        </div>
                    `;
                });
                
                html += `
                        </div>
                    </div>
                `;
            }
            
            html += `</div>`; // Close parcel-details-grid
            
            offcanvasBody.innerHTML = html;
        } else {
            offcanvasBody.innerHTML = `
                <div class="no-data-message">
                    <div class="no-data-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <h6>No Parcel Data</h6>
                    <p>No information found for this location.</p>
                </div>
            `;
        }
    }

    // Helper function to format land-specific values
    function formatLandValue(propertyName, value) {
        if (propertyName.includes('area') || propertyName.includes('size') || propertyName.includes('Acreage')) {
            // Format area values
            const numValue = parseFloat(value);
            if (!isNaN(numValue)) {
                if (numValue >= 10000) {
                    return (numValue / 10000).toFixed(2) + ' hectares';
                } else if (numValue >= 1000) {
                    return (numValue / 1000).toFixed(2) + ' acres';
                } else {
                    return numValue + ' sq meters';
                }
            }
        }
        
        if (propertyName.includes('date')) {
            // Format date values
            return new Date(value).toLocaleDateString();
        }
        
        return value;
    }

    // Helper function to format property names for display
    function formatPropertyName(name) {
        return name
            .replace(/_/g, ' ')
            .replace(/([A-Z])/g, ' $1')
            .replace(/\b\w/g, l => l.toUpperCase())
            .trim();
    }

    // Function to handle parcel selection
    function selectParcel(parcelData) {
        selectedParcel = parcelData;
        applicationData.parcel = parcelData;
        
        // Enable the next button
        document.getElementById('step1Next').disabled = false;
        
        showNotification('Parcel selected successfully', 'success');
        hideParcelOffcanvas();
    }

    // Simulated functions for the buttons in the offcanvas
    function saveParcel() {
        showNotification('Parcel saved to favorites', 'success');
    }

    function applyForParcel() {
        // This would use the data from the offcanvas to select the parcel
        if (window.currentParcelData) {
            selectParcel(window.currentParcelData);
        }
    }
</script>