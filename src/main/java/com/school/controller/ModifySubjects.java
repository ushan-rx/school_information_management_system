package com.school.controller;

import com.school.classes.Exam;
import com.school.classes.Subject;
import com.school.classes.subjectDBUtil;
import com.school.classes.utility.ExamUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/manageSubjects")
public class ModifySubjects extends HttpServlet {
    subjectDBUtil su = new subjectDBUtil();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("us") == null) {
            resp.sendRedirect("index.jsp");
        } else {

            req.getRequestDispatcher("WEB-INF/manageSubjects.jsp").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("iuds").equals("insert")) {

            String sub_name = request.getParameter("sub_name");
            String sub_grade = request.getParameter("sub_grade");
            String sub_hrs = request.getParameter("sub_hrs");
            String[] sub_test = request.getParameterValues("sub_test");


            subjectDBUtil.insertSubjects(sub_name, sub_grade, sub_hrs, sub_test);
            response.sendRedirect("manageSubjects");


        } else if (request.getParameter("iuds").equals("update")) {

            String sub_id = request.getParameter("sub_id");
            String sub_name = request.getParameter("sub_name");
            String sub_grade = request.getParameter("sub_grade");
            String sub_hrs = request.getParameter("sub_hrs");
            String[] sub_test = request.getParameterValues("sub_test");


            subjectDBUtil.updateSubjects(sub_name, sub_grade, sub_hrs, sub_test, sub_id);
            response.sendRedirect("manageSubjects");

        } else if (request.getParameter("iuds").equals("delete")) {


            String sub_id = request.getParameter("sub_id");
            subjectDBUtil.deleteSubjects(sub_id);
            response.sendRedirect("manageSubjects");

        }
     else if (request.getParameter("iuds").equals("search")) {

        if (request.getParameter("sub_id") != null) {
            String sub_id = request.getParameter("sub_id");
            Subject subject = null;
            try {
                subject = su.searchSubject(sub_id);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            if(subject != null){
                request.setAttribute("subject", subject);
                request.getRequestDispatcher("WEB-INF/manageSubjects.jsp").forward(request,response);
            }else {
                request.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(request, response);
            }
        }

    }



    }



    }


