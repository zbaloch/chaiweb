package com.chaihq.webapp.models;

import java.util.Calendar;

public class Project {
    private String name;
    private String description;
    private String projectType;

    // private Calendar createdAt;
    // private Calendar createdBy;
    // private String status; // Wheter its deleted, archived or active - Default is active
    // private int userId; // who created this project.


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProjectType() {
        return projectType;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType;
    }
}
