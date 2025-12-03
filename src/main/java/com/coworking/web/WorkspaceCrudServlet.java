package com.coworking.web;

import com.coworking.model.EspaceTravail;
import com.coworking.model.TypeEspace;
import com.coworking.service.EspaceTravailService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.util.List;

@WebServlet("/admin/workspaces")
public class WorkspaceCrudServlet extends HttpServlet {
    private EspaceTravailService espaceService = new EspaceTravailService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        List<EspaceTravail> espaces = espaceService.listerEspaces();
        req.setAttribute("workspaces", espaces);
        req.getRequestDispatcher("/WEB-INF/views/workspaceCrud.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        String action = req.getParameter("action");

        // Création nouvel espace
        if ("create".equals(action)) {
            String nom = req.getParameter("nom");
            TypeEspace type = TypeEspace.valueOf(req.getParameter("typeEspace"));
            int capacite = Integer.parseInt(req.getParameter("capacite"));
            java.math.BigDecimal prixHoraire = new java.math.BigDecimal(req.getParameter("prixHoraire"));
            String description = req.getParameter("description");
            EspaceTravail espace = new EspaceTravail();
            espace.setNom(nom);
            espace.setTypeEspace(type);
            espace.setCapacite(capacite);
            espace.setPrixHoraire(prixHoraire);
            espace.setDescription(description);
            espaceService.creerEspace(espace);
        }

        // Modification d'un espace
        else if ("update".equals(action)) {
            Long id = Long.parseLong(req.getParameter("workspaceId"));
            EspaceTravail espace = espaceService.findById(id);
            if (espace != null) {
                espace.setNom(req.getParameter("nom"));
                espace.setTypeEspace(TypeEspace.valueOf(req.getParameter("typeEspace")));
                espace.setCapacite(Integer.parseInt(req.getParameter("capacite")));
                espace.setPrixHoraire(new java.math.BigDecimal(req.getParameter("prixHoraire")));
                espace.setDescription(req.getParameter("description"));
                espaceService.modifierEspace(espace);
            }
        }

        // Suppression
        else if ("delete".equals(action)) {
            Long id = Long.parseLong(req.getParameter("workspaceId"));
            try {
                espaceService.supprimerEspace(id);
            } catch (RuntimeException e) {
                // If deletion fails (e.g., due to existing reservations), store error message
                req.getSession().setAttribute("errorMsg", e.getMessage());
            }
        }

        resp.sendRedirect(req.getContextPath() + "/admin/workspaces");
    }

}
