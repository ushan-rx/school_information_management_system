package com.school.controller;

import com.school.classes.LoginValidation;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.HttpCookie;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LoginValidation login = new LoginValidation(req.getParameter("mail"), req.getParameter("pw"));
        try {
            if(login.validation() == 1){
                HttpSession ses = req.getSession();
                ses.setAttribute("us", login.getUid());
                ses.setMaxInactiveInterval(30*60);
                Cookie usrName = new Cookie("usrname", login.getUname());
                usrName.setMaxAge(30*60);
                resp.addCookie(usrName);
                resp.sendRedirect("home");
            }
            else{
                req.setAttribute("status", "fail");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
        } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

    }

}
