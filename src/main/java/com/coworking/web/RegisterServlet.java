package com.coworking.web;

import com.coworking.dao.UtilisateurDAO;
import com.coworking.model.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, java.io.IOException {
        req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, java.io.IOException {
        String nom = req.getParameter("nom");
        String email = req.getParameter("email");
        String motDePasse = req.getParameter("motDePasse");
        TypeUtilisateur type = TypeUtilisateur.valueOf(req.getParameter("typeUtilisateur"));
        String nomEntreprise = req.getParameter("nomEntreprise");

        Utilisateur user = new Utilisateur();
        user.setNom(nom);
        user.setEmail(email);
        user.setMotDePasse(motDePasse);
        user.setTypeUtilisateur(type);
        user.setNomEntreprise(nomEntreprise);

        utilisateurDAO.save(user);
        req.setAttribute("message", "Inscription réussie. Connectez-vous !");
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }
}
