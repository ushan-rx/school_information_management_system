package com.school.classes;

public class Result {
    private String id;
    private String sid;
    private String subId;
    private String exId;
    private String classId;
    private Double mark;

    public Result(String id, String sid, String subId, String exId, String classId, Double mark) {
        this.id = id;
        this.sid = sid;
        this.subId = subId;
        this.exId = exId;
        this.classId = classId;
        this.mark = mark;
    }

    public String getId() {
        return id;
    }

    public String getSid() {
        return sid;
    }

    public String getSubId() {
        return subId;
    }

    public String getExId() {
        return exId;
    }

    public String getClassId() {
        return classId;
    }

    public Double getMark() {
        return mark;
    }

}
