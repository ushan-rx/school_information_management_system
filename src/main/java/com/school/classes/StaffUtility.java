package com.school.classes;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StaffUtility {

//view
    public  ArrayList<Staff> viewStaff() throws SQLException, ClassNotFoundException {

        ArrayList<Staff> st = new ArrayList<>();



        String sql = "select * from staff";
        ResultSet rs = DB.search(sql);

        while (rs.next()) {

            String sid = rs.getString(1);
            String fname = rs.getString(2);
            String lname = rs.getString(3);
            String dob = rs.getString(4);
            String gender = rs.getString(5);
            String telno = rs.getString(6);
            String role = rs.getString(7);
            String email = rs.getString(8);
            String pwd = rs.getString(9);
            String sub_id = rs.getString(10);

            Staff s = new Staff(sid, fname, lname, dob, gender, telno, role, email, pwd, sub_id);
            st.add(s);
        }

        return st;
    }

    public  ArrayList<Staff> viewStaff(String role) throws SQLException, ClassNotFoundException {

        ArrayList<Staff> st = new ArrayList<>();



            String sql = "select * from staff where status = 1 and role ='" + role + "'";
            ResultSet rs = DB.search(sql);

            while (rs.next()) {
                System.out.println(rs.getString(1));
                String  sid = rs.getString(1);
                String fname = rs.getString(2);
                String lname = rs.getString(3);
                String dob = rs.getString(4);
                String gender = rs.getString(5);
                String telno = rs.getString(6);
                       role = rs.getString(7);
                String email = rs.getString(8);
                String pwd = rs.getString(9);
                String sub_id = rs.getString(10);

                Staff s = new Staff(sid, fname, lname, dob, gender, telno, role, email, pwd, sub_id);
                st.add(s);
            }

        return st;
    }



    // insert
    public void insertStaff(String fname, String lname, String dob, String gender, String telno, String role, String email, String pwd, String sub_id) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(pwd.getBytes());
        byte[] pwByte = md.digest();
        String pwHash = new BigInteger(1, pwByte).toString(16);

        String getid = "select max(staff_id) as 'ID' from staff";
        ResultSet rs = DB.search(getid);

        if (rs.next()) {

            String prev_id = rs.getString("ID");
            GenerateId gid = new GenerateId();
            String id = gid.generate(prev_id, "SF");

            String query = "insert into staff (`staff_id`,`fname`,`lname`,`dob`,`gender`,`tp`,`role`,`email`,`pw`,`sub_id`)" +
                    " values ('" + id + "','" + fname + "','" + lname + "','" + dob + "','" + gender + "','" + telno + "','" +
                    role + "','" + email + "','" + pwHash + "','" + sub_id + "')";
            DB.iud(query);

        }

    }

    //update
    public void updateStaff(String sid, String fname, String lname, String dob, String gender, String telno, String role, String email, String pwd, String sub) throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(pwd.getBytes());
        byte[] pwByte = md.digest();
        String pwHash = new BigInteger(1, pwByte).toString(16);

        String query = "UPDATE staff SET `fname` = '"+fname+"',`lname` = '"+lname+"',`dob` = '"+dob+"',`gender` = '"+gender+"',`tp` = '"+telno+"',`role` = '"+role+"',`email` = '"+email+"',`pw` = '"+pwHash+"',`sub_id` = '"+sub+"' WHERE `staff_id` = '"+sid+"'";

        DB.iud(query);

    }




}