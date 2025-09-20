package com.app.erms.controllers;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.erms.config.WebServiceURLConfig;
import com.app.erms.services.AppointmentService;
import com.app.erms.utils.isAuthenticatedUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {

    private final WebServiceURLConfig wsURLConfig;
    private final AppointmentService appointmentService;

    public PageController(WebServiceURLConfig wsURLConfig, AppointmentService appointmentService) {
        this.wsURLConfig = wsURLConfig;
        this.appointmentService = appointmentService;
    }

    @Autowired
    private isAuthenticatedUtil isAuthenticatedUtil;

    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            model.addAttribute("sessionOut", "Authentication failed! Session has expired.");
            return "redirect:/login?session=invalid";
        }
        
        model.addAttribute("user", SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("content", "../pages/dashboard.jsp");
        model.addAttribute("page_name", "Dashboard");
        return "layouts/app";
    }

    @GetMapping("/appointments")
    public String appointments(Model model, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            model.addAttribute("sessionOut", "Authentication failed! Session has expired.");
            return "redirect:/login?session=invalid";
        }

        String appointmentTypesJson = appointmentService.getAppointmentTypes(
                wsURLConfig.getWebServiceUrl(), 
                wsURLConfig.getWebServiceAPIKey());

        try {
            ObjectMapper mapper = new ObjectMapper();

            // Deserialize JSON array into a List of Maps (quick way)
            List<Map<String, Object>> appointmentTypes = mapper.readValue(
                appointmentTypesJson,
                new TypeReference<List<Map<String, Object>>>() {}
            );

            model.addAttribute("appointmentTypes", appointmentTypes);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("appointmentTypes", Collections.emptyList());
        }
        
        model.addAttribute("user", SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("content", "../pages/appointments.jsp");
        model.addAttribute("page_name", "Appointments");
        return "layouts/app";
    }
    
}
