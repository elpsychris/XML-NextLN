@XmlSchema(elementFormDefault = XmlNsForm.QUALIFIED,
        namespace = "http://t3.com/2018/xml/config",
        xmlns = {
                @XmlNs(prefix = "p",
                        namespaceURI = "http://t3.com/2018/xml/config"),
        })
package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import javax.xml.bind.annotation.XmlNs;
import javax.xml.bind.annotation.XmlNsForm;
import javax.xml.bind.annotation.XmlSchema;