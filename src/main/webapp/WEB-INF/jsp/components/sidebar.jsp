<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <aside class="pe-app-sidebar" id="sidebar">
    <div class="pe-app-sidebar-logo px-6 d-flex align-items-center position-relative">
        <!-- Brand -->
        <a href="${pageContext.request.contextPath}/" class="d-flex align-items-end logo-main">
            <img height="35" width="34" class="logo-dark" alt="Dark Logo" src="assets/images/logo-md.png">
            <img height="35" width="34" class="logo-light" alt="Light Logo" src="assets/images/logo-md-light.png">
            <h3 class="text-body-emphasis fw-bolder mb-0 ms-1">Urbix</h3>
        </a>
    </div>

    <nav class="pe-app-sidebar-menu nav nav-pills d-flex flex-column" data-simplebar id="sidebar-simplebar" style="height:100%;">
        <div class="flex-grow-1 d-flex flex-column w-100">
            <ul class="pe-main-menu list-unstyled">
               <li class="pe-menu-title">Main</li>
                <li class="pe-slide pe-has-sub">
                    <a href="${pageContext.request.contextPath}/dashboard" class="pe-nav-link">
                        <i class="ri-dashboard-line pe-nav-icon"></i>
                        <span class="pe-nav-content">Dashboards</span>
                    </a>
                </li>
                <li class="pe-slide pe-has-sub">
                    <a href="${pageContext.request.contextPath}/track_application" class="pe-nav-link">
                        <i class="ri-search-line pe-nav-icon"></i>
                        <span class="pe-nav-content">Track Application</span>
                    </a>
                </li>
                <li class="pe-slide pe-has-sub">
                    <a href="${pageContext.request.contextPath}/appointments" class="pe-nav-link">
                        <i class="ri-calendar-line pe-nav-icon"></i>
                        <span class="pe-nav-content">Appointments</span>
                    </a>
                </li>
                <li class="pe-slide pe-has-sub">
                    <a href="${pageContext.request.contextPath}/lease_application" class="pe-nav-link">
                        <i class="ri-draft-line pe-nav-icon"></i>
                        <span class="pe-nav-content">Lease Application</span>
                    </a>
                </li>
            </ul>
        </div>
        
        <!-- Moved to bottom: Sticky bottom widget with last login -->
        <div class="mt-auto">
            <div class="sidebar-widget text-center pb-3 pt-2 border-top">
                <p class="text-muted mb-2 small">Last Login: ${lastLogin}</p>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger rounded-pill w-100" onclick="logoutLink(event, this)">
                    <i class="bi bi-box-arrow-right me-2"></i> Sign Out
                </a>
            </div>
        </div>
    </nav>
</aside>