package com.school.classes;

import java.sql.ResultSet;
import java.sql.SQLException;

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


            String insQuery = "UPDATE exam SET `exam_name` = '"+name+"',`method` = '"+method+"', `sub_id` = '"+subject+"', `grade_id` = "+grade+
                    ", `date` = '"+date+"', `time` = '"+time+"', `duration` = "+duration+", `total_marks` = "+marks+" WHERE `exam_id`= '"+exam_id+"'";
            DB.iud(insQuery);
    }
}
