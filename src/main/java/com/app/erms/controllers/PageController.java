package com.app.erms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.erms.utils.isAuthenticatedUtil;

import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {

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
        
        model.addAttribute("user", SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("content", "../pages/appointments.jsp");
        model.addAttribute("page_name", "Appointments");
        return "layouts/app";
    }
}
