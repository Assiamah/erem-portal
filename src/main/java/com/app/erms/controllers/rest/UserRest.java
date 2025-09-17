package com.app.erms.controllers.rest;

import java.util.Map;
import java.util.logging.Logger;

import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.erms.config.WebServiceURLConfig;
import com.app.erms.services.UserService;
import com.app.erms.utils.isAuthenticatedUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/users")
public class UserRest {

    private final WebServiceURLConfig wsURLConfig;
    private final UserService userService;

    public UserRest(WebServiceURLConfig wsURLConfig, UserService userService) {
        this.wsURLConfig = wsURLConfig;
        this.userService = userService;
    }

    private static final Logger logger = Logger.getLogger(UserRest.class.getName());

    @Autowired
    private isAuthenticatedUtil isAuthenticatedUtil;

    String webServiceResponse = "";
    String requestType = "";

    @PostMapping
    public String updateUser(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestBody Map<String, Object> requestData) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return "{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}";
        }

        try {
            requestType = (String) requestData.get("requestType");
            
            if ("updateUser".equals(requestType)) {
                return updateUser(session, requestData);
            } else {
                return "{\"status\": \"error\", \"message\": \"Invalid request type.\"}";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"status\": \"error\", \"message\": \"An error occurred.\"}";
        }
    }

    private String updateUser(HttpSession session, Map<String, Object> userData) {
        try {
            // Validate required fields
            if (!validateUserData(userData)) {
                return "{\"status\": \"error\", \"message\": \"Missing required fields.\"}";
            }

            @SuppressWarnings("unchecked")
            Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");

            int user_id = Integer.parseInt(userInfo.get("id").toString());

            // Prepare user data for database insertion
            JSONObject userJson = prepareUserJson(userData, user_id);
            // System.out.println("userJson: " + userJson);

            webServiceResponse = userService.updateUser(
                wsURLConfig.getWebServiceUrl(), 
                wsURLConfig.getWebServiceAPIKey(), 
                userJson.toString()
            );

            JSONObject resObj = new JSONObject(webServiceResponse);
            // Store user info in session
            Map<String, Object> userInfox = null;
            try {
                ObjectMapper mapper = new ObjectMapper();
                userInfox = mapper.readValue(
                    resObj.getString("info"),
                    new TypeReference<Map<String, Object>>() {}
                );
                session.setAttribute("userInfo", userInfox);
            } catch (Exception e) {
                e.printStackTrace();
                // handle error: maybe redirect or show a message
            }

            return webServiceResponse;
        } catch (Exception e) {
            logger.severe("Error adding user: " + e.getMessage());
            e.printStackTrace();
            return "{\"status\": \"error\", \"message\": \"Failed to create user: " + e.getMessage() + "\"}";
        }
    }

    private boolean validateUserData(Map<String, Object> userData) {
        // Check required fields
        if (!userData.containsKey("first_name") || ((String) userData.get("first_name")).isEmpty()) {
            return false;
        }
        if (!userData.containsKey("last_name") || ((String) userData.get("last_name")).isEmpty()) {
            return false;
        }
        
        return true;
    }

    private JSONObject prepareUserJson(Map<String, Object> userData, int user_id) throws Exception {
        JSONObject userJson = new JSONObject();
        
        // Personal information
        userJson.put("user_id", user_id);
        userJson.put("title", userData.getOrDefault("title", ""));
        userJson.put("first_name", userData.get("first_name"));
        userJson.put("last_name", userData.get("last_name"));
        userJson.put("middle_name", userData.getOrDefault("middle_name", ""));
        
        // Handle date of birth
        if (userData.containsKey("dob") && userData.get("dob") != null) {
            userJson.put("dob", userData.get("dob"));
        }
        
        userJson.put("gender", userData.getOrDefault("gender", ""));
        
        // Contact information
        userJson.put("country_code", userData.getOrDefault("country_code", ""));
        userJson.put("phone_number", userData.getOrDefault("phone_number", ""));
        userJson.put("address", userData.getOrDefault("address", ""));
        userJson.put("zip_code", userData.getOrDefault("zip_code", ""));
        userJson.put("city", userData.getOrDefault("city", ""));
        userJson.put("country", userData.getOrDefault("country", ""));
        userJson.put("nationality", userData.getOrDefault("nationality", ""));
        
        // Generate full name
        String fullName = buildFullName(
            (String) userData.getOrDefault("title", ""),
            (String) userData.get("first_name"),
            (String) userData.getOrDefault("middle_name", ""),
            (String) userData.get("last_name")
        );
        userJson.put("full_name", fullName);
        
        // Security settings
        userJson.put("two_factor_auth", userData.getOrDefault("two_factor_auth", false));
        userJson.put("two_factor_method", userData.getOrDefault("two_factor_method", ""));
        userJson.put("login_notification", userData.getOrDefault("login_notification", false));
        userJson.put("login_approval", userData.getOrDefault("login_approval", false));

        // System fields
        userJson.put("provider", "LOCAL");
        
        return userJson;
    }

    private String buildFullName(String title, String firstName, String middleName, String lastName) {
        StringBuilder fullName = new StringBuilder();
        
        if (title != null && !title.isEmpty()) {
            fullName.append(title).append(" ");
        }
        if (firstName != null && !firstName.isEmpty()) {
            fullName.append(firstName).append(" ");
        }
        if (middleName != null && !middleName.isEmpty()) {
            fullName.append(middleName).append(" ");
        }
        if (lastName != null && !lastName.isEmpty()) {
            fullName.append(lastName);
        }
        
        return fullName.toString().trim();
    }
}