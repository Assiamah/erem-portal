package com.app.erms.services;

import org.springframework.stereotype.Service;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

@Service
public class AuthService {

    public String userLogin(String web_service_url, String web_service_api_key, String json_request)
	{
		String output = null;
		try {
			try {
				Client client = Client.create();
				WebResource webResource = client.resource(web_service_url + "api/v1/auth_service/user_login");
				
				ClientResponse response_ws = webResource.type("application/json")
						.header("x-api-key", web_service_api_key).post(ClientResponse.class, json_request);
				if (response_ws.getStatus() != 200) {
					throw new RuntimeException("Failed : HTTP error code : " + response_ws.getStatus());
				}
				output = response_ws.getEntity(String.class);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return output;
	}

    public String checkRegistrationEmail(String web_service_url, String web_service_api_key, String json_request)
	{
		String output = null;
		try {
			try {
				Client client = Client.create();
				WebResource webResource = client.resource(web_service_url + "api/v1/auth_service/check_registration_email");
				
				ClientResponse response_ws = webResource.type("application/json")
						.header("x-api-key", web_service_api_key).post(ClientResponse.class, json_request);
				if (response_ws.getStatus() != 200) {
					throw new RuntimeException("Failed : HTTP error code : " + response_ws.getStatus());
				}
				output = response_ws.getEntity(String.class);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return output;
	}
    
    public String verifyRegistrationEmail(String web_service_url, String web_service_api_key, String json_request)
	{
		String output = null;
		try {
			try {
				Client client = Client.create();
				WebResource webResource = client.resource(web_service_url + "api/v1/auth_service/verify_registration_email");
				
				ClientResponse response_ws = webResource.type("application/json")
						.header("x-api-key", web_service_api_key).post(ClientResponse.class, json_request);
				if (response_ws.getStatus() != 200) {
					throw new RuntimeException("Failed : HTTP error code : " + response_ws.getStatus());
				}
				output = response_ws.getEntity(String.class);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return output;
	}

    public String createPortalUserPassword(String web_service_url, String web_service_api_key, String json_request)
	{
		String output = null;
		try {
			try {
				Client client = Client.create();
				WebResource webResource = client.resource(web_service_url + "api/v1/auth_service/create_portal_user_password");
				
				ClientResponse response_ws = webResource.type("application/json")
						.header("x-api-key", web_service_api_key).post(ClientResponse.class, json_request);
				if (response_ws.getStatus() != 200) {
					throw new RuntimeException("Failed : HTTP error code : " + response_ws.getStatus());
				}
				output = response_ws.getEntity(String.class);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return output;
	}

	public String verifyOtp(String web_service_url, String web_service_api_key, String json_request)
	{
		String output = null;
		try {
			try {
				Client client = Client.create();
				WebResource webResource = client.resource(web_service_url + "api/v1/auth_service/verify_otp");
				
				ClientResponse response_ws = webResource.type("application/json")
						.header("x-api-key", web_service_api_key).post(ClientResponse.class, json_request);
				if (response_ws.getStatus() != 200) {
					throw new RuntimeException("Failed : HTTP error code : " + response_ws.getStatus());
				}
				output = response_ws.getEntity(String.class);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return output;
	}
}
