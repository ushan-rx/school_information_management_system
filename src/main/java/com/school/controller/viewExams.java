package com.school.controller;

import com.school.classes.DB;
import com.school.classes.Exam;
import com.school.classes.ExamUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/viewExams")
public class viewExams extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("us") == null){
            resp.sendRedirect("index.jsp");
        }else {

            ExamUtility eu = new ExamUtility();
            try {
                List<Exam> examList = eu.viewExams();
                req.setAttribute("examList", examList);
                req.getRequestDispatcher("WEB-INF/viewExams.jsp").forward(req, resp);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ExamUtility eu = new ExamUtility();
        if(req.getParameter("grade") != null){
            int grade = Integer.parseInt(req.getParameter("grade"));
            try {
                List<Exam> examList = eu.viewExams(grade);
                req.setAttribute("examList", examList);
                req.getRequestDispatcher("WEB-INF/viewExams.jsp").forward(req, resp);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
