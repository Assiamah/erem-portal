<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="offcanvas_" id="signInForm">
    <button class="btn-close" id="closeBtn">
        <i class="fas fa-times"></i>
    </button>
    
    <div class="card mx-xxl-8 shadow-none">
        <div class="card-body p-8">

            <form id="loginForm" class="auth-form mb-3">
                <h3 class="fw-medium text-center">Welcome back!</h3>
                <p class="mb-8 text-muted text-center">Enter your credentials to sign in</p>
                <div id="divLoginAlert" class="mb-4"></div>
                <div class="mb-4">
                    <label for="email" class="form-label">Email Address <span class="text-danger">*</span></label>
                    <input type="text" class="form-control auth-form-control" id="email" placeholder="name@example.com" required>
                </div>
                <div class="mb-4">
                    <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                    <div class="password-container">
                        <input type="password" class="form-control auth-form-control" id="password" placeholder="Enter your password" required>
                        <button type="button" class="btn-toggle-password" id="togglePassword">
                            <i class="far fa-eye"></i>
                        </button>
                    </div>
                </div>
                <div class="form-options">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>
                    <a href="#" class="forgot-link switch-form" data-target="forgotForm">Forgot password?</a>
                </div>
                
                <button type="button" class="btn-login" onclick="checkLogin()">Sign In</button>
                
                <div class="divider">
                    <span class="divider-text">Or continue with</span>
                </div>
                
                <a  href="${pageContext.request.contextPath}/oauth2/authorization/google" class="btn-google">
                    <img src="assets/images/google.png" alt="Google Logo" class="h-20px w-20px">
                    Sign in with Google
                </a>
                
                <div class="signup-text">
                    Don't have an account? <a href="#" class="signup-link switch-form" data-target="registerForm">Sign up here</a>
                </div>
            </form>

            <!-- REGISTRATION FORM -->
            <form id="registerForm" class="auth-form d-none">
                <h3 class="fw-medium text-center">Create an account</h3>
                <p class="mb-8 text-muted text-center">Enter your email to continue</p>
                <div id="divRegAlert" class="mb-4"></div>
                <div class="mb-4">
                    <label for="email" class="form-label">Email Address <span class="text-danger">*</span></label>
                    <input type="email" class="form-control auth-form-control" id="registerEmail" placeholder="name@example.com" required>
                </div>

                <button type="button" class="btn-register w-100 mt-3" onclick="checkRegisterEmail()">Continue</button>

                <div class="signup-text text-center mt-3">
                    Already have an account? 
                    <a href="#" class="switch-form" data-target="loginForm">Login here</a>
                </div>
            </form>

            <form id="loginOtpForm" class="auth-form d-none">
                <div class="back-link switch-form" data-target="loginForm">
                    <i class="fas fa-arrow-left me-1"></i> Back
                </div>
                <p class="text-muted mb-3">We've sent a verification code to your email: <span id="loginEmailAddress"></span></p>
                <div id="divVerifyLoginAlert" class="mb-4"></div>
                <p class="text-muted mb-3">OTP Code: <span id="loginCode"></span></p>
                <h6 class="timer mt-2 mb-2" id="loginTimer">02:00</h6>
                <div class="mb-4">
                    <label for="login2FACode" class="form-label">Verification Code <span class="text-danger">*</span></label>
                    <input type="text" class="form-control auth-form-control" id="login2FACode" placeholder="Enter 6-digit code" required maxlength="6">
                </div>
                <button type="button" class="btn-verify-login" onclick="verifyLogin2FA()">Verify</button>
                <p class="text-muted">If you didn't receive the code, please check your spam folder or <span class="resend-link" onclick="resendLoginCode()">Resend code</span></p>
            </form>

            <!-- 2FA REGISTRATION FORM -->
            <form id="2faRegistrationForm" class="auth-form d-none">
                <div class="back-link switch-form" data-target="registerForm">
                    <i class="fas fa-arrow-left me-1"></i> Back
                </div>
                <p class="text-muted mb-3">We've sent a verification code to your email: <span id="registerEmailAddress"></span></p>
                <div id="divVerifyRegAlert" class="mb-4"></div>
                <p class="text-muted mb-3">OTP Code: <span id="registerCode"></span></p>
                <h6 class="timer mt-2 mb-2" id="registerTimer">02:00</h6>
                <div class="mb-4">
                    <label for="register2FACode" class="form-label">Verification Code <span class="text-danger">*</span></label>
                    <input type="text" class="form-control auth-form-control" id="register2FACode" placeholder="Enter 6-digit code" required maxlength="6">
                </div>
                <button type="button" class="btn-login btn-verify-register" onclick="verifyRegister2FA()">Verify</button>
                <p class="text-muted">If you didn't receive the code, please check your spam folder or <span class="resend-link" onclick="resendRegisterCode()">Resend code</span></p>
            </form>

            <!-- CREATE PASSWORD -->
             <form id="createRegPasswordForm" class="auth-form d-none">
                <div class="back-link switch-form" data-target="2faRegistrationForm">
                    <i class="fas fa-arrow-left me-1"></i> Back
                </div>
                <p class="mb-8 text-muted text-center">Create your password</p>
                <div id="divCreateRegPasswordAlert" class="mb-4"></div>
                <div class="mb-4">
                    <label for="regPassword" class="form-label">Password <span class="text-danger">*</span></label>
                    <input type="password" class="form-control auth-form-control" id="regPassword" placeholder="Enter password" required>
                </div>
                <div class="mb-4">
                    <label for="regConfirmPassword" class="form-label">Confirm Password <span class="text-danger">*</span></label>
                    <input type="password" class="form-control auth-form-control" id="regConfirmPassword" placeholder="Confirm password" required>
                </div>
                <button type="button" class="btn btn-warning btn-create-reg-password w-100 mt-3" onclick="createRegPassword()">Create Password</button>
                <div class="signup-text text-center mt-3">
                    Do you want to go back to Login Page? 
                    <a href="#" class="switch-form" data-target="loginForm">Click here</a>
                </div>
             </form>

            <!-- FORGOT PASSWORD FORM -->
            <form id="forgotForm" class="auth-form d-none">
                <h3 class="fw-medium text-center">Reset your password</h3>
                <p class="mb-8 text-muted text-center">Enter your email to reset</p>

                <div class="mb-4">
                    <label for="forgotEmail" class="form-label">Email Address <span class="text-danger">*</span></label>
                    <input type="email" class="form-control auth-form-control" id="forgotEmail" placeholder="name@example.com" required>
                </div>

                <button type="submit" class="btn btn-warning btn-forgot w-100 mt-3">Send Reset Link</button>

                <div class="signup-text text-center mt-3">
                    <a href="#" class="switch-form" data-target="loginForm">Back to Login</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Add your house/community image here -->
    <div class="text-center mt-4 bottom-image">
        <img src="${pageContext.request.contextPath}/assets/images/auth/image1.png" alt="House Illustration" class="img-fluid" style="max-height: 300px; width: 300px;">
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Get DOM elements
        const signInBtn = document.getElementById('signInBtn');
        const closeBtn = document.getElementById('closeBtn');
        const overlay = document.getElementById('overlay');
        const signInForm = document.getElementById('signInForm');
        const loginForm = document.getElementById('loginForm');
        
        // Open offcanvas
        signInBtn.addEventListener('click', () => {
            signInForm.classList.add('active');
            overlay.classList.add('active');
            document.body.style.overflow = 'hidden';
        });
        
        // Close offcanvas
        function closeOffcanvas() {
            signInForm.classList.remove('active');
            overlay.classList.remove('active');
            document.body.style.overflow = 'auto';
        }
        
        closeBtn.addEventListener('click', closeOffcanvas);
        overlay.addEventListener('click', closeOffcanvas);
        
        // Handle form submission
        loginForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            // Here you would typically validate and send the data to a server
            console.log('Sign in attempted with:', { email, password });
            
            // Show success message (in a real app, you would handle properly)
            alert('Sign in successful! (This is just a demo)');
            closeOffcanvas();
        });
        
        // Close with Escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && signInForm.classList.contains('active')) {
                closeOffcanvas();
            }
        });
    });

    // Toggle password visibility
    document.getElementById('togglePassword').addEventListener('click', function() {
        const passwordInput = document.getElementById('password');
        const icon = this.querySelector('i');
        
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    });

    document.addEventListener("DOMContentLoaded", function () {
        const switchLinks = document.querySelectorAll(".switch-form");
        const forms = document.querySelectorAll(".auth-form");

        switchLinks.forEach(link => {
            link.addEventListener("click", function (e) {
                e.preventDefault();
                const targetId = this.getAttribute("data-target");

                // Hide all forms
                forms.forEach(form => form.classList.add("d-none"));

                // Show selected form
                document.getElementById(targetId).classList.remove("d-none");
            });
        });
    });

    function checkRegisterEmail(){
        const email = document.getElementById('registerEmail').value;

        if (!validateRegistrationForm()) {
            return;
        }

        if (!validateEmail(email)) {
            highlightError(document.getElementById('registerEmail'), 'Please enter a valid email address');
            return;
        }

        var $this = $('.btn-register');
        var loadingText = '<span class=""><i class="mdi mdi-spin mdi-loading me-2"></i> Checking...</span>';

        if ($('.btn-register').html() !== loadingText) {
            $this.data('original-text', $('.btn-register').html());
            $this.html(loadingText);
            $('.btn-register').prop('disabled', true);
        }

        const formData = {
            email: email,
        }

        fetch('/api/auth/check-registration-email', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => response.json())
        .then(data => {
            // console.log(data)
            if (data.success) {
                const jsonData = data.data;
                $('#registerCode').text(jsonData.pin);
                $("#registerForm").addClass("d-none");
                $("#2faRegistrationForm").removeClass("d-none");
                $('#registerTimer').addClass('text-secondary');
                $('#registerTimer').removeClass('text-danger');
                $('.alert').addClass("d-none");

                document.getElementById("registerEmailAddress").innerText = maskEmail(email);

                var loadingText = '<span class="">Continue</span>';

                if ($('.btn-register').html() !== loadingText) {
                    $this.data('original-text', $('.btn-register').html());
                    $this.html(loadingText);
                    $('.btn-register').prop('disabled', false);
                }

                startCountdown(true);

            } else {
                $('.alert').removeClass("d-none");
                const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-danger small" role="alert" style="background-color: rgb(214 53 69 / 10%);">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        The email has already has been registered
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`

                document.getElementById('divRegAlert').innerHTML = alert;

                var loadingText = '<span class="">Continue</span>';

                if ($('.btn-register').html() !== loadingText) {
                    $this.data('original-text', $('.btn-register').html());
                    $this.html(loadingText);
                    $('.btn-register').prop('disabled', false);
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
            //alert('Error creating slot');
            showNotification('Error: ' + error, 'error');

            var loadingText = '<span class="">Continue</span>';

            if ($('.btn-register').html() !== loadingText) {
                $this.data('original-text', $('.btn-register').html());
                $this.html(loadingText);
                $('.btn-register').prop('disabled', false);
            }
        });
    }

    function validateEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }

    const registerForm = document.getElementById('registerForm');

    function validateRegistrationForm() {
        let isValid = true;
        const requiredFields = registerForm.querySelectorAll('[required]');
        
        // Check all required fields
        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                isValid = false;
                highlightError(field, 'This field is required');
            } else {
                removeErrorHighlight(field);
            }
        });
        
        return isValid;
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

    const KEY = "otpCountdownTarget"; // stores target timestamp (ms)
    const DURATION = 120; // seconds
    const timerEl = document.getElementById("registerTimer");

    let intervalId = null;

    function formatMMSS(totalSeconds) {
        const m = Math.floor(totalSeconds / 60).toString().padStart(2, "0");
        const s = Math.floor(totalSeconds % 60).toString().padStart(2, "0");
        return m+':'+s;
    }

    function getOrCreateTarget(fromNowSeconds = DURATION) {
        let t = localStorage.getItem(KEY);
        const now = Date.now();
        if (!t || Number(t) <= now) {
            // create new target only if none exists or already expired
            t = String(now + fromNowSeconds * 1000);
            localStorage.setItem(KEY, t);
        }
        return Number(t);
    }

    // function startCountdown() {
    //     const target = getOrCreateTarget();
    //     updateUI(target);
    //     if (intervalId) clearInterval(intervalId);
    //     intervalId = setInterval(() => updateUI(Number(localStorage.getItem(KEY))), 250);
    // }

    function startCountdown(restart = false) {
        const target = restart
            ? Date.now() + DURATION * 1000 // always new target
            : getOrCreateTarget();

        localStorage.setItem(KEY, target);

        updateUI(target);
        if (intervalId) clearInterval(intervalId);
        intervalId = setInterval(() => updateUI(Number(localStorage.getItem(KEY))), 250);
    }

    function updateUI(targetTs) {
        const now = Date.now();
        const remaining = Math.max(0, Math.ceil((targetTs - now) / 1000));
        timerEl.textContent = formatMMSS(remaining);

        if (remaining <= 0 && intervalId) {
            clearInterval(intervalId);
            intervalId = null;
            localStorage.removeItem(KEY); // clear when expired
            // 👉 Here you can redirect, disable OTP input, or show a "Resend OTP" link
            timerEl.textContent = "Expired";
            $('#registerTimer').addClass('text-danger');
        }
    }

    function resendRegisterCode(){
        $(".btn-register").trigger('click');
    }

    function maskEmail(email) {
        const [user, domain] = email.split("@");

        // Show first 2 characters, mask the rest
        const maskedUser = user.substring(0, 2) + "*".repeat(Math.max(user.length - 2, 0));

        // Optionally mask part of domain too
        const [domainName, domainExt] = domain.split(".");
        const maskedDomain = domainName.substring(0, 1) + "***" + "." + domainExt;

        return maskedUser + "@" + maskedDomain;
    }

    function verifyRegister2FA(){
        const otpCode = $("#register2FACode").val();

        if(!validate2faRegistrationForm()){
            return;
        }

        var $this = $('.btn-verify-register');
        var loadingText = '<span class=""><i class="mdi mdi-spin mdi-loading me-2"></i> Verifying...</span>';

        if ($('.btn-verify-register').html() !== loadingText) {
            $this.data('original-text', $('.btn-verify-register').html());
            $this.html(loadingText);
            $('.btn-verify-register').prop('disabled', true);
        }

        const formData = {
            otp_code: otpCode,
        }

        fetch('/api/auth/verify-registration-email', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => response.json())
        .then(data => {
            // console.log(data)
            if(data.status == 'error'){
                const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-danger small" role="alert" style="background-color: rgb(214 53 69 / 10%);">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        Session expired, please resend the code.
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`

                document.getElementById('divVerifyRegAlert').innerHTML = alert;

                var loadingText = '<span class="">Continue</span>';

                if ($('.btn-verify-register').html() !== loadingText) {
                    $this.data('original-text', $('.btn-verify-register').html());
                    $this.html(loadingText);
                    $('.btn-verify-register').prop('disabled', false);
                }

                return;
            }

            if (data.success) {
                const jsonData = data.data;
                $("#2faRegistrationForm").addClass("d-none");
                $("#createRegPasswordForm").removeClass("d-none");

                var loadingText = '<span class="">Continue</span>';

                if ($('.btn-create-reg-password').html() !== loadingText) {
                    $this.data('original-text', $('.btn-create-reg-password').html());
                    $this.html(loadingText);
                    $('.btn-create-reg-password').prop('disabled', false);
                }

            } else {
                const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-danger small" role="alert" style="background-color: rgb(214 53 69 / 10%);">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        Incorrect OTP Code entered.
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`

                document.getElementById('divVerifyRegAlert').innerHTML = alert;

                var loadingText = '<span class="">Continue</span>';

                if ($('.btn-verify-register').html() !== loadingText) {
                    $this.data('original-text', $('.btn-verify-register').html());
                    $this.html(loadingText);
                    $('.btn-verify-register').prop('disabled', false);
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
            //alert('Error creating slot');
            showNotification('Error: ' + error, 'error');

            var loadingText = '<span class="">Continue</span>';

            if ($('.btn-register').html() !== loadingText) {
                $this.data('original-text', $('.btn-register').html());
                $this.html(loadingText);
                $('.btn-register').prop('disabled', false);
            }
        });
    }

    const register2FAForm = document.getElementById('2faRegistrationForm');

    function validate2faRegistrationForm() {
        let isValid = true;
        const requiredFields = register2FAForm.querySelectorAll('[required]');
        
        // Check all required fields
        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                isValid = false;
                highlightError(field, 'This field is required');
            } else {
                removeErrorHighlight(field);
            }
        });
        
        return isValid;
    }

    const createRegPasswordForm = document.getElementById('createRegPasswordForm');

    function validateCreateRegPasswordForm() {
        let isValid = true;
        const requiredFields = createRegPasswordForm.querySelectorAll('[required]');
        
        // Check all required fields
        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                isValid = false;
                highlightError(field, 'This field is required');
            } else {
                removeErrorHighlight(field);
            }
        });
        
        return isValid;
    }

    function createRegPassword() {

        const password = createRegPasswordForm.querySelector('#regPassword').value;
        const confirmPassword = createRegPasswordForm.querySelector('#regConfirmPassword').value;

        if (!validateCreateRegPasswordForm()) {
            return;
        }

        if (password !== confirmPassword) {
            const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-danger small" role="alert" style="background-color: rgb(214 53 69 / 10%);">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        Passwords do not match.
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`

            document.getElementById('divCreateRegPasswordAlert').innerHTML = alert;

            return;
        }

        var $this = $('.btn-create-reg-password');
        var loadingText = '<span class=""><i class="mdi mdi-spin mdi-loading me-2"></i> Creating...</span>';

        if ($('.btn-create-reg-password').html() !== loadingText) {
            $this.data('original-text', $('.btn-create-reg-password').html());
            $this.html(loadingText);
            $('.btn-create-reg-password').prop('disabled', true);
        }

        const formData = {
            password: password
        }

        fetch('/api/auth/create-portal-user-password', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => response.json())
        .then(data => {
            // console.log(data)
            if(data.status == 'error'){
                const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-danger small" role="alert" style="background-color: rgb(214 53 69 / 10%);">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        Session expired, please resend the code.
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`

                document.getElementById('divCreateRegPasswordAlert').innerHTML = alert;

                var loadingText = '<span class="">Create Password</span>';

                if ($('.btn-create-reg-password').html() !== loadingText) {
                    $this.data('original-text', $('.btn-create-reg-password').html());
                    $this.html(loadingText);
                    $('.btn-create-reg-password').prop('disabled', false);
                }

                return;
            }

            if (data.success) {
                const jsonData = data.data;
                $("#createRegPasswordForm").addClass("d-none");
                $("#loginForm").removeClass("d-none");

                var loadingText = '<span class="">Create Password</span>';

                if ($('.btn-create-reg-password').html() !== loadingText) {
                    $this.data('original-text', $('.btn-create-reg-password').html());
                    $this.html(loadingText);
                    $('.btn-create-reg-password').prop('disabled', false);
                }

                const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-success small" role="alert" style="background-color: rgb(24 164 56 / 10%);">
                        <i class="bi bi-check-circle-fill me-2"></i>
                        Account created successfully. Login to start your session.
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`

                document.getElementById('divLoginAlert').innerHTML = alert;

            } else {
                const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-danger small" role="alert" style="background-color: rgb(214 53 69 / 10%);">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        Error! Something went wrong, try again.
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`

                document.getElementById('divCreateRegPasswordAlert').innerHTML = alert;

                var loadingText = '<span class="">Create Password</span>';

                if ($('.btn-create-reg-password').html() !== loadingText) {
                    $this.data('original-text', $('.btn-create-reg-password').html());
                    $this.html(loadingText);
                    $('.btn-create-reg-password').prop('disabled', false);
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
            //alert('Error creating slot');
            showNotification('Error: ' + error, 'error');

            var loadingText = '<span class="">Continue</span>';

            if ($('.btn-register').html() !== loadingText) {
                $this.data('original-text', $('.btn-register').html());
                $this.html(loadingText);
                $('.btn-register').prop('disabled', false);
            }
        });

    }

    const loginForm = document.getElementById('loginForm');

    function checkLogin(){

        const email = loginForm.querySelector('#email').value;
        const password = loginForm.querySelector('#password').value;

        if (!validateEmail(email)) {
            highlightError(document.getElementById('email'), 'Please enter a valid email address');
            return;
        }

        if (!validateLoginForm()) {
            return;
        }

        const formData = {
            email: email,
            password: password
        }

        var $this = $('.btn-login');
        var loadingText = '<span class=""><i class="mdi mdi-spin mdi-loading me-2"></i>Authenticating...</span>';

        if ($('.btn-login').html() !== loadingText) {
            $this.data('original-text', $('.btn-login').html());
            $this.html(loadingText);
            $('.btn-login').prop('disabled', true);
        }

        fetch('/api/auth/user-authentication', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => response.json())
        .then(data => {
            // console.log(data)
            if(data.status == 'error'){
                const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-danger small" role="alert" style="background-color: rgb(214 53 69 / 10%);">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        `+data.message+`
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`
                    document.getElementById('divLoginAlert').innerHTML = alert;

                var loadingText = '<span class="">Sign In</span>';

                if ($('.btn-login').html() !== loadingText) {
                    $this.data('original-text', $('.btn-login').html());
                    $this.html(loadingText);
                    $('.btn-login').prop('disabled', false);
                }

                return;
            }

            if (data.success) {

                const jsonData = data.data;
                $('#loginCode').text(jsonData.pin);
                $("#loginForm").addClass("d-none");
                $("#loginOtpForm").removeClass("d-none");
                $('#loginTimer').addClass('text-secondary');
                $('#loginTimer').removeClass('text-danger');
                $('.alert').addClass("d-none");

                document.getElementById("loginEmailAddress").innerText = maskEmail(email);

                var loadingText = '<span class="">Sign In</span>';

                if ($('.btn-login').html() !== loadingText) {
                    $this.data('original-text', $('.btn-login').html());
                    $this.html(loadingText);
                    $('.btn-login').prop('disabled', false);
                }

                startCountdown_(true);

            } else {
                const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-danger small" role="alert" style="background-color: rgb(214 53 69 / 10%);">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        Error! Something went wrong, try again.
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`
                    document.getElementById('divLoginAlert').innerHTML = alert;

                var loadingText = '<span class="">Sign In</span>';

                if ($('.btn-login').html() !== loadingText) {
                    $this.data('original-text', $('.btn-login').html());
                    $this.html(loadingText);
                    $('.btn-login').prop('disabled', false);
                }
            }

        })
        .catch(error => {
            console.error('Error:', error);
            //alert('Error logging in');
            showNotification('Error: ' + error, 'error');

            var loadingText = '<span class="">Sign In</span>';

            if ($('.btn-login').html() !== loadingText) {
                $this.data('original-text', $('.btn-login').html());
                $this.html(loadingText);
                $('.btn-login').prop('disabled', false);
            }
        });

    }

    function validateLoginForm(){
        let isValid = true;
        const requiredFields = loginForm.querySelectorAll('[required]');
        
        // Check all required fields
        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                isValid = false;
                highlightError(field, 'This field is required');
            } else {
                removeErrorHighlight(field);
            }
        });
        
        return isValid;
    }

    const timerEl_ = document.getElementById("loginTimer");

    // function formatMMSS(totalSeconds) {
    //     const m = Math.floor(totalSeconds / 60).toString().padStart(2, "0");
    //     const s = Math.floor(totalSeconds % 60).toString().padStart(2, "0");
    //     return m+':'+s;
    // }

    // function getOrCreateTarget(fromNowSeconds = DURATION) {
    //     let t = localStorage.getItem(KEY);
    //     const now = Date.now();
    //     if (!t || Number(t) <= now) {
    //         // create new target only if none exists or already expired
    //         t = String(now + fromNowSeconds * 1000);
    //         localStorage.setItem(KEY, t);
    //     }
    //     return Number(t);
    // }

    // function startCountdown() {
    //     const target = getOrCreateTarget();
    //     updateUI(target);
    //     if (intervalId) clearInterval(intervalId);
    //     intervalId = setInterval(() => updateUI(Number(localStorage.getItem(KEY))), 250);
    // }

    function startCountdown_(restart = false) {
        const target = restart
            ? Date.now() + DURATION * 1000 // always new target
            : getOrCreateTarget();

        localStorage.setItem(KEY, target);

        updateUI_(target);
        if (intervalId) clearInterval(intervalId);
        intervalId = setInterval(() => updateUI_(Number(localStorage.getItem(KEY))), 250);
    }

    function updateUI_(targetTs) {
        const now = Date.now();
        const remaining = Math.max(0, Math.ceil((targetTs - now) / 1000));
        timerEl_.textContent = formatMMSS(remaining);

        if (remaining <= 0 && intervalId) {
            clearInterval(intervalId);
            intervalId = null;
            localStorage.removeItem(KEY); // clear when expired
            // 👉 Here you can redirect, disable OTP input, or show a "Resend OTP" link
            timerEl_.textContent = "Expired";
            $('#loginTimer').addClass('text-danger');
        }
    }

    function resendLoginCode(){
        $(".btn-login").trigger('click');
    }

    function verifyLogin2FA(){
        const otpCode = $("#login2FACode").val();

        if(!validate2faLoginForm()){
            return;
        }

        var $this = $('.btn-verify-login');
        var loadingText = '<span class=""><i class="mdi mdi-spin mdi-loading me-2"></i> Verifying...</span>';

        if ($('.btn-verify-login').html() !== loadingText) {
            $this.data('original-text', $('.btn-verify-login').html());
            $this.html(loadingText);
            $('.btn-verify-login').prop('disabled', true);
        }

        const formData = {
            otp_code: otpCode,
        }

        fetch('/api/auth/verify-login-email', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => response.json())
        .then(data => {
             console.log(data)
            if(data.status == 'error'){
                const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-danger small" role="alert" style="background-color: rgb(214 53 69 / 10%);">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        Session expired, please resend the code.
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`

                document.getElementById('divVerifyLoginAlert').innerHTML = alert;

                var loadingText = '<span class="">Verify</span>';

                if ($('.btn-verify-login').html() !== loadingText) {
                    $this.data('original-text', $('.btn-verify-login').html());
                    $this.html(loadingText);
                    $('.btn-verify-login').prop('disabled', false);
                }

                return;
            }

            if (data.success) {
                
                showNotification('Login successful', 'success');
                window.location.href = '/';

            } else {
                const alert = 
                    `<div class="alert alert-dismissible fade show rounded-pill d-flex align-items-center text-danger small" role="alert" style="background-color: rgb(214 53 69 / 10%);">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        Incorrect OTP Code entered.
                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                    </div>`

                document.getElementById('divVerifyLoginAlert').innerHTML = alert;

                var loadingText = '<span class="">Verify</span>';

                if ($('.btn-verify-login').html() !== loadingText) {
                    $this.data('original-text', $('.btn-verify-login').html());
                    $this.html(loadingText);
                    $('.btn-verify-login').prop('disabled', false);
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
            //alert('Error creating slot');
            showNotification('Error: ' + error, 'error');

            var loadingText = '<span class="">Verify</span>';

            if ($('.btn-verify-login').html() !== loadingText) {
                $this.data('original-text', $('.btn-verify-login').html());
                $this.html(loadingText);
                $('.btn-verify-login').prop('disabled', false);
            }
        });
    }

    const login2FAForm = document.getElementById('loginForm');

    function validate2faLoginForm() {
        let isValid = true;
        const requiredFields = login2FAForm.querySelectorAll('[required]');
        
        // Check all required fields
        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                isValid = false;
                highlightError(field, 'This field is required');
            } else {
                removeErrorHighlight(field);
            }
        });
        
        return isValid;
    }

</script>