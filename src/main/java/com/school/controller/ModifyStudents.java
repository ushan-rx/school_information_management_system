package com.school.controller;

import com.school.classes.Exam;
import com.school.classes.Student;
import com.school.classes.utility.ExamUtility;
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

@WebServlet("/modifyStudents")
public class ModifyStudents extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("us") == null){
            resp.sendRedirect("index.jsp");
        }else {
            StudentUtility su = new StudentUtility();
            try {
                LinkedHashMap<String, String> cls = su.getClasses();
                req.setAttribute("clsList", cls);
                req.getRequestDispatcher("WEB-INF/modifyStudents.jsp").forward(req, resp);
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
            StudentUtility SU = new StudentUtility();
            if (req.getParameter("submit-btn").equals("ins")) {
                if (req.getParameter("FName") != null && req.getParameter("LName") != null &&
                        req.getParameter("DOB") != null && req.getParameter("Gender") != null &&
                        req.getParameter("City") != null && req.getParameter("Grade") != null &&
                        req.getParameter("Class") != null && req.getParameter("GName") != null &&
                        req.getParameter("GPhoneNum") != null) {


                    String FirstName = req.getParameter("FName");
                    String LastName = req.getParameter("LName");
                    String DateOfBirth = req.getParameter("DOB");
                    String Gender = req.getParameter("Gender");
                    String City = req.getParameter("City");
                    int Grade = Integer.parseInt(req.getParameter("Grade"));
                    String Class = req.getParameter("Class");
                    String GurdianName = req.getParameter("GName");
                    String GurdianPhone = req.getParameter("GPhoneNum");


                    try {
                        SU.insert(FirstName, LastName, DateOfBirth, Gender, City, Class, GurdianName, GurdianPhone, Grade);
                    } catch (SQLException | ClassNotFoundException e) {
                        req.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(req, resp);
                        throw new RuntimeException(e);
                    }


                }

            } else if (req.getParameter("submit-btn").equals("update")) {
                if (req.getParameter("SID") != null && req.getParameter("FName") != null && req.getParameter("LName") != null &&
                        req.getParameter("DOB") != null && req.getParameter("Gender") != null &&
                        req.getParameter("City") != null && req.getParameter("Grade") != null &&
                        req.getParameter("Class") != null && req.getParameter("GName") != null &&
                        req.getParameter("GPhoneNum") != null) {

                    String SID = req.getParameter("SID");
                    String FirstName = req.getParameter("FName");
                    String LastName = req.getParameter("LName");
                    String DateOfBirth = req.getParameter("DOB");
                    String Gender = req.getParameter("Gender");
                    String City = req.getParameter("City");
                    int Grade = Integer.parseInt(req.getParameter("Grade"));
                    String Class = req.getParameter("Class");
                    String GurdianName = req.getParameter("GName");
                    String GurdianPhone = req.getParameter("GPhoneNum");

                    try {
                        SU.update(SID, FirstName, LastName, DateOfBirth, Gender, City, Class, GurdianName, GurdianPhone, Grade);

                    } catch (SQLException | ClassNotFoundException e) {
                        req.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(req, resp);
                        throw new RuntimeException(e);
                    }

                }
            } else if (req.getParameter("submit-btn").equals("del")) {
                if (req.getParameter("SID") != null) {
                    String id = req.getParameter("SID");
                    try {
                        SU.delete(id);
                        resp.sendRedirect("modifyStudents");
                    } catch (SQLException | ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                }
            } else if (req.getParameter("submit-btn").equals("srch")) {
                if (req.getParameter("SID") != null) {
                    String id = req.getParameter("SID");
                    try {
                        Student std = SU.search(id);
                        if (std != null) {
                            try {
                                LinkedHashMap<String, String> cls = SU.getClasses();
                                req.setAttribute("clsList", cls);
                                req.setAttribute("student", std);
                                req.getRequestDispatcher("WEB-INF/modifyStudents.jsp").forward(req, resp);
                            } catch (SQLException | ClassNotFoundException e) {
                                throw new RuntimeException(e);
                            }
                        }
                    } catch (SQLException | ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }

                }
            }

        }
    }
}

