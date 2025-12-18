package com.coworking.web;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/mainMenu")
public class MainMenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {

        com.coworking.model.Utilisateur utilisateur = (com.coworking.model.Utilisateur) req.getSession()
                .getAttribute("utilisateur");

        if (utilisateur != null && !"ADMIN".equals(utilisateur.getTypeUtilisateur().name())) {
            com.coworking.dao.ReservationDAO reservationDAO = new com.coworking.dao.ReservationDAO();
            com.coworking.model.TypeEspace favoriteType = reservationDAO.findFavoriteWorkspaceType(utilisateur.getId());

            if (favoriteType != null) {
                req.setAttribute("favoriteType", favoriteType);

                com.coworking.dao.EspaceTravailDAO espaceDAO = new com.coworking.dao.EspaceTravailDAO();
                java.util.List<com.coworking.model.EspaceTravail> espaces = espaceDAO.findByType(favoriteType);

                if (!espaces.isEmpty()) {
                    // Pick a random one or the first one
                    req.setAttribute("recommendedSpace", espaces.get(0));
                }
            } else {
                req.setAttribute("isNewUser", true);
            }
        }

        req.getRequestDispatcher("/WEB-INF/views/mainMenu.jsp").forward(req, resp);
    }
}
