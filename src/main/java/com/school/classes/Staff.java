package com.school.classes;

public class Staff {

    private String sid;
    private String fname;
    private String lname;
    private String dob;
    private String gender;
    private String telno;
    private String role;
    private String email;
    private String pwd;
    private String sub_id;

    public Staff(String sid, String fname, String lname, String dob, String gender, String telno, String role, String email, String pwd, String sub_id)
    {
        this.sid = sid;
        this.fname =fname;
        this.lname =lname;
        this.dob =dob;
        this.gender =gender;
        this.telno =telno;
        this.role =role;
        this.email =email;
        this.pwd =pwd;
        this.sub_id =sub_id;

    }
    public String getSid() {
        return sid;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getDob() {
        return dob;
    }

    public String getGender() {
        return gender;
    }

    public String getTelno() {
        return telno;
    }

    public String getRole() {
        return role;
    }

    public String getEmail() {
        return email;
    }

    public String getPwd() {
        return pwd;
    }

    public String getSub_id() {
        return sub_id;
    }





}
