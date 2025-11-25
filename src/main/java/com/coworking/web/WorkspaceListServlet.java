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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, java.io.IOException {
        String type = req.getParameter("typeEspace");
        TypeEspace typeEnum = TypeEspace.valueOf(type);
        // Adapt this for your filtering needs
        List<EspaceTravail> espaces = reservationService.getAvailableEspaces(typeEnum, null, null);
        req.setAttribute("espaces", espaces);
        req.getRequestDispatcher("/WEB-INF/views/workspaces.jsp").forward(req, resp);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, java.io.IOException {
        doPost(req, resp); // fallback — adapt as needed
    }
}
