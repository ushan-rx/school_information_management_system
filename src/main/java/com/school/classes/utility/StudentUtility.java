package com.school.classes.utility;

import com.school.classes.DB;
import com.school.classes.Exam;
import com.school.classes.GenerateId;
import com.school.classes.Student;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

public class StudentUtility {
    public void insert(String FName, String LName, String DOB, String Gender,
                       String City, String Class_id, String GName, String GPhone, int Grade) throws SQLException, ClassNotFoundException {

        String get_SID = "select MAX(sid) as 'SID' from student";
        ResultSet rs = DB.search(get_SID);
        if (rs.next()) {
            String prev_SID = rs.getString("SID");
            GenerateId gi = new GenerateId();
            String id = gi.generate(prev_SID, "ST");

            String insQuery = "INSERT INTO student (`sid`,`fname`,`lname`,`dob`,`gender`,`city`,`class_id`,`parent_name`,`tp`,`grade`)" +
                    " VALUES('" + id + "','" + FName + "','" + LName + "','" + DOB + "','" + Gender + "','" + City + "','" + Class_id + "', '" + GName + "','" + GPhone + "'," + Grade + ")";

            DB.iud(insQuery);
        }

    }

    public void update(String SID, String FName, String LName, String DOB, String Gender,
                       String City, String Class_id, String GName, String GPhone, int Grade) throws SQLException, ClassNotFoundException {

        String insQuery = "UPDATE student SET `fname` = '"+FName+"',`lname` = '"+LName+"',`dob` = '"+DOB+"',`gender` = '"+Gender+"',`city` = '"+City+"',`class_id` = '"+Class_id+"',`parent_name` = '"+GName+"',`tp` = '"+GPhone+"',`grade` = "+Grade+" WHERE `sid` = '"+SID+"'";

        DB.iud(insQuery);

    }

    public Student search(String id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM student WHERE sid = '"+id+"' AND status = 1";
        ResultSet rs = DB.search(sql);
        if (rs.next()){
            return new Student(rs.getString("sid"), rs.getString("fname"),
                    rs.getString("lname"), rs.getString("dob"),
                    rs.getString("gender"), rs.getString("class_id"), rs.getString("parent_name"), rs.getString("tp"),
                    Integer.parseInt(rs.getString("grade")), rs.getString("city"));
        }
        return null;
    }

    public List<Student> viewStudent() throws SQLException, ClassNotFoundException {
        List<Student> results = new ArrayList<>();
        String get_query = "SELECT * FROM student WHERE status = 1";
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


    public List<Student> viewStudent(String clsid) throws SQLException, ClassNotFoundException {
        List<Student> results = new ArrayList<>();
        String get_query = "SELECT * FROM student WHERE status = 1 AND class_id = '"+clsid+"'";
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


    public LinkedHashMap<String, String> getClasses() throws SQLException, ClassNotFoundException {
        LinkedHashMap<String, String> cls = new LinkedHashMap<>();
        String query = "SELECT * FROM student where status = 1";
        ResultSet rs = DB.search(query);
        while (rs.next()){
            cls.put(rs.getString("class_id"), rs.getString("class_id"));
        }
        return cls;
    }

}














