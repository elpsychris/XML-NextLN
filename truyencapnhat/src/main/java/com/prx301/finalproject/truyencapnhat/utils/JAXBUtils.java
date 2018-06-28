package com.prx301.finalproject.truyencapnhat.utils;

import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.bind.*;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import java.io.File;

public class JAXBUtils {
    private final static String DEFAULT_ENCODE = "UTF-8";
    private final static SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
    private static Logger logger = Logger.getLogger();

    public static <T> void objectToXML(T src, Result result) throws JAXBException {
        JAXBContext context = JAXBContext.newInstance(src.getClass());
        Marshaller marshaller = context.createMarshaller();

        marshaller.setProperty(Marshaller.JAXB_ENCODING, DEFAULT_ENCODE);
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.FALSE);
        marshaller.marshal(src, result);
    }

    public static <T> T xmlToObject(DOMResult xml, Class<T>... classes) throws JAXBException {
        return xmlToObject(xml, null, classes);
    }

    public static <T> T xmlToObject(File file, Class<T> tClass) throws JAXBException {
        JAXBContext context = JAXBContext.newInstance(tClass);
        Unmarshaller unmarshaller = context.createUnmarshaller();

        T result = null;

        try {
            result = (T) unmarshaller.unmarshal(file);
        } catch (UnmarshalException e) {
            logger.log(Logger.LOG_LEVEL.ERROR, e, JAXBUtils.class);
        }
        return result;
    }

    public static <T> T xmlToObject(DOMResult xml, Schema schema, Class<T>... classes) throws JAXBException {
        JAXBContext context = JAXBContext.newInstance(classes);
        Unmarshaller unmarshaller = context.createUnmarshaller();

        if (schema != null) {
            unmarshaller.setSchema(schema);
            unmarshaller.setEventHandler(new MyValidationEventHandler());
        }
        T object = null;
        try {
            object = (T) unmarshaller.unmarshal(xml.getNode());
        }catch (UnmarshalException ex) {
            logger.log(Logger.LOG_LEVEL.ERROR, "Error happened in the Unmarshalling progress", ex, JAXBUtils.class);
        }
        return object;
    }

    public static Schema getSchema(String... schemaUrls) throws SAXException {
        Source[] sources = new Source[schemaUrls.length];
        for (int i = 0; i < schemaUrls.length; i++) {
            sources[i] = new StreamSource(new File(schemaUrls[i]));
        }
        return schemaFactory.newSchema(sources);
    }

}

class MyValidationEventHandler implements ValidationEventHandler {

    @Override
    public boolean handleEvent(ValidationEvent event) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("\nEVENT");
        stringBuilder.append("\nSEVERITY: " + event.getSeverity());
        stringBuilder.append("\nMESSAGE: " + event.getMessage());
        stringBuilder.append("\nLINKED EXCEPTION: " + event.getLinkedException());
        stringBuilder.append("\nLOCATOR");
        stringBuilder.append("\n\t\tLINE NUMBER: " + event.getLocator().getLineNumber());
        stringBuilder.append("\n\t\tCOL NUMBER: " + event.getLocator().getColumnNumber());
        stringBuilder.append("\n\tOFFSET: " + event.getLocator().getOffset());
        stringBuilder.append("\nOBJECT: " + event.getLocator().getObject());
        stringBuilder.append("\n\t\tNODE: " + event.getLocator().getNode());
        stringBuilder.append("\n\t\tURL: " + event.getLocator().getURL());

        Logger.getLogger().log(Logger.LOG_LEVEL.WARNING, stringBuilder.toString(), null, JAXBUtils.class);
        return true;
    }
}
