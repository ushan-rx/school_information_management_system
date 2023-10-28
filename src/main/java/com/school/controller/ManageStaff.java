package com.school.controller;

import com.school.classes.Staff;
import com.school.classes.utility.StaffUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.LinkedHashMap;

@WebServlet("/manageStaff")
public class ManageStaff extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("us") == null) {
            resp.sendRedirect("index.jsp");
        } else {

            StaffUtility su = new StaffUtility();
            try {
                LinkedHashMap<String,String> subject = su.getSubject();
                req.setAttribute("subjectlist",subject);
                req.getRequestDispatcher("WEB-INF/modifyStaff.jsp").forward(req, resp);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        if (session.getAttribute("us") == null) {
            resp.sendRedirect("index.jsp");
        } else {
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
                        su.insertStaff(fname, lname, dob, gender, telno, role, email, pwd, sub);
                    } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e) {
                        throw new RuntimeException(e);
                    }

                }
                resp.sendRedirect("manageStaff");

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
                        su.updateStaff(sid, fname, lname, dob, gender, telno, role, email, pwd, sub);
                    } catch (SQLException | ClassNotFoundException e) {
                        req.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(req, resp);
                        throw new RuntimeException(e);
                    } catch (NoSuchAlgorithmException e) {
                        throw new RuntimeException(e);
                    }

                }
                resp.sendRedirect("manageStaff");

            } else if (req.getParameter("submit-btn").equals("delete")) {
                if (req.getParameter("sid") != null) {
                    String staff_id = req.getParameter("sid");
                    try {
                        su.deleteStaff(staff_id);
                    } catch (SQLException | ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                    resp.sendRedirect("manageStaff");
                }

            } else if (req.getParameter("submit-btn").equals("search")) {
                if (req.getParameter("sid") != null) {

                    String sid = req.getParameter("sid");
                    try {
                        LinkedHashMap<String,String> subject = su.getSubject();
                        req.setAttribute("subjectlist",subject);
                        Staff staff = su.searchStaff(sid);
                        if (staff != null) {
                            req.setAttribute("staff", staff);
                            req.getRequestDispatcher("WEB-INF/modifyStaff.jsp").forward(req, resp);
                        } else {
                            req.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(req, resp);
                        }
                    } catch (SQLException | ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }

                }
                resp.sendRedirect("manageStaff");
            }

        }
    }

}
