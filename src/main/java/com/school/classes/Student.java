package com.school.classes;

public class Student {


 private String SID;

    private String FName;

    private String LName;

    private String DOB;

    private String Gender;

    private String Class_id;

    private String GName;

    private String GPhoneNum;

    private int Grade;

    private String City;


    public String getSID() {
        return SID;
    }

    public String getFName() {
        return FName;
    }

    public String getLName() {
        return LName;
    }

    public String getDOB() {
        return DOB;
    }

    public String getGender() {
        return Gender;
    }


    public String getClass_id() {
        return Class_id;
    }

    public String getGName() {
        return GName;
    }

    public String getGPhoneNum() {
        return GPhoneNum;
    }

    public int getGrade() {
        return Grade;
    }

    public String getCity() {
        return City;
    }

    public Student(String SID, String FName, String LName, String DOB, String Gender, String Class_id, String GName, String GPhoneNum, int Grade, String City) {
        this.SID = SID;
        this.FName = FName;
        this.LName = LName;
        this.DOB = DOB;
       this.Gender = Gender;
       this.Class_id = Class_id;
        this.GName = GName;
        this.GPhoneNum = GPhoneNum;
        this.Grade = Grade;
        this.City = City;
    }
}