<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<div id="wrapper">
    <!-- #page -->
    <div id="page" class="">
        <div class="sign-in-wrap">
            <div class="sign-in-box">
                <div class="left">
                    <div class="content">
                        <h3 class="heading mb-5">
                            <!-- <img src="${pageContext.request.contextPath}/assets/images/logo/terrafinder-logo.png" width="250" /> -->
                        </h3>
                        <!-- <div class="sub f12-regular text-GrayDark">Welcome again to our website</div> -->
                        <div class="sign-in-inner">
                            <h4>Sign In Here</h4>
                            <!-- SVG symbols (define once at the top of your page) -->
                            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                                <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                </symbol>
                                <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                                </symbol>
                                <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                </symbol>
                            </svg>

                            <!-- Combined error message display -->
                            <c:if test="${not empty param.error or not empty param.session or not empty param.logout}">
                                <c:set var="alertType" value="danger"/>
                                <c:set var="alertIcon" value="exclamation-triangle-fill"/>
                                <c:set var="alertMessage" value=""/>
                                
                                <c:choose>
                                    <c:when test="${param.error eq 'true'}">
                                        <c:set var="alertMessage" value="Invalid credentials"/>
                                    </c:when>
                                    <c:when test="${param.error eq 'oauth'}">
                                        <c:set var="alertMessage" value="OAuth login failed"/>
                                    </c:when>
                                    <c:when test="${param.error eq 'access_denied'}">
                                        <c:set var="alertMessage" value="Access denied"/>
                                    </c:when>
                                    <c:when test="${param.error eq 'unauthorized'}">
                                        <c:set var="alertMessage" value="Please login"/>
                                    </c:when>
                                    <c:when test="${param.error eq 'notfound'}">
                                        <c:set var="alertMessage" value="Page not found"/>
                                    </c:when>
                                    <c:when test="${param.session eq 'invalid'}">
                                        <c:set var="alertMessage" value="Invalid session"/>
                                    </c:when>
                                    <c:when test="${param.session eq 'expired'}">
                                        <c:set var="alertMessage" value="Session expired"/>
                                    </c:when>
                                    <c:when test="${param.logout eq 'true'}">
                                        <c:set var="alertType" value="success"/>
                                        <c:set var="alertIcon" value="check-circle-fill"/>
                                        <c:set var="alertMessage" value="Logged out successfully"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="alertMessage" value="Unknown error occurred"/>
                                    </c:otherwise>
                                </c:choose>
                                
                                <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" width="20" height="20" role="img" aria-label="${alertType eq 'success' ? 'Success:' : 'Danger:'}">
                                        <use xlink:href="#${alertIcon}"/>
                                    </svg>
                                    ${alertMessage}
                                    <button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>
                            <form class="form-login flex flex-column gap24" accept-charset="utf-8" method="post" action="${pageContext.request.contextPath}/user_authentication">
                                <input type="hidden" id="coordinates" name="coordinates" />
                                <!-- <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}" /> -->
                                <fieldset class="email">
                                    <div class="f14-regular mb-6">Email <span class="text-danger">*</span></div>
                                    <input class="flex-grow" type="email" placeholder="Enter your email address" name="email" tabindex="0" value="" aria-required="true" required="">
                                </fieldset>
                                <fieldset class="password">
                                    <div class="f14-regular mb-6">Password <span class="text-danger">*</span></div>
                                    <input class="password-input" type="password" placeholder="Enter your password" name="password" tabindex="0" aria-required="true" required="">
                                    <span class="show-pass">
                                        <i class="icon-view view"></i>
                                        <i class="icon-hide hide"></i>
                                    </span>
                                </fieldset>
                                <div class="tf-cart-checkbox">
                                    <div class="tf-checkbox-wrapp">
                                        <input class="checkbox-item" type="checkbox" name="transaction_checkbox" checked="">
                                        <div>
                                            <i class="icon-check"></i>
                                        </div>
                                    </div>
                                    <div class="f14-regular">
                                        By proceeding, you agree to the 
                                        <a href="#" class="f14-bold">Terms and Conditions</a>
                                    </div>
                                </div>
                                <button class="tf-button style-1 label-01 w-100 btn-login">Sign In</button>
                            </form>
                            <div>
                                <div class="f14-regular mb-6">Google sign in</div>
                                <a href="${pageContext.request.contextPath}/oauth2/authorization/google" class="f14-regular btn-signin-with">
                                    <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_779_1269)">
                                        <path d="M23.5938 10.4136L13.8044 10.4131C13.3721 10.4131 13.0217 10.7634 13.0217 11.1957V14.323C13.0217 14.7552 13.3721 15.1056 13.8044 15.1056H19.3171C18.7135 16.6722 17.5868 17.9842 16.1493 18.8178L18.5 22.887C22.2707 20.7062 24.5 16.8799 24.5 12.5965C24.5 11.9866 24.455 11.5506 24.3651 11.0597C24.2968 10.6867 23.9729 10.4136 23.5938 10.4136Z" fill="#167EE6"/>
                                        <path d="M12.5 19.8042C9.80218 19.8042 7.44699 18.3302 6.18207 16.1489L2.11304 18.4943C4.18374 22.0831 8.06283 24.4998 12.5 24.4998C14.6768 24.4998 16.7307 23.9138 18.5 22.8924V22.8868L16.1494 18.8176C15.0742 19.4412 13.8299 19.8042 12.5 19.8042Z" fill="#2BC155"/>
                                        <path d="M18.5 22.8927V22.8871L16.1494 18.8179C15.0741 19.4414 13.83 19.8044 12.5 19.8044V24.5001C14.6767 24.5001 16.7308 23.914 18.5 22.8927Z" fill="#2BC155"/>
                                        <path d="M5.19566 12.4998C5.19566 11.17 5.55856 9.92589 6.18205 8.85071L2.11302 6.50537C1.08603 8.26914 0.5 10.3175 0.5 12.4998C0.5 14.6821 1.08603 16.7304 2.11302 18.4942L6.18205 16.1489C5.55856 15.0737 5.19566 13.8296 5.19566 12.4998Z" fill="#FFD500"/>
                                        <path d="M12.5 5.19566C14.2593 5.19566 15.8753 5.82078 17.1375 6.86061C17.4488 7.11711 17.9014 7.09859 18.1867 6.81336L20.4024 4.59758C20.7261 4.27395 20.703 3.74422 20.3573 3.44431C18.2425 1.60967 15.491 0.5 12.5 0.5C8.06283 0.5 4.18374 2.91673 2.11304 6.50558L6.18207 8.85092C7.44699 6.66969 9.80218 5.19566 12.5 5.19566Z" fill="#FF4B26"/>
                                        <path d="M17.1374 6.86061C17.4488 7.11711 17.9015 7.09859 18.1866 6.81336L20.4024 4.59758C20.726 4.27395 20.7029 3.74422 20.3573 3.44431C18.2425 1.60963 15.491 0.5 12.5 0.5V5.19566C14.2592 5.19566 15.8752 5.82078 17.1374 6.86061Z" fill="#D93F21"/>
                                        </g>
                                        <defs>
                                        <clipPath id="clip0_779_1269">
                                        <rect width="24" height="24" fill="white" transform="translate(0.5 0.5)"/>
                                        </clipPath>
                                        </defs>
                                    </svg>
                                    Sign in with Google
                                </a>
                            </div>
                            <div class="f14-regular">
                                Don’t have an account? 
                                <a href="${pageContext.request.contextPath}/registration" class="f14-bold">Sign Up</a>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-12 text-center">
                            <p class="f12-regular text-GrayDark"> &copy; 
                                <script type="text/javascript">
                                    document.write(new Date().getFullYear());
                                </script>
                                <span href="#" class="font-weight-medium ms-1">ERMS v1.0. 
                                    <!-- Engineered by <img src="${pageContext.request.contextPath}/assets/images/logo/edinteq-logo.png" width="50" /> -->
                                </span>
                            </p>
                        </div> <!-- end col -->
                    </div>
                </div>
                <div class="right">
                    <!-- New thematic background elements -->
                    <div class="topographic-pattern"></div>
                    <div class="map-marker-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#4CAF50">
                            <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                        </svg>
                    </div>
                    <div class="boundary-line"></div>
                    
                    <!-- Content Container -->
                    <div class="hero-container">
                        <div class="hero-content">
                            <!-- <div class="logo-watermark">
                                <img src="${pageContext.request.contextPath}/assets/images/logo/terrafinder-logo.png" alt="TerraFinder Icon">
                            </div> -->
                            
                            <h2>Your Land, <span class="text-YellowGreen">Precisely Managed</span></h2>
                            
                            <ul class="feature-list">
                                <li>
                                    <div class="feature-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#C0FAA0">
                                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z"/>
                                        </svg>
                                    </div>
                                    <div class="feature-text">
                                        <h4>Boundary Precision</h4>
                                        <p>Accurate GPS mapping with centimeter-level accuracy</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="feature-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#C0FAA0">
                                            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm.31-8.86c-1.77-.45-2.34-.94-2.34-1.67 0-.84.79-1.43 2.1-1.43 1.38 0 1.9.66 1.94 1.64h1.71c-.05-1.34-.87-2.57-2.49-2.97V5H10.9v1.69c-1.51.32-2.72 1.3-2.72 2.81 0 1.79 1.49 2.69 3.66 3.21 1.95.46 2.34 1.15 2.34 1.87 0 .53-.39 1.39-2.1 1.39-1.6 0-2.23-.72-2.32-1.64H8.04c.1 1.7 1.36 2.66 2.86 2.97V19h2.34v-1.67c1.52-.29 2.72-1.16 2.73-2.77-.01-2.2-1.9-2.96-3.66-3.42z"/>
                                        </svg>
                                    </div>
                                    <div class="feature-text">
                                        <h4>Survey Intelligence</h4>
                                        <p>Advanced tools for professional land assessment</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="feature-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#C0FAA0">
                                            <path d="M19.35 10.04C18.67 6.59 15.64 4 12 4 9.11 4 6.6 5.64 5.35 8.04 2.34 8.36 0 10.91 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM19 18H6c-2.21 0-4-1.79-4-4 0-2.05 1.53-3.76 3.56-3.97l1.07-.11.5-.95C8.08 7.14 9.94 6 12 6c2.62 0 4.88 1.86 5.39 4.43l.3 1.5 1.53.11c1.56.1 2.78 1.41 2.78 2.96 0 1.65-1.35 3-3 3z"/>
                                        </svg>
                                    </div>
                                    <div class="feature-text">
                                        <h4>Document Cloud</h4>
                                        <p>Secure storage for deeds, surveys, and legal documents</p>
                                    </div>
                                </li>
                            </ul>
                            
                            <div class="cta-badge">
                                Trusted by <strong>12,487</strong> landowners nationwide
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page -->
</div>

<script>

$(document).ready(function() {
    // For coordinates (requires user permission)
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(position => {
            document.getElementById('coordinates').value = 
                position.coords.latitude+','+position.coords.longitude;
        });
    }

    $(".btn-login").on('click', function(e) {
        e.preventdefault();

        
    })
});
</script>
