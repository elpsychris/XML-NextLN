package com.prx301.finalproject.truyencapnhat.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ComUtil {
    private final static String DEFAULT_DATE_PATTERN = "dd_MM_yyyy HH:mm:ss.S";
    private final static String config_uri = "./resources/config.properties";

    public static String getDateTime() {
        SimpleDateFormat dateFormatter = new SimpleDateFormat(DEFAULT_DATE_PATTERN);
        Date date = Calendar.getInstance().getTime();
        return dateFormatter.format(date);
    }
}
