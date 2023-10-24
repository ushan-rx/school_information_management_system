package com.school.controller;

import com.school.classes.Result;
import com.school.classes.Student;
import com.school.classes.utility.ResultUtility;
import com.school.classes.utility.StudentUtility;
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

@WebServlet("/viewStudents")
public class ViewStudents extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("us") == null){
            resp.sendRedirect("index.jsp");
        }else {

            StudentUtility su = new StudentUtility();
            try {
                LinkedHashMap<String, String> classes = su.getClasses();
                req.setAttribute("classList", classes);

                List<Student> stdList = su.viewStudent();
                req.setAttribute("stdList", stdList);

                req.getRequestDispatcher("WEB-INF/viewStudents.jsp").forward(req, resp);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentUtility su = new StudentUtility();
        if(req.getParameter("class") != null){
            String cls = req.getParameter("class");
            try {
                LinkedHashMap<String, String> classes = su.getClasses();
                req.setAttribute("classList", classes);

                List<Student> stdList = su.viewStudent(cls);
                req.setAttribute("stdList", stdList);
                req.getRequestDispatcher("WEB-INF/viewStudents.jsp").forward(req, resp);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
}

