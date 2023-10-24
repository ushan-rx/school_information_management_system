package com.school.controller;

import com.school.classes.StaffUtility;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet("/manageStaff")
public class ManageStaff extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("us") == null) {
            resp.sendRedirect("index.jsp");
        } else {
            req.getRequestDispatcher("WEB-INF/modifyStaff.jsp").forward(req, resp);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        StaffUtility su = new StaffUtility();

        if (req.getParameter("submit-btn").equals("insert")) {

            if (req.getParameter("fname") != null && req.getParameter("lname") != null && req.getParameter("dob") != null
                    && req.getParameter("gender") != null && req.getParameter("telno") != null && req.getParameter("role") != null
                    && req.getParameter("email") != null && req.getParameter("pwd") != null && req.getParameter("sub") != null) {


                String fname = req.getParameter("fname");
                String lname = req.getParameter("lname");
                String dob = req.getParameter("dob");
                String gender = req.getParameter("gender").toUpperCase();
                String telno = req.getParameter("telno");
                String role = req.getParameter("role");
                String email = req.getParameter("email");
                String pwd = req.getParameter("pwd");
                String sub = req.getParameter("sub");

                try {
                    su.insertStaff(fname,lname,dob,gender,telno,role,email,pwd,sub);
                } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                }

            }

        } else if (req.getParameter("submit-btn").equals("update")) {

            if (req.getParameter("sid") != null && req.getParameter("fname") != null && req.getParameter("lname") != null && req.getParameter("dob") != null
                    && req.getParameter("gender") != null && req.getParameter("telno") != null && req.getParameter("role") != null
                    && req.getParameter("email") != null && req.getParameter("pwd") != null && req.getParameter("sub") != null) {


                String sid = req.getParameter("sid");
                String fname = req.getParameter("fname");
                String lname = req.getParameter("lname");
                String dob = req.getParameter("dob");
                String gender = req.getParameter("gender").toUpperCase();
                String telno = req.getParameter("telno");
                String role = req.getParameter("role");
                String email = req.getParameter("email");
                String pwd = req.getParameter("pwd");
                String sub = req.getParameter("sub");

                try {
                    su.updateStaff(sid, fname,lname,dob,gender,telno,role,email,pwd,sub);
                } catch (SQLException | ClassNotFoundException e) {
                    req.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(req, resp);
                    throw new RuntimeException(e);
                } catch (NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                }

            }


        } else if (req.getParameter("submit-btn").equals("delete")) {
            
            
        } else if (req.getParameter("submit-btn").equals("search")) {
            
        }

    }
}
