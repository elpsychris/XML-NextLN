package com.prx301.finalproject.truyencapnhat.utils;


import com.prx301.finalproject.truyencapnhat.model.crawler.model.CleanFilter;
import com.prx301.finalproject.truyencapnhat.model.crawler.model.ConfigComp;
import com.prx301.finalproject.truyencapnhat.model.crawler.model.CrawlerConfig;

import javax.xml.transform.Source;
import javax.xml.transform.URIResolver;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class MyURIResolver implements URIResolver {
    protected boolean isStop = false;
    protected boolean isPause = false;
    protected static final String EMPTY_HTML_CONTENT = "<html xmlns=\"http://www.w3.org/1999/xhtml\"></html>";
    private ConfigComp crawlerConfig = null;
    private final double PATTERN_INDENTICAL_MEAN = 0.8;

    private TrAXUtils trAXUtils = new TrAXUtils();
    protected static final String DEFAULT_XML_DOCUMENT = "src/main/java/com/prx301/finalproject/truyencapnhat/xmlConfigs/default_xml.xml";

    public MyURIResolver() {
        super();
    }

    @Override
    public Source resolve(String href, String base) {
        Logger.getLogger().info("Resolving content from: " + href, MyURIResolver.class);

        // Pause handler
        while (isPause && !isStop) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, "Crawler cannot be paused", e, MyURIResolver.class);
            }
        }


        if (href != null && !isStop) {
            try {
                // Get content from website
                InputStream contentStream = ComUtils.getHttp(href);
                // Preprocess to string
                String rawContent = ComUtils.inputStreamToString(contentStream);

                List<String> filters = getToBeApplyFilter(this.crawlerConfig, getRelUrl(href));

                StringBuilder builder = new StringBuilder();
                if (filters.size() > 1) {
                    builder.append("<html>\n<body>\n");
                }
                if (filters != null) {
                    for (String filter : filters) {
                        String temp = ComUtils.getSubString(rawContent, filter);
                        builder.append(temp);
                    }
                }
                if (filters.size() > 1) {
                    builder.append("</body>\n</html>");
                }
                rawContent = builder.toString();

                String cleanedContent = ComUtils.cleanHTML(rawContent);
                cleanedContent = processContent(cleanedContent);

                InputStream testStream = new ByteArrayInputStream(cleanedContent.getBytes());
                DOMResult testDOM = trAXUtils.transform(new StreamSource(testStream), null, this);

                //  Do Parsing Test the document beforehand
                if (testDOM.getNode() != null) {
                    Logger.getLogger().info("HTML Content parsing test SUCCEED", MyURIResolver.class);


                    InputStream realStream = new ByteArrayInputStream(cleanedContent.getBytes());
                    Thread.sleep(1200);
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

        return new StreamSource(new ByteArrayInputStream(EMPTY_HTML_CONTENT.getBytes()));
    }

    public String processContent(String before) {
        Logger.getLogger().info("Default empty process method", MyURIResolver.class);
        return before;
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

    public void config (ConfigComp configComp) {
        this.crawlerConfig = configComp;
    }


    private List<String> getToBeApplyFilter(ConfigComp crawlerConfig, String href) {
        List<CleanFilter> allFilter = crawlerConfig.getCleanFilter();
        CleanFilter result = null;
        double maxIdentical = 0;
        for (CleanFilter filter : allFilter) {
            double curIdentical = StringComparator.computeMatching(filter.getPageUri(), href);
            if (curIdentical >= PATTERN_INDENTICAL_MEAN && curIdentical > maxIdentical) {
                maxIdentical = curIdentical;
                result = filter;
            }
        }
        return result.getFilterPatterns();
    }

    private String getRelUrl(String fullUrl) {
        String woProtocol = fullUrl.split("//")[1];
        String baseUrl = woProtocol.split("/")[0];
        return woProtocol.replace(baseUrl, "");
    }


}
