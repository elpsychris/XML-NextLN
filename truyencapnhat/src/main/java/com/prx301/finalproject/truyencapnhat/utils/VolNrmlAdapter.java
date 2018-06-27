package com.prx301.finalproject.truyencapnhat.utils;

import javax.xml.bind.annotation.adapters.XmlAdapter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class VolNrmlAdapter extends XmlAdapter<String, String> {
    @Override
    public String unmarshal(String v) throws Exception {
        Pattern pattern = Pattern.compile("[^-\\d]+[ ]?[0-9]+");
        Matcher matcher = pattern.matcher(v);
        if (matcher.find()) {
            String matched = matcher.group(0);
            Logger.getLogger().info("Found name: " + v, UpdateNrmlAdapter.class);
            v = matched;
            Logger.getLogger().info("Normalize name to: " + v, UpdateNrmlAdapter.class);
        }
        return v;
    }

    @Override
    public String marshal(String v) throws Exception {
        return v;
    }
}
