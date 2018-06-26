package com.prx301.finalproject.truyencapnhat.model;


import com.prx301.finalproject.truyencapnhat.repository.ProjectRepo;
import com.prx301.finalproject.truyencapnhat.utils.ComUtils;
import com.prx301.finalproject.truyencapnhat.utils.JAXBUtils;
import com.prx301.finalproject.truyencapnhat.utils.Logger;
import com.prx301.finalproject.truyencapnhat.utils.TrAXUtils;
import org.xml.sax.SAXException;

import javax.xml.bind.JAXBException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class Spider {
    private final String DEFAULT_PARENT_PATH = "src/main/java/com/prx301/finalproject/truyencapnhat";
    private ProjectRepo projectRepo = null;
    private DOMResult result = null;
    private Logger logger = null;

//    public Spider() {
//    }
//
//    public Spider(ProjectRepo projectRepo, Logger logger) {
//        this.projectRepo = projectRepo;
//        this.logger = logger;
//    }


    public Spider(ProjectRepo projectRepo) {
        this.projectRepo = projectRepo;
        this.logger = Logger.getLogger();
    }

    interface ParserHandler {
        void onParsed(DOMResult domResult);

        void onError(Exception e);
    }

    public void start(String configPath, String xslPath, ParserHandler handler) throws IOException, TransformerException, InterruptedException {
        this.result = this.crawl(configPath, xslPath);
        handler.onParsed(this.result);
    }

    public void start(String configPath, String xslPath) {
//        Runnable thread = () -> {
//            try {
//                Thread.sleep(3000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//            TrAXUtils.stop();
//            Thread.interrupted();
//        };
//
//        Thread thread1 = new Thread(thread);
//        thread1.start();
        try {
            this.result = this.crawl(configPath, xslPath);
        } catch (TransformerException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, e, Spider.class);
        } catch (IOException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, e, Spider.class);
        } catch (InterruptedException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, e, Spider.class);
        }

        try {
            Schema schema = JAXBUtils.getSchema("src/main/java/com/prx301/finalproject/truyencapnhat/schema/project_page.xsd");
            Projects projects = JAXBUtils.<Projects>xmlToObject(this.result, schema, Projects.class);
            for (ProjectEntity project : projects.getProjects()) {
                project.setProjectHash(project.hashCode() + "");
                for (UpdateEntity updateEntity : project.getUpdates()) {
                    updateEntity.setProject(project);
                }
                projectRepo.save(project);
            }

        } catch (SAXException e) {
            logger.log(Logger.LOG_LEVEL.WARNING, "SAXException", e, ComUtils.class);
        } catch (JAXBException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, e, Spider.class);
        }

//        handler.onParsed(this.result);
    }


//    public void setStartUrls(List<String> startUrls, Pattern pattern, String xslPath) {
//        try {
//            execute(startUrls, pattern, xslPath);
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        } catch (XMLStreamException e) {
//            e.printStackTrace();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
//    }

//    public void setStartUrls(List<String> startUrls, ParserHandler handler, Pattern pattern) {
//        try {
//            execute(startUrls, handler, pattern);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//    }
//
//    public void setStartUrls(String startUrl, Pattern pattern) {
//        List<String> startUrls = new ArrayList<String>();
//        startUrls.add(startUrl);
//        setStartUrls(startUrls, pattern);
//    }

    //
//    private void getContent(String filePath, String uri) throws InterruptedException {
//        Writer writer = null;
    private DOMResult crawl(String configPath, String xslPath) throws TransformerException, IOException, InterruptedException {
        StreamSource xsl = new StreamSource(xslPath);

        InputStream is = new FileInputStream(configPath);
        StreamSource config = new StreamSource(is);

        return TrAXUtils.transform(config, xsl);
    }

    //
//    abstract void parse(String startUrl, InputStream document);

    //
//    private void execute(List<String> startUrls, Pattern pattern) throws FileNotFoundException, XMLStreamException, InterruptedException, UnsupportedEncodingException {
//        if (startUrls != null) {
//            for (String url : startUrls) {
////                getContent(url, pattern);
////                ByteArrayInputStream documentInputStream = new ByteArrayInputStream(document.getBytes());
////                XMLEventReader reader = StAXUtils.getEventReader(byteInputStream);
//                parse(url, documentInputStream);
//            } // end for
//        }// end if
//    }

    //
//    private void execute(List<String> startUrls, ParserHandler handler, Pattern pattern, String configPath, String xslPath) throws InterruptedException, FileNotFoundException {
//        if (startUrls != null) {
//            for (String page : startUrls) {
//                getContent(page);
//                try {
//                    ByteArrayInputStream documentInputStream = new ByteArrayInputStream(document.getBytes());
////                    XMLEventReader reader = StAXUtils.getEventReader(byteInputStream);
//                    handler.onParse(page, documentInputStream);
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }
//            } // end for
//        }// end if
//    }

    //
//    public void close() {
//        this.webDriver.quit();
//    }
//
//    public List<WebElement> extractElements(String expr) throws NoSuchElementException {
//        return this.webDriver.findElements(By.xpath(expr));
//    }
//
//    public WebElement extractElement(String expr) throws NoSuchElementException {
//        return this.webDriver.findElement(By.xpath(expr));
//    }
}
