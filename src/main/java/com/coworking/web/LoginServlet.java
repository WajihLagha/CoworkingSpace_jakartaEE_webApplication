package com.coworking.web;

import com.coworking.dao.UtilisateurDAO;
import com.coworking.model.Utilisateur;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        String email = req.getParameter("email");
        String motDePasse = req.getParameter("motDePasse");
        Utilisateur user = utilisateurDAO.findByEmail(email);

        if (user != null && user.getMotDePasse().equals(motDePasse)) {
            req.getSession().setAttribute("utilisateur", user);
            // Redirige selon le rôle
            if(user.getTypeUtilisateur().name().equals("ADMIN")) {
                resp.sendRedirect("admin/dashboard");
            } else {
                resp.sendRedirect("mainMenu");
            }
        } else {
            req.setAttribute("error", "Email ou mot de passe incorrect");
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
        }
    }
}
