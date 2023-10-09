package com.school.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {

    public static Connection connection;

    public static void init_db() throws ClassNotFoundException, SQLException{
        if (connection == null){
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_system", "root", "1234");
            System.out.println(connection);
        }
    }


}
