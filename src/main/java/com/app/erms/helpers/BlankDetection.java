package com.app.erms.helpers;

public class BlankDetection {

    public boolean isBlank(String str) {
        return str == null || str.trim().isEmpty();
    }
}
