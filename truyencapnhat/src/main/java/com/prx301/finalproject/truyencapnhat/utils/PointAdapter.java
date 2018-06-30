package com.prx301.finalproject.truyencapnhat.utils;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class PointAdapter extends XmlAdapter<String, Double> {


    @Override
    public Double unmarshal(String v) throws Exception {
        return Double.parseDouble(v);
    }

    @Override
    public String marshal(Double v) throws Exception {
        return v.toString();
    }
}
