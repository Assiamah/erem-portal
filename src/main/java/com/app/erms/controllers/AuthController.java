package com.app.erms.controllers;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.erms.config.WebServiceURLConfig;
import com.app.erms.helpers.BrowserDetection;
import com.app.erms.helpers.ClientIpAddress;
import com.app.erms.helpers.LocalMacAddress;
import com.app.erms.services.AuthService;
import com.app.erms.utils.EncryptionUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

@Controller
public class AuthController {

    private final WebServiceURLConfig wsURLConfig;
    private final EncryptionUtil encryptionUtil;
    private final AuthService authService;
    private final BrowserDetection browserDetection;
    private final ClientIpAddress clientIpAddress;
    private final LocalMacAddress localMacAddress;

    public AuthController(WebServiceURLConfig wsURLConfig,
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

    JSONObject authData = new JSONObject();
    JSONArray arr = new JSONArray();

    String WebServiceResponse = "";

    @GetMapping("/")
    public String showIndexPage() {
        // model.addAttribute("content", "../index.jsp");
        return "index";
    }

    @GetMapping("/login")
    public String showLoginPage(Model model) {
        model.addAttribute("content", "../auth/login.jsp");
        return "layouts/guest";
    }

    @GetMapping("/registration")
    public String showRegistrationPage(Model model) {
        model.addAttribute("content", "../auth/registration.jsp");
        return "layouts/guest";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        // Invalidate the current session
        session.invalidate();
        
        // Clear any model attributes if needed
        model.asMap().clear();
        
        // Redirect to login page with a success message
        model.addAttribute("content", "../auth/login.jsp");
        model.addAttribute("message", "You have been logged out successfully");
        return "layouts/guest";
    }

    @PostMapping("/user_authentication")
    public String userAuthentication(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException {

        // User credentials
        String email = request.getParameter("email");
        String password = request.getParameter("password");

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
        WebServiceResponse = authService.userLogin(
            wsURLConfig.getWebServiceUrl(), 
            wsURLConfig.getWebServiceAPIKey(), 
            jsonRequest
        );

        JSONObject resObj = new JSONObject(WebServiceResponse);

        boolean success = resObj.getBoolean("success");
        if(success) {
            JSONObject resData = resObj.getJSONObject("data");
            
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
            
            return "redirect:/dashboard";
        } else {
            String error = resObj.getString("error");
            model.addAttribute("error", error);
            return "redirect:/";
        }
    }

}