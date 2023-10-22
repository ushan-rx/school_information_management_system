package com.school.classes;

public class Exam {

    private String id;
    private String name;
    private String method;
    private String sub_id;
    private String grade;
    private String date;
    private String time;
    private String duration;
    private String total_marks;

    public Exam(String id, String name, String method, String sub_id, String grade, String date, String time, String duration, String total_marks) {
        this.id = id;
        this.name = name;
        this.method = method;
        this.sub_id = sub_id;
        this.grade = grade;
        this.date = date;
        this.time = time;
        this.duration = duration;
        this.total_marks = total_marks;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getMethod() {
        return method;
    }

    public String getSub_id() {
        return sub_id;
    }

    public String getGrade() {
        return grade;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public String getDuration() {
        return duration;
    }

    public String getTotal_marks() {
        return total_marks;
    }


}
