package com.app.erms.utils;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpSession;

@Component
public class isAuthenticatedUtil {
    @Autowired
    private EncryptionUtil encryptionUtil;
    
    public boolean isAuthenticated(HttpSession session) {
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

    @SuppressWarnings("unchecked")
    public boolean loginAuthenticated(HttpSession session) {
        try {

            Map<String, Object> passKeyData = (Map<String, Object>) session.getAttribute("passKey");

            if (passKeyData != null) {
                long expiryTime = (long) passKeyData.get("expiryTime");
                if (System.currentTimeMillis() > expiryTime) {
                    session.invalidate();
                    return false;
                } else {
                    String encryptedPassKey = (String) passKeyData.get("value");
                    // Decrypt the passkey for verification
                    String decryptedPassKey = encryptionUtil.decrypt(encryptedPassKey);
                    return isValidPassKey(decryptedPassKey);
                }
            }

            return false;
        } catch (Exception e) {
            return false;
        }
    }
    
    private boolean isValidPassKey(String passKey) {
        // Implement your passkey validation logic
        return passKey != null && !passKey.isBlank();
    }
}
