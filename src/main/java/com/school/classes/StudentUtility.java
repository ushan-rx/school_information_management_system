package com.school.classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentUtility {
    public void insert(String FName, String LName, String DOB, String Gender,
                       String City, String Class_id, String GName, String GPhone, int Grade) throws SQLException, ClassNotFoundException {

        String get_SID = "select MAX('sid') as SID from student";
        ResultSet rs = DB.search(get_SID);
        if (rs.next()) {
            String prev_SID = rs.getString("SID");
            GenerateId gi = new GenerateId();
            String id = gi.generate(prev_SID, "ST");

            String insQuery = "Insert INTO student (`sid`,`fname`,`lname`,`dob`,`gender`,`city`,`class_id`,`parent_name`,`tp`,'grade`)" +
                    " values('" + id + "','" + FName + "','" + LName + "','" + DOB + "','" + Gender + "','" + City + "','" + Class_id + "', '" + GName + "','" + GPhone + "','" + Grade + "')";

            DB.iud(insQuery);

        }

    }

    public void update(String SID, String FName, String LName, String DOB, String Gender,
                       String City, String Class_id, String GName, String GPhone, int Grade) throws SQLException, ClassNotFoundException {

        String insQuery = "UPDATE student SET `fname` = '" + FName + "',`lname` = '" + LName + "',`dob` = '" + DOB + "',`gender` = '" + Gender + "'," +
                "`city` = '" + City + "',`class_id` = '" + Class_id + "',`parent_name` = '" + GName + "',`tp` = '" + GPhone + "','grade` = '" + Grade + "')";

        DB.iud(insQuery);

    }

    public List<Student> viewStudent() throws SQLException, ClassNotFoundException {
        List<Student> results = new ArrayList<>();
        String get_query = "SELECT * FROM student WHERE status =1";
        ResultSet rs = DB.search(get_query);
        while (rs.next()) {
            Student row = new Student(rs.getString("sid"), rs.getString("fname"),
                    rs.getString("lname"), rs.getString("dob"),
                    rs.getString("gender"), rs.getString("class_id"), rs.getString("parent_name"), rs.getString("tp"),
                    Integer.parseInt(rs.getString("grade")), rs.getString("city"));

            results.add(row);
        }
        return results;
    }


    public List<Student> viewStudent(int sid) throws SQLException, ClassNotFoundException {
        List<Student> results = new ArrayList<>();
        String get_query = "SELECT * FROM student WHERE status =1 AND sid = " + sid;
        ResultSet rs = DB.search(get_query);
        while (rs.next()) {
            Student row = new Student(rs.getString("sid"), rs.getString("fname"),
                    rs.getString("lname"), rs.getString("dob"),
                    rs.getString("gender"),
                    rs.getString("class_id"),
                    rs.getString("parent_name"), rs.getString("tp"),
                    Integer.parseInt(rs.getString("grade")), rs.getString("city"));

            results.add(row);
        }
        return results;
    }


}














