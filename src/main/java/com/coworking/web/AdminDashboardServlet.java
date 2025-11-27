package com.coworking.web;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {

        // Check if user is admin
        com.coworking.model.Utilisateur utilisateur = (com.coworking.model.Utilisateur) req.getSession()
                .getAttribute("utilisateur");

        if (utilisateur == null || !"ADMIN".equals(utilisateur.getTypeUtilisateur().name())) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        req.getRequestDispatcher("/WEB-INF/views/adminDashboard.jsp").forward(req, resp);
    }
}
