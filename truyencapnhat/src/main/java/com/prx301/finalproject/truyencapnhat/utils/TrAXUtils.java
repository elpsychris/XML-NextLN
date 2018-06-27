package com.prx301.finalproject.truyencapnhat.utils;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class TrAXUtils {
    private static MyURIResolver uriResolver = new MyURIResolver();
    private static TransformerFactory factory = TransformerFactory.newInstance();


    public static DOMResult transform(StreamSource from, StreamSource xsl) throws IOException, InterruptedException {
        if (factory.getURIResolver() == null) {
            factory.setURIResolver(uriResolver);
        }
        DOMResult rsDOM = new DOMResult();
//                StreamResult rsDOM = new StreamResult(new FileWriter(new File("src/main/java/crawl_temp/result.xml")));
        Transformer transformer = null;
        try {
            if (xsl != null) {
                transformer = factory.newTransformer(xsl);
            } else {
                transformer = factory.newTransformer();
            }
            transformer.transform(from, rsDOM);
        } catch (TransformerConfigurationException e) {
            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, e, TrAXUtils.class);
        } catch (TransformerException e) {
            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, "Cannot parse HTML content. Return default document", e, TrAXUtils.class);
        }
        return rsDOM;
    }

    public static void stop() {
        uriResolver.stop();
    }


}
