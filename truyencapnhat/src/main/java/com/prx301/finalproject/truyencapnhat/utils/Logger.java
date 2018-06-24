package com.prx301.finalproject.truyencapnhat.utils;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;

public class Logger {
    private static Logger logger = null;
    private final static String LOG_DIR = "log";
    private File file = null;

    public enum LOG_LEVEL {
        INFO(1, "INFO"), WARNING(2, "WARN"), ERROR(3, "ERROR"), FATAL(4, "FATAL");

        private int severity = 0;
        private String logType = "";
        private int SILENCE_LEVEL = 1;

        LOG_LEVEL(int severity, String logType) {
            this.severity = severity;
            this.logType = logType;
        }

        public int severity() {
            return severity;
        }

        public String logType() {
            return logType;
        }

        public boolean isSilence() {
            return severity <= SILENCE_LEVEL;
        }
    }

    private Logger(String filename) {
        file = new File(filename);
        try {
            file.getParentFile().mkdirs();
            file.createNewFile();
        } catch (IOException e) {
            info("Cannot create new log directory", this.getClass());
        }
    }

    public static Logger getLogger() {
        if (logger == null) {
            String date = ComUtils.getCurrentDateString();
            String logName = new StringBuilder(LOG_DIR + "/log_").append(date).toString();
            logger = new Logger(logName);
        }
        return logger;
    }

    public void log(LOG_LEVEL level, String message, Exception e, Class eClass) {
        StringBuilder log = new StringBuilder();

        log.append(String.format("[%s | %s] %s: ", level.logType, ComUtils.getCurrentTimeString(), eClass.getCanonicalName()));
        if (message == null) {
            message = e.getMessage();
        }
        log.append(message);
        if (e != null) {
            log.append("\n\tDETAIL:\t");
            log.append(Arrays.toString(e.getStackTrace()));
        }

        if (level.isSilence()) {
            System.out.println(log.toString());
        } else {
            System.out.println(log.toString());
            ComUtils.writeToFile(file, log.toString());
        }
    }

    public void log(LOG_LEVEL level, Exception e, Class eClass) {
        log(level, null, e, eClass);
    }

    public void info(String msg, Class eClass) {
        log(LOG_LEVEL.INFO, msg, null, eClass);
    }
}
