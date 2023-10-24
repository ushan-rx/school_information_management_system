package com.school.classes.utility;

import com.school.classes.DB;
import com.school.classes.Exam;
import com.school.classes.GenerateId;
import com.school.classes.Result;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

public class ResultUtility {

    public void insertResult(String sid, String subId, String exId, String classId, Double mark) throws SQLException, ClassNotFoundException {
        String get_id = "SELECT MAX(result_id) AS 'ID' FROM result";
        ResultSet rs = DB.search(get_id);
        if (rs.next()){
            String prev_id = rs.getString("ID");
            GenerateId gi = new GenerateId();
            String id = gi.generate(prev_id, "RS");

            String insQuery = "INSERT INTO result (`result_id`,`sid`,`sub_id`,`exam_id`,`class_id`,`mark`,`status`)" +
                    "VALUES('"+id+"','"+sid+"','"+subId+"','"+exId+"','"+classId+
                    "','"+mark+"')";

            DB.iud(insQuery);
        }
    }

    public void updateResult(String rid,String sid, String subId, String exId, String classId, Double mark) throws SQLException, ClassNotFoundException {


            String upQuery = "UPDATE exam SET SET `result_id` = '"+rid+"',`sid` = '"+sid+"',`sub_id` = '"+subId+"',`exam_id` = '"+exId+"',`class_id` = '"+classId+"',`mark` = "+mark+" WHERE `result_id` = '"+rid+"'";
            DB.iud(upQuery);
    }

    public Result searchResult(String id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM result WHERE result_id = '"+id+"' AND status = 1";
        ResultSet rs = DB.search(sql);
        if (rs.next()){
            return new Result(rs.getString("result_id"), rs.getString("sid"),
                    rs.getString("sub_id"), rs.getString("exam_id"),
                    rs.getString("class_id"), Double.parseDouble(rs.getString("mark")));
        }
        return null;
    }



    public List<Result> viewResults() throws SQLException, ClassNotFoundException {
        List<Result> results = new ArrayList<>();
        String get_query = "SELECT * FROM result WHERE status = 1";
        ResultSet rs = DB.search(get_query);
        while(rs.next()){
            Result row = new Result(rs.getString("result_id"), rs.getString("sid"),
                    rs.getString("sub_id"), rs.getString("exam_id"),
                    rs.getString("class_id"), Double.parseDouble(rs.getString("mark")));

            results.add(row);
        }
        return results;
    }

    public List<Result> viewResults(String cls, String exid) throws SQLException, ClassNotFoundException {
        List<Result> results= new ArrayList<>();
        String get_query = "SELECT * FROM result WHERE status =1 AND exam_id = '"+exid+"' AND class_id = '"+cls+"'";
        ResultSet rs = DB.search(get_query);
        while(rs.next()){
            Result row = new Result(rs.getString("result_id"), rs.getString("sid"),
                    rs.getString("sub_id"), rs.getString("exam_id"),
                    rs.getString("class_id"), Double.parseDouble(rs.getString("mark")));

            results.add(row);
        }
        return results;
    }

    public LinkedHashMap<String, String> getClasses() throws SQLException, ClassNotFoundException {
        LinkedHashMap<String, String> classes = new LinkedHashMap<>();
        String query = "SELECT * FROM class";

        ResultSet rs = DB.search(query);
        while (rs.next()){
            classes.put(rs.getString("class_id"), rs.getString("class_name"));
        }
        return classes;
    }

    public LinkedHashMap<String, String> getExams() throws SQLException, ClassNotFoundException {
        LinkedHashMap<String, String> exams = new LinkedHashMap<>();
        String query = "SELECT * FROM exam";

        ResultSet rs = DB.search(query);
        while (rs.next()){
            exams.put(rs.getString("exam_id"), rs.getString("exam_name"));
        }
        return exams;
    }
}



