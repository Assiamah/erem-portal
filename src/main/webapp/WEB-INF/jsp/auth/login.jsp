<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!-- START -->
<div class="position-fixed top-0 bottom-0 end-0 start-0 z-0 bg-pattern"></div>
<div class="auth-pattern-shapes d-none d-lg-block"></div>
<div class="auth-pattern-outline d-none d-lg-block"></div>
<div class="auth-pattern-shape extra d-none d-lg-block"></div>
<div class="auth-pattern-extra d-none d-lg-block"></div>
<!-- <header class="px-3 px-md-8 py-5 position-absolute top-0 d-flex justify-content-between align-items-center w-100 z-1">
    <a href="index.html" class="d-flex align-items-end logo-main">
        <img height="35" class="logo-dark" alt="Dark Logo" src="assets/images/logo-md.png">
        <h3 class="text-body-emphasis fw-bolder mb-0 ms-1">Urbix</h3>
    </a>
    <ul class="list-inline mb-0">
        <li class="list-inline-item pe-4 border-end"><a href="index.html" class="link-body-emphasis">Home</a></li>
        <li class="list-inline-item pe-4 border-end"><a href="#!" class="link-body-emphasis">Support</a></li>
        <li class="list-inline-item"><a href="#!" class="link-body-emphasis">Documentation</a></li>
    </ul>
</header> -->
<div class="container">
    <div class="row justify-content-center align-items-center min-vh-100 pt-20 pb-10">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
            <div class="card mx-xxl-8 shadow-none">
                <div class="card-body p-8">
                    <h3 class="fw-medium text-center">Welcome back!</h3>
                    <p class="mb-8 text-muted text-center">Enter your credentials to sign in</p>
                    <form>
                        <div class="mb-4">
                            <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="email" placeholder="Enter your email" required>
                        </div>
                        <div class="mb-4">
                            <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                            <div class="position-relative">
                                <input type="password" class="form-control" id="password" placeholder="Enter your password" required>
                                <button type="button" class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted toggle-password" id="toggle-password" data-target="password"><i class="ri-eye-off-line align-middle"></i></button>
                            </div>
                        </div>
                        <div class="my-6">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="rememberMe">
                                    <label class="form-check-label" for="rememberMe">Stay signed in</label>
                                </div>
                                <div class="form-text">
                                    <a href="auth-forgot-password.html" class="link">Forgot password?</a>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary w-100 mb-4">Sign In</button>
                            <a href="${pageContext.request.contextPath}/oauth2/authorization/google" class="btn btn-outline-light w-100 d-flex align-items-center gap-2 justify-content-center text-muted">
                                <img src="assets/images/google.png" alt="Google Logo" class="h-20px w-20px">Sign in with Google
                            </a>
                        </div>
                    </form>
                    <p class="text-center mt-6 mb-0 text-muted fs-13">Don't have an account? <a href="auth-signup.html" class="link fw-semibold">Sign up here</a></p>
                </div>
            </div>
            <p class="position-relative text-center fs-13 mb-0">©
                <script>document.write(new Date().getFullYear())</script> EREM.
            </p>
        </div>
    </div>
</div>