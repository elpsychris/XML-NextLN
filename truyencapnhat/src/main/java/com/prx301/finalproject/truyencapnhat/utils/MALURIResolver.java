package com.prx301.finalproject.truyencapnhat.utils;

import com.prx301.finalproject.truyencapnhat.model.crawler.model.ConfigComp;

public class MALURIResolver extends MyURIResolver{
    public MALURIResolver() {
        super();
    }

    @Override
    public String processContent(String before) {
        String after = before.replaceAll("<td valign=\"top\" style=\"padding-left: 5px;\">[\\s\\S]+</td>","");
        after = after.replaceAll("</span>[\\s]*</small>", "</small>");
        return after;
    }
}
