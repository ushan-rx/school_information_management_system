package com.school.classes;

public class Subject {

    private String sub_id;
    private String sub_name;
    private String teaching_hrs;
    private String exam_types;

    public Subject(String subId, String subName, String gradeId, String teachingHrs, String examTypes) {

        this.sub_id = subId;
        this.sub_name = subName;
        this.teaching_hrs = teachingHrs;
        this.exam_types = examTypes;

    }

        public String getSub_id() {
        return sub_id;
    }

    public String getSub_name() {
        return sub_name;
    }

    public String getTeaching_hrs() {
        return teaching_hrs;
    }

    public String getExam_types() {
        return exam_types;
    }


    }

