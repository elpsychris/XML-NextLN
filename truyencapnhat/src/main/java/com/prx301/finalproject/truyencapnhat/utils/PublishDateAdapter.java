package com.prx301.finalproject.truyencapnhat.utils;

import javax.xml.bind.annotation.adapters.XmlAdapter;
import java.sql.Date;
import java.text.SimpleDateFormat;

public class PublishDateAdapter extends XmlAdapter<String, Date> {
    @Override
    public Date unmarshal(String v) throws Exception {
        String begin = v.split("to")[0].trim();
        SimpleDateFormat format = new SimpleDateFormat("MMM dd, yyyy");
        return new Date(format.parse(begin).getTime());
    }

    @Override
    public String marshal(Date v) throws Exception {
        return null;
    }
}
