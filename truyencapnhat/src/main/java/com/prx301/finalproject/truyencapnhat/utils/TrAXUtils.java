package com.prx301.finalproject.truyencapnhat.utils;

import javax.xml.transform.*;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class TrAXUtils {
    private TransformerFactory factory = TransformerFactory.newInstance();


    public DOMResult transform(StreamSource from, StreamSource xsl, MyURIResolver uriResolver) throws IOException, InterruptedException {
        if (factory.getURIResolver() == null) {
            factory.setURIResolver(uriResolver);
        }
        DOMResult rsDOM = new DOMResult();
//                StreamResult rsDOM = new StreamResult(new FileWriter(new File("src/main/java/result.xml")));
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
            e.printStackTrace();
            Logger.getLogger().log(Logger.LOG_LEVEL.ERROR, "Cannot parse HTML content. Return default document", e, TrAXUtils.class);
        }
        return rsDOM;
    }

}
