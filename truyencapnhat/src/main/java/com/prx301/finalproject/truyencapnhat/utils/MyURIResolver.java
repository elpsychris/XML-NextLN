package com.prx301.finalproject.truyencapnhat.utils;


import javax.xml.transform.Source;
import javax.xml.transform.URIResolver;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;

public class MyURIResolver implements URIResolver {
    private static volatile boolean isStop = false;
    private static volatile boolean isPause = false;
    private static InputStream empty = null;
    private static final String DEFAULT_XML_DOCUMENT = "src/main/java/com/prx301/finalproject/truyencapnhat/xmlConfigs/default_xml.xml";


    @Override
    public Source resolve(String href, String base)  {
        Logger.getLogger().info("Resolving content from: " + href, MyURIResolver.class);



        StringBuffer emptyHtml = new StringBuffer();
        emptyHtml.append("<html xmlns=\"http://www.w3.org/1999/xhtml\"></html>");
        empty = new ByteArrayInputStream(emptyHtml.toString().getBytes());
        while (isPause && !isStop) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, "Crawler cannot be paused", e, MyURIResolver.class);
            }
        }
        if (href != null && !isStop) {
            try {
                InputStream httpResult = ComUtils.getHttp(href);
                String httpContent = preProcessInputStream(httpResult);
                if (href.equals("https://ln.hako.re/truyen/2666-akuyaku-reijo-ni-koi-wo-shite")) {
                    System.out.println("found it");
                }

                InputStream testStream = new ByteArrayInputStream(httpContent.getBytes());
                DOMResult testDOM = TrAXUtils.transform(new StreamSource(testStream), null);
                if (testDOM.getNode() != null) {
                    Logger.getLogger().info("HTML Content parsing test SUCCEED", MyURIResolver.class);
                    InputStream realStream = new ByteArrayInputStream(httpContent.getBytes());
                    return new StreamSource(realStream);
                } else {
                    Logger.getLogger().info("HTML Content parsing test FAILED", MyURIResolver.class);
                    InputStream defaultFile = new FileInputStream(new File(DEFAULT_XML_DOCUMENT));
                    return new StreamSource(defaultFile);
                }
            } catch (InterruptedException e) {
                Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, "Crawler cannot be paused", e, MyURIResolver.class);
            } catch (IOException e) {
                Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, "Error in resolving content from URL", e, MyURIResolver.class);
            }
        }

        return new StreamSource(empty);
    }

    public void pause() {
        isPause = true;
        Logger.getLogger().info("Pause signal for Crawler fired", MyURIResolver.class);
    }

    public void stop() {
        isStop = true;
        Logger.getLogger().info("Stop signal for Crawler fired", MyURIResolver.class);

    }

    public void cont() {
        isPause = false;
        Logger.getLogger().info("Continue signal for Crawler fired", MyURIResolver.class);
    }

    private String preProcessInputStream(InputStream httpResult) throws IOException {
        StringBuffer stringBuffer = ComUtils.cleanHTML(httpResult);
        return stringBuffer.toString();
    }


}
