package com.coworking.web;

import com.coworking.model.*;
import com.coworking.service.ReservationService;
import com.coworking.dao.EspaceTravailDAO;
import com.coworking.dao.SupplementDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationService service = new ReservationService();
    private EspaceTravailDAO espaceDAO = new EspaceTravailDAO();
    private SupplementDAO supplementDAO = new SupplementDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        try {
            String espaceIdStr = req.getParameter("espaceId");
            if (espaceIdStr != null && !espaceIdStr.isEmpty()) {
                Long espaceId = Long.parseLong(espaceIdStr);
                EspaceTravail espace = espaceDAO.findById(espaceId);
                req.setAttribute("espace", espace);

                // Also fetch supplements to display in the form
                List<Supplement> supplements = supplementDAO.findAll();
                req.setAttribute("supplements", supplements);

                // Set base prices for display
                if (espace != null) {
                    req.setAttribute("prixBase", espace.getPrixHoraire());
                    req.setAttribute("prixReduit", espace.getPrixHoraire().multiply(new java.math.BigDecimal("0.8")));
                }
            }
            req.getRequestDispatcher("/WEB-INF/views/reservationForm.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Erreur lors du chargement de la page : " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        try {
            // 1. Get User from session
            HttpSession session = req.getSession();
            Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
            if (utilisateur == null) {
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }

            // 2. Get Form Data
            String espaceIdStr = req.getParameter("espaceId");
            String dateDebutStr = req.getParameter("dateDebut");
            String durationStr = req.getParameter("duration");
            String[] supplementIds = req.getParameterValues("supplementIds");

            if (espaceIdStr == null || dateDebutStr == null || durationStr == null) {
                throw new IllegalArgumentException("Données manquantes");
            }

            Long espaceId = Long.parseLong(espaceIdStr);
            int duration = Integer.parseInt(durationStr);

            if (duration < 1) {
                throw new IllegalArgumentException("La durée doit être d'au moins 1 heure");
            }

            // 3. Parse Dates and Calculate End Date
            LocalDateTime dateDebut = LocalDateTime.parse(dateDebutStr);
            LocalDateTime dateFin = dateDebut.plusHours(duration);

            // 4. Fetch Entities
            EspaceTravail espace = espaceDAO.findById(espaceId);
            List<Supplement> supplements = new ArrayList<>();
            if (supplementIds != null) {
                for (String id : supplementIds) {
                    Supplement supp = supplementDAO.findById(Long.parseLong(id));
                    if (supp != null) {
                        supplements.add(supp);
                    }
                }
            }

            // 5. Create Reservation Object
            Reservation reservation = new Reservation();
            reservation.setUtilisateur(utilisateur);
            reservation.setEspaceTravail(espace);
            reservation.setDateHeureDebut(dateDebut);
            reservation.setDateHeureFin(dateFin);
            reservation.setSupplements(supplements);

            // 6. Save (Service handles price calculation and validation)
            service.createReservation(reservation);

            // 7. Forward to Confirmation
            req.setAttribute("reservation", reservation);
            req.getRequestDispatcher("/WEB-INF/views/reservationConfirm.jsp").forward(req, resp);

        } catch (java.time.format.DateTimeParseException e) {
            req.setAttribute("error", "Format de date invalide. Veuillez utiliser le sélecteur de date.");
            doGet(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Erreur lors de la réservation : " + e.getMessage());
            // Re-load data for the form
            doGet(req, resp);
        }
    }
}
