package com.prx301.finalproject.truyencapnhat.model.crawler.model;

public class SimResult {
    private String username;
    private double similarity;

    public SimResult(String username, double similarity) {
        this.username = username;
        this.similarity = similarity;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getSimilarity() {
        return similarity;
    }

    public void setSimilarity(double similarity) {
        this.similarity = similarity;
    }
}
