package com.prx301.finalproject.truyencapnhat.util;

import com.sun.codemodel.JCodeModel;
import com.sun.tools.xjc.api.ErrorListener;
import com.sun.tools.xjc.api.S2JJAXBModel;
import com.sun.tools.xjc.api.SchemaCompiler;
import com.sun.tools.xjc.api.XJC;
import org.xml.sax.InputSource;
import org.xml.sax.SAXParseException;

import java.io.File;
import java.io.IOException;

public class JAXBUtil {
    public static void XJCGenJavaObj(String output, String packageName, String schemaUri) throws IOException {
        SchemaCompiler sc = XJC.createSchemaCompiler();
        sc.setErrorListener(new ErrorListener() {
            @Override
            public void error(SAXParseException e) {
                System.out.println("error " + e.getMessage());
            }

            @Override
            public void fatalError(SAXParseException e) {
                System.out.println("fatal " + e.getMessage());
            }

            @Override
            public void warning(SAXParseException e) {
                System.out.println("warning " + e.getMessage());
            }

            @Override
            public void info(SAXParseException e) {
                System.out.println("info " + e.getMessage());
            }
        });

        sc.forcePackageName(packageName);
        File schema = new File(schemaUri);
        InputSource inputSource = new InputSource(schema.toURI().toString());
        sc.parseSchema(inputSource);
        S2JJAXBModel s2JJAXBModel = sc.bind();
        JCodeModel code = s2JJAXBModel.generateCode(null, null);
        code.build(new File(output));
        System.out.println("Finished");
    }
}
