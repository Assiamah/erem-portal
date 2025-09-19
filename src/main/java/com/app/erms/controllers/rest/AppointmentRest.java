package com.app.erms.controllers.rest;

import java.util.Map;
import java.util.logging.Logger;

import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.erms.config.WebServiceURLConfig;
import com.app.erms.services.AppointmentService;
import com.app.erms.utils.isAuthenticatedUtil;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/appointments/")
public class AppointmentRest {

    private final WebServiceURLConfig wsURLConfig;
    private final AppointmentService appointmentService;

    public AppointmentRest(WebServiceURLConfig wsURLConfig, AppointmentService appointmentService) {
        this.wsURLConfig = wsURLConfig;
        this.appointmentService = appointmentService;
    }

    private static final Logger logger = Logger.getLogger(AppointmentRest.class.getName());

    @Autowired
    private isAuthenticatedUtil isAuthenticatedUtil;

    String webServiceResponse = "";
    String requestType = "";

    @GetMapping("/slots")
    public ResponseEntity<?> loadSlots(HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            webServiceResponse = appointmentService.loadSlots(wsURLConfig.getWebServiceUrl(), 
                                                   wsURLConfig.getWebServiceAPIKey());
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error fetching slots: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to fetch slots: " + e.getMessage() + "\"}");
        }
    }

    @GetMapping("/slots/summary")
    public ResponseEntity<?> getSlotsSummary(HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            webServiceResponse = appointmentService.getSlotsSummary(wsURLConfig.getWebServiceUrl(), 
                                                          wsURLConfig.getWebServiceAPIKey());
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error fetching slots summary: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to fetch slots summary: " + e.getMessage() + "\"}");
        }
    }

    @SuppressWarnings("unused")
    @PostMapping("/slots")
    public ResponseEntity<?> createSlot(@RequestBody Map<String, Object> slotData, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            // Get user ID from session
            @SuppressWarnings("unchecked")
            Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");

            Integer userId = Integer.parseInt(userInfo.get("id").toString());

            if (userId == null) {
                return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"USER_NOT_FOUND_IN_SESSION.\"}");
            }

            slotData.put("created_by", userId);

            //System.out.println(slotData);
            
            webServiceResponse = appointmentService.createSlot(wsURLConfig.getWebServiceUrl(), 
                                                     wsURLConfig.getWebServiceAPIKey(), 
                                                     slotData);
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error creating slot: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to create slot: " + e.getMessage() + "\"}");
        }
    }

    @SuppressWarnings("unused")
    @PostMapping("/slots/batch")
    public ResponseEntity<?> createBatchSlots(@RequestBody Map<String, Object> batchData, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            // Get user ID from session
            @SuppressWarnings("unchecked")
            Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");

            Integer userId = Integer.parseInt(userInfo.get("id").toString());

            if (userId == null) {
                return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"USER_NOT_FOUND_IN_SESSION.\"}");
            }

            batchData.put("created_by", userId);

            System.out.println(batchData);
            
            webServiceResponse = appointmentService.createBatchSlots(wsURLConfig.getWebServiceUrl(), 
                                                            wsURLConfig.getWebServiceAPIKey(), 
                                                            batchData);
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error creating batch slots: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to create batch slots: " + e.getMessage() + "\"}");
        }
    }

    @PostMapping("/slots/{slotId}/toggle")
    public ResponseEntity<?> toggleSlotAvailability(@PathVariable Integer slotId, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            // Get user ID from session
            @SuppressWarnings("unchecked")
            Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");

            Integer userId = Integer.parseInt(userInfo.get("id").toString());
            
            webServiceResponse = appointmentService.toggleSlotAvailability(wsURLConfig.getWebServiceUrl(), 
                                                                  wsURLConfig.getWebServiceAPIKey(), 
                                                                  slotId, userId);
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error toggling slot availability: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to toggle slot availability: " + e.getMessage() + "\"}");
        }
    }

    @DeleteMapping("/slots/{slotId}")
    public ResponseEntity<?> deleteSlot(@PathVariable Integer slotId, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            // Get user ID from session
            @SuppressWarnings("unchecked")
            Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");

            Integer userId = Integer.parseInt(userInfo.get("id").toString());

            webServiceResponse = appointmentService.deleteSlot(wsURLConfig.getWebServiceUrl(), 
                                                      wsURLConfig.getWebServiceAPIKey(), 
                                                      slotId, userId);
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error deleting slot: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to delete slot: " + e.getMessage() + "\"}");
        }
    }

    @GetMapping("/types")
    public ResponseEntity<?> getAppointmentTypes(HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            webServiceResponse = appointmentService.getAppointmentTypes(wsURLConfig.getWebServiceUrl(), 
                                                              wsURLConfig.getWebServiceAPIKey());
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error fetching appointment types: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to fetch appointment types: " + e.getMessage() + "\"}");
        }
    }

    // Additional endpoints for appointment booking functionality
    @SuppressWarnings("unused")
    @PostMapping("/book")
    public ResponseEntity<?> bookAppointment(@RequestBody Map<String, Object> bookingData, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            // Get client ID from session
            @SuppressWarnings("unchecked")
            Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");

            Integer clientId = Integer.parseInt(userInfo.get("id").toString());

            if (clientId == null) {
                return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"USER_NOT_FOUND_IN_SESSION.\"}");
            }

            bookingData.put("client_id", clientId);
            
            webServiceResponse = appointmentService.bookAppointment(wsURLConfig.getWebServiceUrl(), 
                                                           wsURLConfig.getWebServiceAPIKey(), 
                                                           bookingData);
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error booking appointment: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to book appointment: " + e.getMessage() + "\"}");
        }
    }

    @PostMapping("/{appointmentId}/cancel")
    public ResponseEntity<?> cancelAppointment(@PathVariable Integer appointmentId, 
                                              @RequestBody Map<String, Object> cancelData, 
                                              HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            webServiceResponse = appointmentService.cancelAppointment(wsURLConfig.getWebServiceUrl(), 
                                                            wsURLConfig.getWebServiceAPIKey(), 
                                                            appointmentId, 
                                                            cancelData);
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error canceling appointment: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to cancel appointment: " + e.getMessage() + "\"}");
        }
    }

    // @SuppressWarnings("unused")
    // @GetMapping("/my-appointments")
    // public ResponseEntity<?> getMyAppointments(HttpSession session,
    //                                           @RequestParam(defaultValue = "0") Integer page,
    //                                           @RequestParam(defaultValue = "10") Integer size) {
    //     if (!isAuthenticatedUtil.isAuthenticated(session)) {
    //         return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
    //     }

    //     try {
    //         @SuppressWarnings("unchecked")
    //         Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");

    //         Integer userId = Integer.parseInt(userInfo.get("id").toString());

    //         if (userId == null) {
    //             return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"USER_NOT_FOUND_IN_SESSION.\"}");
    //         }

    //         webServiceResponse = appointmentService.getUserAppointments(wsURLConfig.getWebServiceUrl(), 
    //                                                           wsURLConfig.getWebServiceAPIKey(), 
    //                                                           userId, 
    //                                                           page, 
    //                                                           size);
            
    //         return ResponseEntity.ok(webServiceResponse);
            
    //     } catch (Exception e) {
    //         logger.severe("Error fetching user appointments: " + e.getMessage());
    //         e.printStackTrace();
    //         return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to fetch appointments: " + e.getMessage() + "\"}");
    //     }
    // }


    @GetMapping("/all-appointments")
    public ResponseEntity<?> loadAppointments(HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            webServiceResponse = appointmentService.loadAppointments(wsURLConfig.getWebServiceUrl(), 
                                                   wsURLConfig.getWebServiceAPIKey());
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error fetching Appointments: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to fetch Appointments: " + e.getMessage() + "\"}");
        }
    }

    // Get Appointment by ID
    @GetMapping("/{appointmentId}")
    public ResponseEntity<?> appointmentById(@PathVariable Long appointmentId, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            JSONObject requestJson = new JSONObject();
            requestJson.put("appointment_id", appointmentId);

            webServiceResponse = appointmentService.appointmentById(
                wsURLConfig.getWebServiceUrl(), 
                wsURLConfig.getWebServiceAPIKey(), 
                requestJson.toString()
            );

            return ResponseEntity.ok(webServiceResponse);

        } catch (Exception e) {
            logger.severe("Error fetching user: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to fetch user: " + e.getMessage() + "\"}");
        }
    }

    @SuppressWarnings("unused")
    @GetMapping("/user_appointments")
    public ResponseEntity<?> getUserAppointments(
            HttpSession session,
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String start_date,
            @RequestParam(required = false) String end_date) {
        
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            // Get user ID from session
            @SuppressWarnings("unchecked")
            Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");

            Integer userId = Integer.parseInt(userInfo.get("id").toString());
            
            if (userId == null) {
                return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"USER_NOT_FOUND_IN_SESSION.\"}");
            }

            // Build query parameters
            String queryParams = buildUserAppointmentsQueryParams(page, size, userId, false, status, start_date, end_date);
            // System.out.println("queryParams: " + queryParams);
            
            webServiceResponse = appointmentService.getUserAppointments(wsURLConfig.getWebServiceUrl(), 
                                                              wsURLConfig.getWebServiceAPIKey(), 
                                                              queryParams);
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error fetching user appointments: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to fetch appointments: " + e.getMessage() + "\"}");
        }
    }

    @SuppressWarnings("unused")
    @GetMapping("/upcoming_appointments")
    public ResponseEntity<?> getUpcomingAppointments(
            HttpSession session,
            @RequestParam(defaultValue = "30") Integer days_ahead) {
        
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            // Get user ID from session
            @SuppressWarnings("unchecked")
            Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");

            Integer userId = Integer.parseInt(userInfo.get("id").toString());
            
            if (userId == null) {
                return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"USER_NOT_FOUND_IN_SESSION.\"}");
            }

            webServiceResponse = appointmentService.getUpcomingAppointments(wsURLConfig.getWebServiceUrl(), 
                                                                   wsURLConfig.getWebServiceAPIKey(), 
                                                                   userId, 
                                                                   days_ahead);
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error fetching upcoming appointments: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to fetch upcoming appointments: " + e.getMessage() + "\"}");
        }
    }

    @GetMapping("/{appointmentId}/details")
    public ResponseEntity<?> getAppointmentDetails(@PathVariable Integer appointmentId, HttpSession session) {
        if (!isAuthenticatedUtil.isAuthenticated(session)) {
            return ResponseEntity.status(401).body("{\"status\": \"error\", \"message\": \"SESSION_INVALID.\"}");
        }

        try {
            webServiceResponse = appointmentService.getAppointmentDetails(wsURLConfig.getWebServiceUrl(), 
                                                                 wsURLConfig.getWebServiceAPIKey(), 
                                                                 appointmentId);
            
            return ResponseEntity.ok(webServiceResponse);
            
        } catch (Exception e) {
            logger.severe("Error fetching appointment details: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\": \"error\", \"message\": \"Failed to fetch appointment details: " + e.getMessage() + "\"}");
        }
    }

    private String buildUserAppointmentsQueryParams(Integer page, Integer size, Integer userId, Boolean isProvider, 
                                                   String status, String start_date, String end_date) {
        StringBuilder params = new StringBuilder();
        params.append("?page=").append(page)
              .append("&size=").append(size)
              .append("&user_id=").append(userId)
              .append("&is_provider=").append(isProvider);
        
        if (status != null) {
            params.append("&status=").append(status);
        }
        if (start_date != null) {
            params.append("&start_date=").append(start_date);
        }
        if (end_date != null) {
            params.append("&end_date=").append(end_date);
        }
        
        return params.toString();
    }
}