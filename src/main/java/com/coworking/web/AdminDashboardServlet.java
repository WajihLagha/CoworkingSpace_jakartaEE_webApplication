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

        // Initialize DAOs
        com.coworking.dao.UtilisateurDAO utilisateurDAO = new com.coworking.dao.UtilisateurDAO();
        com.coworking.dao.EspaceTravailDAO espaceTravailDAO = new com.coworking.dao.EspaceTravailDAO();
        com.coworking.dao.ReservationDAO reservationDAO = new com.coworking.dao.ReservationDAO();
        com.coworking.dao.SupplementDAO supplementDAO = new com.coworking.dao.SupplementDAO();

        // Fetch statistics
        long totalUsers = utilisateurDAO.count();
        long totalWorkspaces = espaceTravailDAO.count();
        long activeReservations = reservationDAO.countActive();
        long totalSupplements = supplementDAO.count();

        // Set attributes
        req.setAttribute("totalUsers", totalUsers);
        req.setAttribute("totalWorkspaces", totalWorkspaces);
        req.setAttribute("activeReservations", activeReservations);
        req.setAttribute("totalSupplements", totalSupplements);

        req.getRequestDispatcher("/WEB-INF/views/adminDashboard.jsp").forward(req, resp);
    }
}
