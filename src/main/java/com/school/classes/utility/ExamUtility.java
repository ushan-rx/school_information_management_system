package com.school.classes.utility;

import com.school.classes.DB;
import com.school.classes.Exam;
import com.school.classes.GenerateId;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExamUtility {

    public void insertExam(String name, String grade, String subject, String date,
                       String time, String duration, String method, String marks) throws SQLException, ClassNotFoundException {
        String get_id = "SELECT MAX(exam_id) AS 'ID' FROM exam";
        ResultSet rs = DB.search(get_id);
        if (rs.next()){
            String prev_id = rs.getString("ID");
            GenerateId gi = new GenerateId();
            String id = gi.generate(prev_id, "EX");

            String insQuery = "INSERT INTO exam (`exam_id`,`exam_name`,`method`," +
                    "`sub_id`,`grade_id`,`date`,`time`,`duration`,`total_marks`) " +
                    "VALUES ('"+id+"','"+name+"','"+method+"','"+subject+"','"+grade+
                    "','"+date+"','"+time+"','"+duration+"','"+marks+"')";

            DB.iud(insQuery);
        }
    }

    public void updateExam(String exam_id, String name, String grade, String subject, String date,
                           String time, String duration, String method, String marks) throws SQLException, ClassNotFoundException {


            String upQuery = "UPDATE exam SET `exam_name` = '"+name+"',`method` = '"+method+"', `sub_id` = '"+subject+"', `grade_id` = "+grade+
                    ", `date` = '"+date+"', `time` = '"+time+"', `duration` = "+duration+", `total_marks` = "+marks+" WHERE `exam_id`= '"+exam_id+"'";
            DB.iud(upQuery);
    }

    public Exam searchExam(String id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM exam WHERE exam_id = '"+id+"' AND status = 1";
        ResultSet rs = DB.search(sql);
        if (rs.next()){
            return new Exam(rs.getString("exam_id"), rs.getString("exam_name"),
                    rs.getString("method"), rs.getString("sub_id"),
                    rs.getString("grade_id"), rs.getString("date"),
                    rs.getString("time"), rs.getString("duration"),
                    rs.getString("total_marks"));
        }
        return null;
    }



    public List<Exam> viewExams() throws SQLException, ClassNotFoundException {
        List<Exam> results= new ArrayList<>();
        String get_query = "SELECT * FROM exam WHERE status = 1";
        ResultSet rs = DB.search(get_query);
        while(rs.next()){
            Exam row = new Exam(rs.getString("exam_id"), rs.getString("exam_name"),
                    rs.getString("method"), rs.getString("sub_id"),
                    rs.getString("grade_id"), rs.getString("date"),
                    rs.getString("time"), rs.getString("duration"),
                    rs.getString("total_marks"));

            results.add(row);
        }
        return results;
    }

    public List<Exam> viewExams(int grade) throws SQLException, ClassNotFoundException {
        List<Exam> results= new ArrayList<>();
        String get_query = "SELECT * FROM exam WHERE status =1 AND grade_id = "+ grade;
        ResultSet rs = DB.search(get_query);
        while(rs.next()){
            Exam row = new Exam(rs.getString("exam_id"), rs.getString("exam_name"),
                    rs.getString("method"), rs.getString("sub_id"),
                    rs.getString("grade_id"), rs.getString("date"),
                    rs.getString("time"), rs.getString("duration"),
                    rs.getString("total_marks"));

            results.add(row);
        }
        return results;
    }
}
