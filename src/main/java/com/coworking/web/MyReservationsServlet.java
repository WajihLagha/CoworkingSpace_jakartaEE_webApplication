package com.coworking.web;

import com.coworking.model.Reservation;
import com.coworking.model.Utilisateur;
import com.coworking.service.ReservationService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.util.List;

@WebServlet("/myReservations")
public class MyReservationsServlet extends HttpServlet {
    private ReservationService reservationService = new ReservationService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        Utilisateur user = (Utilisateur) req.getSession().getAttribute("utilisateur");
        if (user != null) {
            List<Reservation> reservations = reservationService.findByUtilisateur(user.getId());
            req.setAttribute("reservations", reservations);
        }
        req.getRequestDispatcher("/WEB-INF/views/myReservations.jsp").forward(req, resp);
    }
    // Add doPost for user's cancel request
}
