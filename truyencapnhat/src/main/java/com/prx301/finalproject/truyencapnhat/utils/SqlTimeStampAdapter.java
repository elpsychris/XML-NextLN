package com.prx301.finalproject.truyencapnhat.utils;

import javax.xml.bind.annotation.adapters.XmlAdapter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SqlTimeStampAdapter extends XmlAdapter<String, Timestamp> {
    private final SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");

    @Override
    public Timestamp unmarshal(String v) throws Exception {
        return new Timestamp(formatter.parse(v).getTime());
    }

    @Override
    public String marshal(Timestamp v) throws Exception {
        return formatter.format(new Date(v.getTime()));
    }
}
