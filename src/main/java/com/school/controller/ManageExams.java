package com.school.controller;

import com.school.classes.Exam;
import com.school.classes.utility.ExamUtility;
import com.school.classes.utility.ResultUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedHashMap;

@WebServlet("/manageExams")
public class ManageExams extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("us") == null){
            resp.sendRedirect("index.jsp");
        }else{
            ExamUtility eu = new ExamUtility();
            try {
                LinkedHashMap<String, String> subjects = eu.getSubjects();
                req.setAttribute("subList", subjects);
                req.getRequestDispatcher("WEB-INF/manageExams.jsp").forward(req,resp);
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

            ExamUtility eu = new ExamUtility();

            if (req.getParameter("edit") != null) {
                LinkedHashMap<String, String> subjects = null;
                try {
                    subjects = eu.getSubjects();
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                req.setAttribute("subList", subjects);
                String id = req.getParameter("edit");
                searchAndForward(req, resp, eu, id);
            } else if (req.getParameter("submit-btn").equals("ins")) {
                if (req.getParameter("exName") != null && req.getParameter("grade") != null &&
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
                        resp.sendRedirect("manageExams");
                    } catch (SQLException | ClassNotFoundException e) {
                        req.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(req, resp);
                        throw new RuntimeException(e);
                    }
                }

            } else if (req.getParameter("submit-btn").equals("update")) {
                if (req.getParameter("exId") != null && req.getParameter("exName") != null &&
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
                        resp.sendRedirect("manageExams");
                    } catch (SQLException | ClassNotFoundException e) {
                        req.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(req, resp);
                        throw new RuntimeException(e);
                    }
                }
            } else if (req.getParameter("submit-btn").equals("del")) {
                if (req.getParameter("exId") != null) {
                    String exId = req.getParameter("exId");
                    try {
                        eu.deleteExam(exId);
                        resp.sendRedirect("manageExams");
                    } catch (SQLException | ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }

                }

            } else if (req.getParameter("submit-btn").equals("srch")) {
                if (req.getParameter("exId") != null) {
                    String id = req.getParameter("exId");
                    searchAndForward(req, resp, eu, id);
                }

            }

        }
    }

    static void searchAndForward(HttpServletRequest req, HttpServletResponse resp, ExamUtility eu, String id) throws ServletException, IOException {
        try {
            Exam exam = eu.searchExam(id);
            if(exam != null){
                try {
                    LinkedHashMap<String, String> subjects = eu.getSubjects();
                    req.setAttribute("subList", subjects);
                    req.setAttribute("exam", exam);
                    req.getRequestDispatcher("WEB-INF/manageExams.jsp").forward(req,resp);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            }else {
                req.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(req, resp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
