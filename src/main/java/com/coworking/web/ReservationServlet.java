package com.coworking.web;

import com.coworking.model.*;
import com.coworking.service.ReservationService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {
    private ReservationService service = new ReservationService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        // Forward with workspaceId, retrieve espace, show reservation form
        req.getRequestDispatcher("/WEB-INF/views/reservationForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        // Process reservation, handle supplements, price discount, call service.createReservation
        // Forward to confirmation.jsp
    }
}
