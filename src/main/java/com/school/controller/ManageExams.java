package com.school.controller;

import com.school.classes.ExamUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/manageExams")
public class ManageExams extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("us") == null){
            resp.sendRedirect("index.jsp");
        }else{
            req.getRequestDispatcher("WEB-INF/manageExams.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ExamUtility eu = new ExamUtility();
        if(req.getParameter("submit-btn").equals("ins")){
            if(req.getParameter("exName") != null && req.getParameter("grade") != null &&
                    req.getParameter("subject") != null && req.getParameter("date") != null &&
                    req.getParameter("time") != null && req.getParameter("duration") != null &&
                    req.getParameter("method") != null && req.getParameter("marks") != null) {

                String name = req.getParameter("exName");
                String grade = req.getParameter("grade");
                String subject = req.getParameter("subject");
                String date = req.getParameter("date");
                String time = req.getParameter("time");
                String duration = req.getParameter("duration");
                String method = req.getParameter("method");
                String marks = req.getParameter("marks");


                try {
                    eu.insertExam(name, grade, subject, date, time, duration, method, marks);
                } catch (SQLException | ClassNotFoundException e) {
                    req.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(req, resp);
                    throw new RuntimeException(e);
                }
            }

        }else if(req.getParameter("submit-btn").equals("update")){
            if(req.getParameter("exId") != null && req.getParameter("exName") != null &&
                    req.getParameter("grade") != null && req.getParameter("subject") != null &&
                    req.getParameter("date") != null && req.getParameter("time") != null &&
                    req.getParameter("duration") != null && req.getParameter("method") != null &&
                    req.getParameter("marks") != null) {

                String ex_id = req.getParameter("exId");
                String name = req.getParameter("exName");
                String grade = req.getParameter("grade");
                String subject = req.getParameter("subject");
                String date = req.getParameter("date");
                String time = req.getParameter("time");
                String duration = req.getParameter("duration");
                String method = req.getParameter("method");
                String marks = req.getParameter("marks");

                try {
                    eu.updateExam(ex_id, name, grade, subject, date, time, duration, method, marks);
                } catch (SQLException | ClassNotFoundException e) {
                    req.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(req, resp);
                    throw new RuntimeException(e);
                }
            }
        }else if(req.getParameter("submit-btn").equals("del")){

        }else if(req.getParameter("submit-btn").equals("srch")){

        }





    }
}
