package com.prx301.finalproject.truyencapnhat.utils;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class LowerCaseAdapter extends XmlAdapter<String, String> {
    @Override
    public String unmarshal(String v) throws Exception {
        return v.toLowerCase().trim();
    }

    @Override
    public String marshal(String v) throws Exception {
        return v.toLowerCase().trim();
    }
}
