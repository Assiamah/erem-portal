<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title>EREM :: ${page_name} </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta content="Admin & Dashboards Template" name="description" />
    <meta content="Pixeleyez" name="author" />
    
    <!-- layout setup -->
    <script type="module" src="${pageContext.request.contextPath}/assets/js/layout-setup.js"></script>
    
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.png">    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/gridjs/theme/mermaid.min.css">
    <!-- Simplebar Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.css">
    <!-- Swiper Css -->
    <link href="${pageContext.request.contextPath}/assets/libs/swiper/swiper-bundle.min.css" rel="stylesheet">
    <!-- Nouislider Css -->
    <link href="${pageContext.request.contextPath}/assets/libs/nouislider/nouislider.min.css" rel="stylesheet">
    <!-- Bootstrap Css -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css">
    <!--icons css-->
    <link href="${pageContext.request.contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css">
    <!-- App Css-->
    <link href="${pageContext.request.contextPath}/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/custom.css" id="app-style" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/libs/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/libs/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/libs/datatables.net-select-bs5/css/select.bootstrap5.min.css" rel="stylesheet" type="text/css" />

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

    <!-- Begin page -->
    <div id="layout-wrapper">

        <!-- Begin Header -->
        <jsp:include page="../components/header.jsp"></jsp:include>
        <!-- End Header -->

        <!-- Begin Sidebar -->
        <jsp:include page="../components/sidebar.jsp"></jsp:include>
        <!-- End Sidebar -->

        <!-- Begin Main Content -->
        <jsp:include page="${content}" />
        <!-- End Main Content -->

        <!-- Begin Offcanvas -->
         <jsp:include page="../components/offcanvas.jsp"></jsp:include>
        <!-- End Offcanvas -->

        <!-- Begin Scroll Top -->
         <jsp:include page="../components/scrolltop.jsp"></jsp:include>
        <!-- End Scroll Top -->
         
        <!-- Begin Footer -->
        <jsp:include page="../components/sidebar.jsp"></jsp:include>
        <!-- End Footer -->


    </div>
    <!-- END page -->

    <jsp:include page="../components/modal.jsp"></jsp:include>

    <!-- JAVASCRIPT -->
    <script src="${pageContext.request.contextPath}/assets/libs/swiper/swiper-bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/scroll-top.init.js"></script>    
    <script src="${pageContext.request.contextPath}/assets/libs/gridjs/gridjs.umd.js" type="text/javascript"></script>

    <!-- <script src="${pageContext.request.contextPath}/assets/libs/apexcharts/apexcharts.min.js"></script> -->
    <!-- File js -->
    <!-- <script src="${pageContext.request.contextPath}/assets/js/dashboard/e-commerce.init.js"></script> -->
    <!-- App js -->
    <script type="module" src="${pageContext.request.contextPath}/assets/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/sweetalert2/sweetalert2.all.min.js"></script>

    <!-- Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <!-- axios js -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <!--datatable js-->
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/table/datatable.init.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>

    <script>
        // Show the loading modal when the DOM starts loading
        // Show Loader
        window.showLoader = function(message = "Loading...") {
            Swal.fire({
                text: message,
                allowOutsideClick: false,
                showConfirmButton: false,
                didOpen: () => {
                    Swal.showLoading();
                }
            });
        }

        // Hide Loader (with default timeout)
        window.hideLoader = function(timeout = 500) {
            setTimeout(() => {
            Swal.close();
            }, timeout);
        }

        // Loader when page starts loading
        document.addEventListener("DOMContentLoaded", () => {
            showLoader();
        });

        // Close when everything is fully loaded
        window.addEventListener("load", () => {
            hideLoader(); // closes after 500ms
        });

        // Wrap fetch with loader
        window.withLoader = function(promise) {
            showLoader();
            return promise.finally(() => hideLoader());
        }

        // Example usage
        // withLoader(fetch("/api/data")).then(r => r.json()).then(console.log);

        // Auto hook into jQuery AJAX (if using jQuery)
        if (window.jQuery) {
            $(document).ajaxStart(() => showLoader());
            $(document).ajaxStop(() => hideLoader());
        }

        document.addEventListener('DOMContentLoaded', function() {

            const submitButton = document.getElementById('submitUserForm');
            const addUserForm = document.getElementById('addUserForm');
            
            // Add event listener to the submit button
            submitButton.addEventListener('click', function(e) {
                e.preventDefault();

                const text = submitButton.textContent;

                Swal.fire({
                    title: 'Are you sure?',
                    icon: 'warning',
                    showCancelButton: true,
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Update it'
                }).then(function(result) {
                    if (result.isConfirmed) {
                        handleFormSubmission();
                    } else if (result.dismiss === Swal.DismissReason.cancel) {
                        Swal.fire("Cancelled", "No action performed.", "error");
                    }
                });
            });
            
            // Function to handle form submission
            function handleFormSubmission() {
                // Validate the form
                if (!validateForm()) {
                    return;
                }
                
                // Prepare the form data
                const formData = prepareFormData();
                
                // Show loading state
                showLoader("Processing...");
                
                // Submit the data (using fetch API)
                submitFormData(formData)
                    .then(response => {
                        // console.log(response)
                        if(response.message == "SESSION_INVALID") {
                            window.location.href = "login?session=invalid"
                            return;
                        }

                        if(response.message == 'Missing required fields.') {
                            showNotification(response.message, 'error');
                            return;
                        }

                        if(response.message == 'Invalid request type.') {
                            showNotification(response.message, 'error');
                            return;
                        }

                        if(response.success == false) {
                            showNotification(response.message, 'error');
                            return;
                        }
                        // Handle success
                        showNotification(response.message, 'success');
                        // Close the modal
                        const modal = bootstrap.Modal.getInstance(document.getElementById('addUserModal'));
                        modal.hide();
                    })
                    .catch(error => {
                        // Handle error
                        showNotification('Error adding user: ' + error.message, 'error');
                    })
                    .finally(() => {
                        // Reset loading state
                        hideLoader()
                    });
            }
            
            // Function to validate the form
            function validateForm() {
                let isValid = true;
                const requiredFields = addUserForm.querySelectorAll('[required]');
                
                // Check all required fields
                requiredFields.forEach(field => {
                    if (!field.value.trim()) {
                        isValid = false;
                        highlightError(field, 'This field is required');
                    } else {
                        removeErrorHighlight(field);
                    }
                });
                
                // Validate email format
                // const emailField = document.getElementById('email');
                // if (emailField.value && !isValidEmail(emailField.value)) {
                //     isValid = false;
                //     highlightError(emailField, 'Please enter a valid email address');
                // }
                
                // // Validate password match
                // const passwordField = document.getElementById('password');
                // const confirmPasswordField = document.getElementById('confirm_password');
                // if (passwordField.value !== confirmPasswordField.value) {
                //     isValid = false;
                //     highlightError(confirmPasswordField, 'Passwords do not match');
                // }
                
                // Validate phone number
                const phoneField = document.getElementById('phone_number');
                if (phoneField.value && !isValidPhoneNumber(phoneField.value)) {
                    isValid = false;
                    highlightError(phoneField, 'Please enter a valid phone number');
                }
                
                return isValid;
            }
            
            // Function to prepare form data
            function prepareFormData() {
                // Get security settings
                const twoFactorSms = document.querySelector('.two_factor').checked;
                const twoFactorEmail = document.querySelector('.email_auth').checked;
                const loginNotifications = document.querySelector('.login_notifications').checked;

                // console.log(typeof isEdit, userId);

                // Prepare the data object
                const formData = {
                    // Personal information
                    title: document.getElementById('title').value,
                    first_name: document.getElementById('first_name').value,
                    last_name: document.getElementById('last_name').value,
                    middle_name: document.getElementById('middle_name').value,
                    dob: document.getElementById('dob').value,
                    gender: document.getElementById('gender').value,
                    
                    // Account information
                    // username: document.getElementById('username').value,
                    // email: document.getElementById('email').value,
                    // password: document.getElementById('password').value,
                    // role: document.getElementById('role').value,
                    // level: document.getElementById('level').value,
                    
                    // Contact information
                    country_code: document.getElementById('country_code').value,
                    phone_number: document.getElementById('phone_number').value,
                    country: document.getElementById('country').value,
                    address: document.getElementById('address').value,
                    zip_code: document.getElementById('zip_code').value,
                    city: document.getElementById('city').value,
                    
                    // Security settings
                    two_factor_auth: twoFactorSms || twoFactorEmail,
                    two_factor_method: twoFactorSms ? 'SMS' : (twoFactorEmail ? 'Email' : 'None'),
                    login_notification: loginNotifications,
                    // status: document.getElementById('status').value,
                    // expire_pass: document.getElementById('expire_pass').checked,
                    requestType: 'updateUser'
                };
                
                return formData;
            }
            
            // Function to submit form data (using fetch API)
            function submitFormData(formData) {
                return new Promise((resolve, reject) => {
                    // Replace with your actual API endpoint
                    fetch('/api/users', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            // Add CSRF token if needed
                            // 'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                        },
                        body: JSON.stringify(formData)
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Server returned an error: ' + response.status);
                        }
                        return response.json();
                    })
                    .then(data => {
                        resolve(data);
                    })
                    .catch(error => {
                        reject(error);
                    });
                });
            }
            
            // Helper function to validate email format
            function isValidEmail(email) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return emailRegex.test(email);
            }
            
            // Helper function to validate phone number
            function isValidPhoneNumber(phone) {
                const phoneRegex = /^[0-9+\-\s()]{10,20}$/;
                return phoneRegex.test(phone);
            }
            
            // Helper function to highlight field with error
            function highlightError(field, message) {
                // Add error class
                field.classList.add('is-invalid');
                
                // Create or update error message
                let errorElement = field.parentNode.querySelector('.invalid-feedback');
                if (!errorElement) {
                    errorElement = document.createElement('div');
                    errorElement.className = 'invalid-feedback';
                    field.parentNode.appendChild(errorElement);
                }
                errorElement.textContent = message;
            }
            
            // Helper function to remove error highlight
            function removeErrorHighlight(field) {
                field.classList.remove('is-invalid');
                const errorElement = field.parentNode.querySelector('.invalid-feedback');
                if (errorElement) {
                    errorElement.remove();
                }
            }
            
            // Helper function to generate a unique ID
            function generateUniqueId() {
                // Implement your unique ID generation logic
                return 'user_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
            }
            
            // Add CSS for error styling
            const style = document.createElement('style');
            style.textContent = `
                .is-invalid {
                    border-color: #dc3545 !important;
                }
                .invalid-feedback {
                    display: block;
                    width: 100%;
                    margin-top: 0.25rem;
                    font-size: 0.875em;
                    color: #dc3545;
                }
            `;
            document.head.appendChild(style);
        });

        // Helper function to show notification
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

        $(document).ready(function() {
            $('.select2').select2({
                placeholder: "Choose ..."
            });
        });
    </script>

    
    <c:if test="${userInfo.registered eq 'false'}">
        <script>
            $(function () {
                $("#addUserModal").modal("show");
            });
        </script>
    </c:if>



</body>

</html>