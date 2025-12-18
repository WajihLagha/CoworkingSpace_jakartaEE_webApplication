package com.coworking.web;

import com.coworking.dao.EspaceTravailDAO;
import com.coworking.dao.ReviewDAO;
import com.coworking.model.EspaceTravail;
import com.coworking.model.Review;
import com.coworking.model.Utilisateur;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/reviews")
public class ReviewServlet extends HttpServlet {
    private ReviewDAO reviewDAO = new ReviewDAO();
    private EspaceTravailDAO espaceDAO = new EspaceTravailDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Utilisateur user = (Utilisateur) req.getSession().getAttribute("utilisateur");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            Long espaceId = Long.parseLong(req.getParameter("espaceId"));
            int note = Integer.parseInt(req.getParameter("note"));
            String commentaire = req.getParameter("commentaire");

            EspaceTravail espace = espaceDAO.findById(espaceId);
            if (espace != null) {
                Review review = new Review();
                review.setEspaceTravail(espace);
                review.setUtilisateur(user);
                review.setNote(note);
                review.setCommentaire(commentaire);
                review.setDateReview(LocalDateTime.now());

                reviewDAO.save(review);
            }
            // Redirect back to myReservations with success message
            resp.sendRedirect(req.getContextPath() + "/myReservations?success="
                    + java.net.URLEncoder.encode("Votre avis a été enregistré !", "UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/myReservations?error="
                    + java.net.URLEncoder.encode("Erreur lors de l'enregistrement de l'avis.", "UTF-8"));
        }
    }
}
