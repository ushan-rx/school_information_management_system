package com.school.classes;

import jakarta.security.enterprise.credential.Password;

import javax.xml.datatype.DatatypeConstants;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;

public class LoginValidation {

    private final String email;
    private final String pw;
    private String uid;

    private String uname;

    public LoginValidation(String email, String pw) {
        this.email = email;
        this.pw = pw;
    }

    public String getUid() {
        return uid;
    }

    public String getUname() {
        return uname;
    }

    public int validation() throws SQLException, ClassNotFoundException, NoSuchAlgorithmException {
        String sql = "SELECT * FROM staff WHERE email = '"+email+"'";
        ResultSet rs = DB.search(sql);
        if(rs.next()){
            String db_pw = rs.getString("pw");  // password hash from database

            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(pw.getBytes());
            byte [] digest = md.digest();
            String pw_hash = new BigInteger(1, digest).toString(16);

            if(pw_hash.equals(db_pw) && rs.getInt("status") == 1){
                uid = rs.getString("staff_id");
                uname = rs.getString("fname")+ "_" + rs.getString("lname");
                return 1;
            }else{
                return 0;
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        LoginValidation lv = new LoginValidation("admin@gmail.com", "admin1234");
        try {
            System.out.println(lv.validation());
        } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }


}
