package com.prx301.finalproject.truyencapnhat.model.crawler.model;

import java.util.ArrayList;
import java.util.List;

public class RecommendProject {
    private int projectId;
    private List<Double> weightList = new ArrayList<>();
    private double totalSim = 0;
    private double finalScore = 0;

    public RecommendProject(int projectId) {
        this.projectId = projectId;
    }
//
//    public RecommendProject(int projectId, List<Double> weightList) {
//        this.projectId = projectId;
//        this.weightList = weightList;
//    }

    public void calcFinalScore() {
        double total = 0;
        for (Double w : weightList) {
            total += w;
        }
        finalScore = total / totalSim;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public List<Double> getWeightList() {
        return weightList;
    }

    public void setWeightList(List<Double> weightList) {
        this.weightList = weightList;
    }

    public void addNewProject(double w, double sim) {
        this.totalSim += sim;
        this.weightList.add(w);
    }

    public double getTotalSim() {
        return totalSim;
    }

    public void setTotalSim(double totalSim) {
        this.totalSim = totalSim;
    }

    public double getFinalScore() {
        return finalScore;
    }

    public void setFinalScore(double finalScore) {
        this.finalScore = finalScore;
    }
}
