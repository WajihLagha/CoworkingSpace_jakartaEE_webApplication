package com.coworking.web;

import com.coworking.model.Utilisateur;
import com.coworking.dao.UtilisateurDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.util.List;

@WebServlet("/admin/users")
public class UserCrudServlet extends HttpServlet {
    private UtilisateurDAO userDAO = new UtilisateurDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        List<Utilisateur> users = userDAO.findAll();
        req.setAttribute("users", users);
        req.getRequestDispatcher("/WEB-INF/views/userCrud.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        String action = req.getParameter("action");

        // Création nouvel utilisateur
        if ("create".equals(action)) {
            String nom = req.getParameter("nom");
            String email = req.getParameter("email");
            String mdp = req.getParameter("motDePasse");
            String type = req.getParameter("typeUtilisateur");
            String entreprise = req.getParameter("nomEntreprise");
            Utilisateur u = new Utilisateur();
            u.setNom(nom);
            u.setEmail(email);
            u.setMotDePasse(mdp);
            u.setTypeUtilisateur(com.coworking.model.TypeUtilisateur.valueOf(type));
            u.setNomEntreprise(entreprise);
            userDAO.save(u);
        }

        // Modification
        else if ("update".equals(action)) {
            Long userId = Long.parseLong(req.getParameter("userId"));
            Utilisateur u = userDAO.findById(userId);
            if (u != null) {
                u.setNom(req.getParameter("nom"));
                u.setEmail(req.getParameter("email"));
                u.setTypeUtilisateur(com.coworking.model.TypeUtilisateur.valueOf(req.getParameter("typeUtilisateur")));
                u.setNomEntreprise(req.getParameter("nomEntreprise"));
                userDAO.update(u);
            }
        }

        // Suppression
        else if ("delete".equals(action)) {
            Long userId = Long.parseLong(req.getParameter("userId"));
            userDAO.delete(userId);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }

}
