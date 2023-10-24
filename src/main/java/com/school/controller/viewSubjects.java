package com.school.controller;

import com.school.classes.DB;
import com.school.classes.Subject;
import com.school.classes.subjectDBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/viewSubjects")
public class viewSubjects extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("us") == null) {
            resp.sendRedirect("index.jsp");
        } else {



            subjectDBUtil su = new subjectDBUtil();
            try {
                List<Subject> subjectList = su.ViewSubjects();
                req.setAttribute("subjectList", subjectList);
                req.getRequestDispatcher("WEB-INF/viewSubjects.jsp").forward(req, resp);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            }
        }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        subjectDBUtil su = new subjectDBUtil();
        if (req.getParameter("grade_id") != null) {
            int grade = Integer.parseInt(req.getParameter("grade_id"));
            try {
                List<Subject> subjectList = su.ViewSubjects(grade);
                req.setAttribute("subjectList", subjectList);
                req.getRequestDispatcher("WEB-INF/viewSubjects.jsp").forward(req, resp);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
