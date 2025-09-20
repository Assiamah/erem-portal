package com.app.erms.controllers.rest;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.logging.Logger;

import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.erms.config.WebServiceURLConfig;
import com.app.erms.helpers.BrowserDetection;
import com.app.erms.helpers.ClientIpAddress;
import com.app.erms.helpers.LocalMacAddress;
import com.app.erms.services.AuthService;
import com.app.erms.utils.EncryptionUtil;
import com.app.erms.utils.isAuthenticatedUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/auth")
public class AuthRest {

    private final WebServiceURLConfig wsURLConfig;
    private final EncryptionUtil encryptionUtil;
    private final AuthService authService;
    private final BrowserDetection browserDetection;
    private final ClientIpAddress clientIpAddress;
    private final LocalMacAddress localMacAddress;

    public AuthRest(WebServiceURLConfig wsURLConfig,
                        EncryptionUtil encryptionUtil,
                        AuthService authService,
                        BrowserDetection browserDetection,
                        ClientIpAddress clientIpAddress,
                        LocalMacAddress localMacAddress) {
        this.wsURLConfig = wsURLConfig;
        this.encryptionUtil = encryptionUtil;
        this.authService = authService;
        this.browserDetection = browserDetection;
        this.clientIpAddress = clientIpAddress;
        this.localMacAddress = localMacAddress;
    }

    private static final Logger logger = Logger.getLogger(AuthRest.class.getName());

    @Autowired
    private isAuthenticatedUtil isAuthenticatedUtil;

    JSONObject authData = new JSONObject();

    String webServiceResponse = "";
    String requestType = "";

    @PostMapping("/check-registration-email")
    public ResponseEntity<?> checkRegistrationEmail(@RequestBody Map<String, Object> requestData, HttpSession session) {

        try {
            JSONObject requestJson = new JSONObject();
            requestJson.put("email", requestData.get("email"));

            // System.out.println(requestJson.toString());

            webServiceResponse = authService.checkRegistrationEmail(
                wsURLConfig.getWebServiceUrl(), 
                wsURLConfig.getWebServiceAPIKey(), 
                requestJson.toString()
            );

            JSONObject resObj = new JSONObject(webServiceResponse);

            boolean success = resObj.getBoolean("success");
            if(success) {
                JSONObject resData = resObj.getJSONObject("data");

                // Store passKey with expiry metadata
                Map<String, Object> passKeyData = new HashMap<>();
                passKeyData.put("value", encryptionUtil.encrypt(resData.getString("unique_id")));
                passKeyData.put("email", resData.getString("email"));
                passKeyData.put("expiryTime", System.currentTimeMillis() + 120 * 1000); // 1 min from now

                session.setAttribute("passKey", passKeyData);
            }

            return ResponseEntity.ok(webServiceResponse);

        } catch (Exception e) {
            logger.severe("Error check email: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to check email: " + e.getMessage() + "\"}");
        }
    }

    @PostMapping("/verify-registration-email")
    public ResponseEntity<?> verifyRegistrationEmail(@RequestBody Map<String, Object> requestData, HttpSession session) {

        if (!isAuthenticatedUtil.loginAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"Authentication failed! Session has expired.\"}");
        }

        try {
            JSONObject requestJson = new JSONObject();

            @SuppressWarnings("unchecked")
            Map<String, Object> passKeyData = (Map<String, Object>) session.getAttribute("passKey");
            String email = (String) passKeyData.get("email");
            
            requestJson.put("otp_code", requestData.get("otp_code"));
            requestJson.put("email", email);

            webServiceResponse = authService.verifyRegistrationEmail(
                wsURLConfig.getWebServiceUrl(), 
                wsURLConfig.getWebServiceAPIKey(), 
                requestJson.toString()
            );

            JSONObject resObj = new JSONObject(webServiceResponse);

            boolean success = resObj.getBoolean("success");
            if(success) {
                JSONObject resData = resObj.getJSONObject("data");

                // Store passKey with expiry metadata
                // Map<String, Object> passKeyData = new HashMap<>();
                // passKeyData.put("value", encryptionUtil.encrypt(resData.getString("unique_id")));

                session.setAttribute("unique_id", resData.getString("unique_id"));
            }

            return ResponseEntity.ok(webServiceResponse);

        } catch (Exception e) {
            logger.severe("Error check email: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to check email: " + e.getMessage() + "\"}");
        }
    }

    @GetMapping("/check-authentication")
    public ResponseEntity<?> checkAuthentication(HttpSession session) {

        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"Authentication failed! Session has expired.\"}");
        }

        return ResponseEntity.status(200).body("{\"status\": \"success\", \"message\": \"Authenticated.\"}");

    }

    @PostMapping("/create-portal-user-password")
    public ResponseEntity<?> createPortalUserPassword(@RequestBody Map<String, Object> requestData, HttpSession session) {

        try {
            JSONObject requestJson = new JSONObject();
            String unique_id = (String) session.getAttribute("unique_id");
            
            requestJson.put("password", requestData.get("password"));
            requestJson.put("unique_id", unique_id);

            webServiceResponse = authService.createPortalUserPassword(
                wsURLConfig.getWebServiceUrl(), 
                wsURLConfig.getWebServiceAPIKey(), 
                requestJson.toString()
            );

            System.out.println(webServiceResponse);

            return ResponseEntity.ok(webServiceResponse);

        } catch (Exception e) {
            logger.severe("Error check email: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to check email: " + e.getMessage() + "\"}");
        }
    }

    @PostMapping("/user-authentication")
    public ResponseEntity<?> userAuthentication(@RequestBody Map<String, Object> requestData, HttpSession session, HttpServletRequest request) {

        try {
            
            // User credentials
            String email = (String) requestData.get("email");
            String password = (String) requestData.get("password");

            // Get Client IP Address
            String ipAddress = clientIpAddress.getClientIpAddress(request);

            // Get Server-side Geolocation
            String location = "Unknown";
            String locCoordinate = request.getParameter("coordinates");
            try {
                request.getHeader("X-Client-Location");
            } catch (Exception e) {
                location = "Unknown";
            }

            // Timezone
            String timezone = TimeZone.getDefault().getID();

            // Device & Browser detection (basic from User-Agent)
            String userAgent = request.getHeader("User-Agent").toLowerCase();
            String deviceName = userAgent;
            String platform = userAgent.contains("windows") ? "Windows"
                            : userAgent.contains("mac") ? "Mac"
                            : userAgent.contains("linux") ? "Linux"
                            : "Unknown";
            boolean isDesktop = userAgent.contains("windows") || userAgent.contains("mac") || userAgent.contains("linux");
            boolean isTablet = userAgent.contains("tablet");
            boolean isPhone = userAgent.contains("mobile");
            boolean isRobot = userAgent.contains("bot") || userAgent.contains("crawl") || userAgent.contains("spider");
            String browser = browserDetection.getDetectBrowser(userAgent);
            String macAddress = localMacAddress.getLocalMacAddress();

            // Build JSON request
            authData.put("email", email);
            authData.put("password", password);
            authData.put("ip_address", ipAddress);
            authData.put("location", location);
            authData.put("timezone", timezone);
            authData.put("loc_coordinate", locCoordinate);
            authData.put("device", deviceName);
            authData.put("platform", platform);
            authData.put("isDesktop", isDesktop);
            authData.put("isTablet", isTablet);
            authData.put("isPhone", isPhone);
            authData.put("browser", browser);
            authData.put("isRobot", isRobot);
            authData.put("mac_address", macAddress);

            String jsonRequest = authData.toString();
            System.out.println(jsonRequest);

            webServiceResponse = authService.userLogin(
                wsURLConfig.getWebServiceUrl(), 
                wsURLConfig.getWebServiceAPIKey(), 
                jsonRequest
            );

            JSONObject resObj = new JSONObject(webServiceResponse);

            boolean success = resObj.getBoolean("success");
            if(success) {
                JSONObject resData = resObj.getJSONObject("data");
                
                // Store passKey with expiry metadata
                Map<String, Object> passKeyData = new HashMap<>();
                passKeyData.put("value", encryptionUtil.encrypt(resData.getString("unique_id")));
                passKeyData.put("email", resData.getString("email"));
                passKeyData.put("expiryTime", System.currentTimeMillis() + 120 * 1000); // 2 min from now

                session.setAttribute("passKey", passKeyData);

                // System.out.println(resData.getString("pin"));
                // session.setAttribute("email",resData.getString("email"));
                // session.setAttribute("otp_pin",resData.getString("pin"));
                
                return ResponseEntity.ok(webServiceResponse);
            } else {
                String error = resObj.getString("error");
                return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"Failed to login: " + error + "\"}");
            }

        } catch (Exception e) {
            logger.severe("Error check email: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to check email: " + e.getMessage() + "\"}");
        }
    }

    @PostMapping("/verify-login-email")
    public ResponseEntity<?> verifyLoginEmail(@RequestBody Map<String, Object> requestData, HttpSession session) {

        if (!isAuthenticatedUtil.loginAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"Authentication failed! Session has expired.\"}");
        }

        try {
            JSONObject requestJson = new JSONObject();

            @SuppressWarnings("unchecked")
            Map<String, Object> passKeyData = (Map<String, Object>) session.getAttribute("passKey");
            String passKey = (String) passKeyData.get("value");
            String decryptedPassKey = encryptionUtil.decrypt(passKey);
            
            requestJson.put("pin", requestData.get("otp_code"));
            requestJson.put("unique_id", decryptedPassKey);

            webServiceResponse = authService.verifyOtp(
                wsURLConfig.getWebServiceUrl(), 
                wsURLConfig.getWebServiceAPIKey(), 
                requestJson.toString()
            );

            System.out.println(webServiceResponse);

            JSONObject resObj = new JSONObject(webServiceResponse);

            boolean success = resObj.getBoolean("success");
            if(success) {
                JSONObject resData = resObj.getJSONObject("data");
                // System.out.println(resData);
                // Create authentication
                List<GrantedAuthority> authorities = new ArrayList<>();
                authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

                UsernamePasswordAuthenticationToken authentication =
                    new UsernamePasswordAuthenticationToken(
                        resData.getString("email"),
                        null,
                        authorities
                    );

                // Set authentication in SecurityContext
                SecurityContextHolder.getContext().setAuthentication(authentication);

                // Persist authentication in session (important!)
                session.setAttribute(
                    "SPRING_SECURITY_CONTEXT",
                    SecurityContextHolder.getContext()
                );

                // Store encrypted passkey in session
                session.setAttribute(
                    "passKey",
                    encryptionUtil.encrypt(resData.getString("unique_id"))
                );

                // Store user info in session
                Map<String, Object> userInfo = null;
                try {
                    ObjectMapper mapper = new ObjectMapper();
                    userInfo = mapper.readValue(
                        resData.getString("info"),
                        new TypeReference<Map<String, Object>>() {}
                    );
                    session.setAttribute("userInfo", userInfo);
                } catch (Exception e) {
                    e.printStackTrace();
                    // handle error: maybe redirect or show a message
                }

                // Capture current timestamp
                LocalDateTime lastLogin = LocalDateTime.now();

                // Format like "Wed Sep 10 10:45PM"
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM dd hh:mma", Locale.ENGLISH);
                String formattedLastLogin = lastLogin.format(formatter);

                // Store in session
                session.setAttribute("lastLogin", formattedLastLogin);
            }

            return ResponseEntity.ok(webServiceResponse);

        } catch (Exception e) {
            logger.severe("Error check email: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to check email: " + e.getMessage() + "\"}");
        }
    }
}
