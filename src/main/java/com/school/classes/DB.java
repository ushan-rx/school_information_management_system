package com.school.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {

    public static Connection connection;

    public static void init_db() throws ClassNotFoundException, SQLException{
        if (connection == null){
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_system", "root", "1234");
        }
    }

    public static ResultSet search(String sql) throws SQLException, ClassNotFoundException {
        if(connection == null){
            init_db();
        }
        return connection.createStatement().executeQuery(sql);
    }

    public static void iud(String query) throws SQLException, ClassNotFoundException {
        if(connection == null){
            init_db();
        }
        connection.createStatement().execute(query);
    }


    
}
