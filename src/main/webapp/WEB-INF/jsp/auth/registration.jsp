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
                            <h4>Create An Account</h4>
                            <form class="form-login flex flex-column gap24" accept-charset="utf-8" action="index.html">
                                <div class="row">
                                    <div class="col-6">
                                        <fieldset class="first_name">
                                            <div class="f14-regular mb-6">First name <span class="text-danger">*</span></div>
                                            <input class="flex-grow" type="text"  name="first_name" tabindex="0" value="" aria-required="true" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-6">
                                        <fieldset class="last_name">
                                            <div class="f14-regular mb-6">Surname <span class="text-danger">*</span></div>
                                            <input class="flex-grow" type="text" name="last_name" tabindex="0" aria-required="true" required="">
                                        </fieldset>
                                    </div>
                                </div>
                                <fieldset class="dob">
                                    <div class="f14-regular mb-6">Date of Birth <span class="text-danger">*</span></div>
                                    <input class="flex-grow" type="date" name="dob" tabindex="0" aria-required="true" required="">
                                </fieldset>
                                <fieldset class="email">
                                    <div class="f14-regular mb-6">Gender <span class="text-danger">*</span></div>
                                    <select class="flex-grow w-100" type="text" name="gender" tabindex="0" aria-required="true" required="">
                                        <option selected disabled>-- select --</option>
                                        <option value="M">Male</option>
                                        <option value="F">Female</option>
                                    </select>
                                </fieldset>
                                <fieldset class="email">
                                    <div class="f14-regular mb-6">Email <span class="text-danger">*</span></div>
                                    <input class="flex-grow" type="email" placeholder="" name="email" tabindex="0" value="" aria-required="true" required="">
                                </fieldset>
                                <fieldset class="password">
                                    <div class="f14-regular mb-6">Password <span class="text-danger">*</span></div>
                                    <input class="password-input" type="password" placeholder="" name="password" tabindex="0" aria-required="true" required="">
                                    <span class="show-pass">
                                        <i class="icon-view view"></i>
                                        <i class="icon-hide hide"></i>
                                    </span>
                                </fieldset>
                                <fieldset class="password">
                                    <div class="f14-regular mb-6">Confirm Password <span class="text-danger">*</span></div>
                                    <input class="password-input" type="password" placeholder="" name="confirm_password" tabindex="0" aria-required="true" required="">
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
                                <button class="tf-button style-1 label-01 w-100">Sign Up</button>
                            </form>
                            <div class="f14-regular">
                                Already have an account?
                                <a href="${pageContext.request.contextPath}/login" class="f14-bold">Sign In</a>
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
});
</script>
