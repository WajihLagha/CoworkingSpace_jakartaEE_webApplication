package com.coworking.web;

import com.coworking.model.Reservation;
import com.coworking.service.ReservationService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.util.List;

@WebServlet("/admin/reservations")
public class ReservationCrudServlet extends HttpServlet {
    private ReservationService reservationService = new ReservationService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        List<Reservation> reservations = reservationService.findAll(); // Add your filtering
        req.setAttribute("reservations", reservations);
        req.getRequestDispatcher("/WEB-INF/views/reservationCrud.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        String action = req.getParameter("action");
        String idStr = req.getParameter("reservationId");
        if ("cancel".equals(action) && idStr != null) {
            Long resaId = Long.parseLong(idStr);
            reservationService.annulerReservation(resaId);
        }
        // Tu pourrais ajouter d'autres actions admin ici...
        resp.sendRedirect(req.getContextPath() + "/admin/reservations");
    }

}
