package com.coworking.web;

import com.coworking.model.TypeEspace;
import com.coworking.model.EspaceTravail;
import com.coworking.service.ReservationService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.util.List;

@WebServlet("/workspaces")
public class WorkspaceListServlet extends HttpServlet {
    private ReservationService reservationService = new ReservationService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        try {
            String type = req.getParameter("type");
            if (type == null || type.isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/chooseType");
                return;
            }

            TypeEspace typeEnum = TypeEspace.valueOf(type);
            // Adapt this for your filtering needs
            List<EspaceTravail> espaces = reservationService.getAvailableEspaces(typeEnum, null, null);

            // Populate average ratings
            com.coworking.dao.ReviewDAO reviewDAO = new com.coworking.dao.ReviewDAO();
            for (EspaceTravail espace : espaces) {
                espace.setAverageRating(reviewDAO.getAverageRating(espace.getId()));
            }

            req.setAttribute("espaces", espaces);
            req.getRequestDispatcher("/WEB-INF/views/workspaces.jsp").forward(req, resp);
        } catch (IllegalArgumentException e) {
            resp.sendRedirect(req.getContextPath() + "/chooseType");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Une erreur est survenue lors du chargement des espaces.");
            req.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        doPost(req, resp); // fallback — adapt as needed
    }
}
