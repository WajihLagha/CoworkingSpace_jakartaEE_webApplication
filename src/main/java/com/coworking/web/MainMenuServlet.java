package com.coworking.web;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/mainMenu")
public class MainMenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, java.io.IOException {
        req.getRequestDispatcher("/WEB-INF/views/mainMenu.jsp").forward(req, resp);
    }
}
