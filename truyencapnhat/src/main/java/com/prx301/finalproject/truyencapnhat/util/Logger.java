package com.prx301.finalproject.truyencapnhat.util;

public class Logger {
    private final String DEFAULT_LOG_URI = "C:/TCNv1/Log/";
    private String logUri = DEFAULT_LOG_URI;

    public Logger (String logUri) {
        if (!logUri.isEmpty()) {
            this.logUri = logUri;
        }
    }

    public static void log() {

    }
}
