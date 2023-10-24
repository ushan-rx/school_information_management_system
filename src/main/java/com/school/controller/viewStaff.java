package com.school.controller;

import com.school.classes.Staff;
import com.school.classes.StaffUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/viewStaff")
public class viewStaff extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("us") == null) {
            resp.sendRedirect("index.jsp");
        } else {
            StaffUtility su = new StaffUtility();
            try {
                List<Staff> staffList = su.viewStaff();
                req.setAttribute("staffList", staffList);
                req.getRequestDispatcher("WEB-INF/viewStaff.jsp").forward(req, resp);
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
            if (req.getParameter("role") != null) {
                StaffUtility su = new StaffUtility();
                String role = req.getParameter("role");
                System.out.println(role);
                try {
                    List<Staff> staffList = su.viewStaff(role);
                    req.setAttribute("staffList", staffList);
                    req.getRequestDispatcher("WEB-INF/viewStaff.jsp").forward(req, resp);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);

                }
            }
        }
    }
}
