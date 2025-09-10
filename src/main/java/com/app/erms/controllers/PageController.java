package com.app.erms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.erms.utils.EncryptionUtil;

import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {

    @Autowired
    private EncryptionUtil encryptionUtil;
    
    private boolean isAuthenticated(HttpSession session) {
        try {
            String encryptedPassKey = (String) session.getAttribute("passKey");
            if (encryptedPassKey == null || 
                encryptedPassKey.isBlank() || 
                SecurityContextHolder.getContext().getAuthentication() == null ||
                !SecurityContextHolder.getContext().getAuthentication().isAuthenticated()) {
                return false;
            }
            
            // Decrypt the passkey for verification
            String decryptedPassKey = encryptionUtil.decrypt(encryptedPassKey);
            
            // Add additional validation logic here if needed
            return isValidPassKey(decryptedPassKey);
        } catch (Exception e) {
            return false;
        }
    }
    
    private boolean isValidPassKey(String passKey) {
        // Implement your passkey validation logic
        return passKey != null && !passKey.isBlank();
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) {
        if (!isAuthenticated(session)) {
            model.addAttribute("sessionOut", "Authentication failed! Session has expired.");
            return "redirect:/";
        }
        model.addAttribute("user", SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("content", "../pages/dashboard.jsp");
        model.addAttribute("page_name", "Dashboard");
        return "layouts/app";
    }
}
