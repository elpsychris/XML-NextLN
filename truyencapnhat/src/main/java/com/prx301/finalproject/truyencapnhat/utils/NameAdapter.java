package com.prx301.finalproject.truyencapnhat.utils;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class NameAdapter extends XmlAdapter<String, String> {
    @Override
    public String unmarshal(String v) throws Exception {
        v = v.replace("&quot;","");
        v = v.replace("&#039;","'");
        return v;
    }

    @Override
    public String marshal(String v) throws Exception {
        return v;
    }
}
