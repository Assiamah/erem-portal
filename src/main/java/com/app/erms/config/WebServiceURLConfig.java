package com.app.erms.config;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
@ConfigurationProperties(prefix = "app.config")
public class WebServiceURLConfig {
    private String webServiceUrl;
    private String webServiceAPIKey;
    private String appFolderPath;

    public String getWebServiceUrl() {
        return webServiceUrl;
    }

    public void setWebServiceUrl(String webServiceUrl) {
        this.webServiceUrl = webServiceUrl;
    }

    public String getWebServiceAPIKey() {
        return webServiceAPIKey;
    }

    public void setWebServiceAPIKey(String webServiceAPIKey) {
        this.webServiceAPIKey = webServiceAPIKey;
    }

    public String getAppFolderPath() {
        return appFolderPath;
    }

    public void setAppFolderPath(String appFolderPath) {
        this.appFolderPath = appFolderPath;
    }
}
