package com.coworking.service;

import com.coworking.dao.ReservationDAO;
import com.coworking.dao.EspaceTravailDAO;
import com.coworking.model.*;
import jakarta.persistence.EntityManager;
import java.time.LocalDateTime;
import java.util.List;

public class ReservationService {
    private ReservationDAO reservationDAO = new ReservationDAO();
    private EspaceTravailDAO espaceDAO = new EspaceTravailDAO();

    // Règle principale : Trouver les espaces disponibles pour une période donnée
    public List<EspaceTravail> getAvailableEspaces(TypeEspace type, LocalDateTime debut, LocalDateTime fin) {
        // 1. Récupérer tous les espaces de type demandé
        List<EspaceTravail> espaces = espaceDAO.findByType(type);
        // 2. Filtrer ceux qui ne sont pas occupés sur le créneau demandé
        espaces.removeIf(e -> hasConflict(e.getId(), debut, fin));
        return espaces;
    }

    // Vérifier s’il existe un conflit (espace déjà réservé à la même période)
    public boolean hasConflict(Long espaceId, LocalDateTime debut, LocalDateTime fin) {
        EntityManager em = com.coworking.dao.JPAUtil.getEntityManager();
        try {
            String jpql = "SELECT COUNT(r) FROM Reservation r WHERE r.espaceTravail.id = :eid "
                        + "AND r.statut != 'ANNULEE' "
                        + "AND (r.dateHeureDebut < :fin AND r.dateHeureFin > :debut)";
            Long count = em.createQuery(jpql, Long.class)
                .setParameter("eid", espaceId)
                .setParameter("debut", debut)
                .setParameter("fin", fin)
                .getSingleResult();
            return (count > 0);
        } finally {
            em.close();
        }
    }

    // Créer une réservation, avec validation de conflit et initialisation
    public void createReservation(Reservation resa) throws ReservationException {
        if (hasConflict(resa.getEspaceTravail().getId(), resa.getDateHeureDebut(), resa.getDateHeureFin())) {
            throw new ReservationException("Cet espace est déjà réservé sur ce créneau !");
        }
        resa.setDateCreation(LocalDateTime.now());
        resa.setStatut(StatutReservation.CONFIRMEE); // ou EN_ATTENTE selon workflow
        // Calcul du montant total (exemple : prixHoraire * nb heures + suppléments)
        long minutes = java.time.Duration.between(resa.getDateHeureDebut(), resa.getDateHeureFin()).toMinutes();
        double hours = minutes / 60.0;
        double prixBase = resa.getEspaceTravail().getPrixHoraire().doubleValue() * hours;
        double prixSupp = (resa.getSupplements() == null) ? 0 :
            resa.getSupplements().stream().mapToDouble(s -> s.getPrixUnitaire().doubleValue()).sum();
        resa.setMontantTotal(java.math.BigDecimal.valueOf(prixBase + prixSupp));

        reservationDAO.save(resa);
    }

    // Lister toutes les réservations d’un utilisateur
    public List<Reservation> findByUtilisateur(Long userId) {
        return reservationDAO.findByUtilisateur(userId);
    }

    public void annulerReservation(Long resaId) {
        Reservation resa = reservationDAO.findById(resaId);
        if (resa != null) {
            resa.setStatut(StatutReservation.ANNULEE);
            reservationDAO.update(resa);
        }
    }
    
    public List<Reservation> findAll() {
        return reservationDAO.findAll();
    }


}
