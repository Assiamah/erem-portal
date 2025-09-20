package com.app.erms.controllers;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

// import com.app.erms.config.WebServiceURLConfig;
// import com.app.erms.services.AppointmentService;
import com.app.erms.utils.isAuthenticatedUtil;
import com.fasterxml.jackson.core.type.TypeReference;
// import com.fasterxml.jackson.core.type.TypeReference;
// import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class ServicesController {

    // private final WebServiceURLConfig wsURLConfig;
    // private final AppointmentService appointmentService;

    // public ServicesController(WebServiceURLConfig wsURLConfig, AppointmentService appointmentService) {
    //     this.wsURLConfig = wsURLConfig;
    //     this.appointmentService = appointmentService;
    // }

    @Autowired
    private isAuthenticatedUtil isAuthenticatedUtil;

    @GetMapping("/lease_application")
    public String leaseApplication(Model model, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            model.addAttribute("sessionOut", "Authentication failed! Session has expired.");
            return "redirect:/login?session=invalid";
        }
        
        model.addAttribute("user", SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("content", "../pages/services/lease-application.jsp");
        model.addAttribute("page_name", "Lease Application");
        return "layouts/app";
    }
    
    @PostMapping("/lease_application")
    public String leaseApplicationForm(
            Model model,
            HttpSession session,
            @RequestParam("formData") String formData) {

        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            model.addAttribute("sessionOut", "Authentication failed! Session has expired.");
            return "redirect:/login?session=invalid";
        }

        if(formData != null && !formData.isEmpty()) {

            // Store parcel info in session
            Map<String, Object> parcelInfo = null;
            try {
                ObjectMapper mapper = new ObjectMapper();
                parcelInfo = mapper.readValue(
                    formData,
                    new TypeReference<Map<String, Object>>() {}
                );
                model.addAttribute("parcelInfo", parcelInfo);
                System.out.println("parcel detials: "+parcelInfo); // JSON string from client
            } catch (Exception e) {
                e.printStackTrace();
                // handle error: maybe redirect or show a message
            }
        }

        System.out.println("user info: "+session.getAttribute("userInfo"));

        model.addAttribute("user", SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("content", "../pages/services/lease-form/" + 
            (formData != null && !formData.isEmpty() ? "without-spatial-form.jsp" : "with-spatial-form.jsp"));
        model.addAttribute("page_name", "Lease Application");
        return "layouts/app";
    }

    @GetMapping("/track_application")
    public String trackApplication(Model model, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            model.addAttribute("sessionOut", "Authentication failed! Session has expired.");
            return "redirect:/login?session=invalid";
        }
        
        model.addAttribute("user", SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("content", "../pages/services/track-application.jsp");
        model.addAttribute("page_name", "Track Application");
        return "layouts/app";
    }
}
