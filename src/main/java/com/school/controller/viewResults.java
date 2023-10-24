package com.school.controller;

import com.school.classes.Exam;
import com.school.classes.Result;
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
import java.util.List;

@WebServlet("/viewResults")
public class viewResults extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("us") == null){
            resp.sendRedirect("index.jsp");
        }else {

            ResultUtility ru = new ResultUtility();
            try {
                LinkedHashMap<String, String> classes = ru.getClasses();
                req.setAttribute("classList", classes);
                LinkedHashMap<String, String> exams = ru.getExams();
                req.setAttribute("examList", exams);

                List<Result> resultList = ru.viewResults();
                req.setAttribute("resultList", resultList);
                req.getRequestDispatcher("WEB-INF/viewResults.jsp").forward(req, resp);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ResultUtility ru = new ResultUtility();
        if(req.getParameter("class") != null && req.getParameter("exam") != null){

            String cls = req.getParameter("class");
            String exam = req.getParameter("exam");
            try {
                LinkedHashMap<String, String> classes = ru.getClasses();
                req.setAttribute("classList", classes);
                LinkedHashMap<String, String> exams = ru.getExams();
                req.setAttribute("examList", exams);

                List<Result> resultList = ru.viewResults(cls,exam);
                req.setAttribute("resultList", resultList);
                req.getRequestDispatcher("WEB-INF/viewResults.jsp").forward(req, resp);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
