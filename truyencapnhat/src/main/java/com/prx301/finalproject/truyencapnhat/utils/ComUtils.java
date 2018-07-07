package com.prx301.finalproject.truyencapnhat.utils;

import com.prx301.finalproject.truyencapnhat.model.ProjectEntity;
import com.prx301.finalproject.truyencapnhat.model.crawler.model.CrawlerConfig;

import javax.xml.bind.JAXBException;
import java.io.*;
import java.lang.reflect.Field;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ComUtils {
    private final static String DEFAULT_CRAWLER_CONFIG_DIR = "src/main/java/com/prx301/finalproject/truyencapnhat/xmlConfigs/crawler_config.xml";
    private final static String DEFAULT_STYLESHEET_DIR = "src/main/java/com/prx301/finalproject/truyencapnhat/stylesheet";
    private final static String USER_AGENT_HEADER = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11";
    private final static int RETRY_INTERVAL = 20000;
    private final static int TIMEOUT = 6000;
    private final static String XML_DECLARATION = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>";
    private final static String HASH_ALGO = "MD5";
    private final static SimpleDateFormat timeFormatter = new SimpleDateFormat("ddMMyyyy:hhmmssSSS");
    private final static SimpleDateFormat dateFormatter = new SimpleDateFormat("ddMMyyyy");
    private final static Logger logger = Logger.getLogger();

    private static Map<String, String> cacheMap = new HashMap<>();


    public static String getCurrentTimeString() {
        return timeFormatter.format(Calendar.getInstance().getTime());
    }

    public static String getCurrentDateString() {
        return dateFormatter.format(Calendar.getInstance().getTime());
    }

    public static InputStream getHttp(String uri) throws IOException, InterruptedException {
        URL url = new URL(uri);
        InputStream httpResult = null;
        URLConnection connection = openConnection(url);

        boolean cont = true;
        while (cont) {
            try {
                httpResult = connection.getInputStream();

                cont = false;
            } catch (IOException e) {
                logger.log(Logger.LOG_LEVEL.INFO, "Cannot connect to " + uri, e, ComUtils.class);
                int waitTime = RETRY_INTERVAL;
                // check retry-after Header
                Map<String, List<String>> headers = connection.getHeaderFields();
                List<String> retryAfter = headers.get("retry-after");
                if (retryAfter != null) {
                    waitTime = Integer.parseInt(retryAfter.get(0));
                    logger.info("Found Retry-After Header in Response Object", ComUtils.class);
                }

                // check rate
                StringBuilder content = new StringBuilder();
                // check rate
                content.append("\n=== INFORMATION ===");
                for (Map.Entry<String, List<String>> header : headers.entrySet()) {
                    if (header.getKey() == null) {
                        continue;
                    }
                    if (header.getKey().toLowerCase().contains("limit")) {
                        content.append("\n* " + header.getKey());
                        for (String val : header.getValue()) {
                            content.append("\n\t |" + val);
                        }
                    }
                }
                logger.info("Retry after: " + waitTime + "s", ComUtils.class);
                logger.info(content.toString(), ComUtils.class);

                if (waitTime > 200) {
                    waitTime = RETRY_INTERVAL;
                }

                connection = openConnection(url);

                Thread.sleep(waitTime * 1000);
                cont = true;
            }
        }

        return httpResult;
    }

    private static URLConnection openConnection(URL url) throws IOException {
        URLConnection connection = url.openConnection();
        connection.setRequestProperty("User-Agent", USER_AGENT_HEADER);

        return connection;
    }

    public static String inputStreamToString(InputStream stream) throws IOException {
        StringBuffer stringBuffer = new StringBuffer();
        InputStreamReader inputStreamReader = null;
        BufferedReader bufferedReader = null;

        String line;
        try {
            inputStreamReader = new InputStreamReader(stream, "UTF-8");
            bufferedReader = new BufferedReader(inputStreamReader);

            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line.trim()).append("\n");
            }
        } catch (IOException e) {
            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, e, ComUtils.class);
        } finally {
            if (bufferedReader != null) {
                bufferedReader.close();
            }

            if (inputStreamReader != null) {
                inputStreamReader.close();
            }
        }
        return stringBuffer.toString();
    }

    public static String cleanHTML(String rawContent) throws IOException {

        StringBuffer stringBuffer = new StringBuffer();

        Pattern pattern = null;
        Matcher matcher = null;

        stringBuffer.append(XML_DECLARATION + "\n");
//
//        if (line.contains("<html") && !line.contains("xmlns=\"http://www.w3.org/1999/xhtml\"")) {
//            line = line.replace("<html", "<html xmlns=\"http://www.w3.org/1999/xhtml\"");
//        }
//        if (rawContent.contains("src") || rawContent.contains("href")) {
//        }

        rawContent = rawContent.replace("&", "&amp;");

        // Remove all meta tag
        rawContent = rawContent.replaceAll("<meta[ ]?[^>]+[ ]?>", "");

        // Remove all base tag
        rawContent = rawContent.replaceAll("<base[ ]?[^>]+[ ]?>", "");

        // Remove all link tag
        rawContent = rawContent.replaceAll("<link ]?[^>]+[ ]?>", "");

        // Remove all input tag
        rawContent = rawContent.replaceAll("<input[ ]?[^>]+[ ]?>", "");

        // Remove all br tag
        rawContent = rawContent.replaceAll("<[/]?br[/]?>", "");

        // Remove all li alone tag
        rawContent = rawContent.replaceAll("<li class=\"filter-type_item\">", "");
//            line = line.replaceAll("<li class=\"filter-type_item\">", "");

        rawContent = rawContent.replace("<main class=\"sect-body none force-block-l clear long-text\" style=\"word-wrap: break-word;\"", "<main class=\"sect-body none force-block-l clear long-text\" style=\"word-wrap: break-word;\">");

        // (R) char and ... and non-breaking space char replacement
        rawContent = rawContent
                .replace("&reg;", "&#174;")
                .replace("&hellip;", "")
                .replace("&nbsp;", "");

        rawContent = rawContent.replaceAll("itemscope", "");
        rawContent = rawContent.replaceAll("nowrap", "");

        pattern = Pattern.compile("<img [^>]+[^/]>");
        matcher = pattern.matcher(rawContent);

        Set<String> matchedImg = new HashSet<>();
        while (matcher.find()) {
            String sMatched = matcher.group(0);
            if (sMatched.contains("No Game No Life")) {
                System.out.println("find it");
            }
            if (!matchedImg.contains(sMatched)) {
                rawContent = rawContent.replace(sMatched, sMatched + "</img>");
                matchedImg.add(sMatched);
            }
//            int start = rawContent.indexOf(sMatched);
//            rawContent = rawContent.substring(0, start + sMatched.length()) + "</img>" + rawContent.substring(start + sMatched.length());
        }
        rawContent = rawContent.replaceAll("<script[^>]*>[^<]*</script>", "");
        rawContent = rawContent.replaceAll("<header class=\"inline-block none-l mobile-toggle_header\">Bình luận</header>[\\s\\S]+</div>[^<]+</div>[^<]+</section>[^<]+</main>", "");
        rawContent = rawContent.replaceAll("<script>[\\s\\S]+</script>", "");

        stringBuffer.append(rawContent);

//        while ((line = bufferedReader.readLine()) != null) {
//
//
//            // remove <h3 class="ln-comment-count">
//            line = line.trim();
//            if (!line.isEmpty()) {
//                if (!line.contains("<h3 class=\"ln-comment-count\">") && !line.contains("<hr class=\"ln-comment\">")) {
//                    stringBuffer.append(line.trim() + "\n");
//                }
//            }
//
//        }

        return stringBuffer.toString();
    }

    public static String hashString(String src) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(HASH_ALGO);
            messageDigest.update(src.getBytes());
            return new String(messageDigest.digest());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getSubString(String before, String regEx) {
        String after = "";
        Pattern pattern = Pattern.compile(regEx);
        Matcher matcher = pattern.matcher(before);
        while (matcher.find()) {
            after = after + matcher.group(0);
        }
        return after;
    }

    public static void writeToFile(File file, String msg) {
        FileOutputStream fos = null;
        OutputStreamWriter streamWriter = null;
        BufferedWriter bufferedWriter = null;
        try {
            fos = new FileOutputStream(file, true);
            streamWriter = new OutputStreamWriter(fos);
            bufferedWriter = new BufferedWriter(streamWriter);

            bufferedWriter.write(msg);
            bufferedWriter.flush();
        } catch (FileNotFoundException e) {
            logger.log(Logger.LOG_LEVEL.INFO, "File " + file + " not found", e, ComUtils.class);
        } catch (IOException e) {
            logger.log(Logger.LOG_LEVEL.INFO, "BufferWriter unable to write", e, ComUtils.class);
        } finally {
            if (bufferedWriter != null) {
                try {
                    bufferedWriter.close();
                } catch (IOException e) {
                    logger.info("Cannot close BufferWriter", ComUtils.class);
                }
            }

            if (streamWriter != null) {
                try {
                    streamWriter.close();
                } catch (IOException e) {
                    logger.info("Cannot close StreamWriter", ComUtils.class);
                }
            }

            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    logger.info("Cannot close FileOutputStream", ComUtils.class);
                }
            }
        }
    }

    public static CrawlerConfig getCrawlerConfig() {
        File file = new File(DEFAULT_CRAWLER_CONFIG_DIR);

        CrawlerConfig crawlerConfig = null;
        try {
            crawlerConfig = JAXBUtils.xmlToObject(file, CrawlerConfig.class);
        } catch (JAXBException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, "Cannot retrieve crawler config", e, ComUtils.class);
        }
        return crawlerConfig;
    }

    public static String getResourceXSL(String resourceName) {
        String content = cacheMap.get(resourceName);
        if (content == null) {
            content = getStreamFromFile(resourceName);
        }
        return content;
    }

    private static String getStreamFromFile(String fileName) {
        File file = new File(DEFAULT_STYLESHEET_DIR + "/" + fileName);
        InputStream fis = null;
        BufferedReader reader = null;
        String line = null;
        StringBuilder builder = new StringBuilder();
        try {
            fis = new FileInputStream(file);
            reader = new BufferedReader(new InputStreamReader(fis));
            while ((line = reader.readLine()) != null) {
                builder.append(line);
            }

        } catch (FileNotFoundException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, "Cannot read file: " + fileName, e, ComUtils.class);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    logger.log(Logger.LOG_LEVEL.ERROR, e, ComUtils.class);
                }
            }

            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    logger.log(Logger.LOG_LEVEL.ERROR, e, ComUtils.class);
                }
            }
        }
        return builder.toString();
    }

    public static ProjectEntity findIdenticalExist(ProjectEntity curProject, List<ProjectEntity> projectEntities) {
        String curProjectName = curProject.getProjectName();

        double maxScore = 0;
        ProjectEntity identicalProject = null;
        for (ProjectEntity projectEntity : projectEntities) {
            String otherName = projectEntity.getProjectName();

            double ratio = ((double) curProjectName.length()) / otherName.length();
            if (ratio < 0.5 || ratio > 2) {
                continue;
            }
            double curScore = StringComparator.computeMatching(curProjectName, otherName);
            if (curScore > maxScore) {
                System.out.printf("\t\tUpdate identical score - %s : %f\n", otherName, curScore);
                maxScore = curScore;
                identicalProject = projectEntity;
            }
        }

        if (maxScore > 0.9) {
            return identicalProject;
        }
        return null;
    }

    public static <T> T mergeObject(T curObj, T newObj) throws IllegalAccessException {
        Field[] fields = curObj.getClass().getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);
            Class<?> aClass = field.getType();

            // Add to current if null
            if (field.get(curObj) == null && field.get(newObj) != null) {
                field.set(curObj, field.get(newObj));
            }

            // Append to current if String
            if (aClass.getSimpleName().equals(String.class.getSimpleName())
                    && field.get(newObj) != null) {
                String newString = (String) field.get(newObj);
                String oldString = (String) field.get(curObj);
                if (!oldString.contains(newString)) {
                    oldString += ";" + newString.trim();
                    field.set(curObj, oldString);
                }
            }

            if (aClass.getSimpleName().equals(Double.class.getSimpleName())
                    && field.get(newObj) != null && field.get(curObj) != null) {
                Double newVal = (Double) field.get(newObj);
                Double curVal = (Double) field.get(curObj);
                if (newVal > 1.5 * curVal) {
                    field.set(curObj, (newVal + curVal) / 2);
                } else {
                    field.set(curObj, newVal);
                }
            }

            if (aClass.getSimpleName().equals(Integer.class.getSimpleName())
                    && field.get(newObj) != null && field.get(curObj) != null) {
                Integer newVal = (Integer) field.get(newObj);
                Integer curVal = (Integer) field.get(curObj);

                field.set(curObj, (newVal + curVal) / 2);
            }
        }
        return curObj;
    }

}
