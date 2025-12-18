package com.coworking.service;

import com.coworking.dao.ReservationDAO;
import com.coworking.dao.EspaceTravailDAO;
import com.coworking.model.*;
import com.coworking.dao.JPAUtil;
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
        EntityManager em = JPAUtil.getEntityManager();
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

        // Apply student discount (20%)
        if (resa.getUtilisateur().getTypeUtilisateur() == TypeUtilisateur.ETUDIANT) {
            prixBase = prixBase * 0.8;
        }

        double prixSupp = 0;
        if (resa.getSupplements() != null && !resa.getSupplements().isEmpty()) {
            double totalSupplements = resa.getSupplements().stream().mapToDouble(s -> s.getPrixUnitaire().doubleValue())
                    .sum();

            // Smart Bundle Logic: Meeting Pack (SALLE_REUNION + 3 specific items)
            // We check if the reservation is for a meeting room and contains the bundle
            // items
            if (resa.getEspaceTravail().getTypeEspace() == TypeEspace.SALLE_REUNION
                    && isMeetingBundle(resa.getSupplements())) {
                totalSupplements = totalSupplements * 0.90; // 10% discount
            } else if (resa.getEspaceTravail().getTypeEspace() == TypeEspace.SALLE_FORMATION
                    && isTrainingBundle(resa.getSupplements())) {
                totalSupplements = totalSupplements * 0.85; // 15% discount for Training Pack
            }

            prixSupp = totalSupplements;
        }
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

    // Helper to check if the list constitutes a "Meeting Pack"
    private boolean isMeetingBundle(List<Supplement> supplements) {
        // We look for keywords since we don't have hardcoded IDs
        boolean hasProjector = false;
        boolean hasCoffee = false;
        boolean hasNotepad = false;

        for (Supplement s : supplements) {
            if (s.getLibelle() != null) {
                String name = s.getLibelle().toLowerCase();
                if (name.contains("projecteur") || name.contains("vidéo") || name.contains("ecran"))
                    hasProjector = true;
                if (name.contains("café") || name.contains("coffee") || name.contains("boisson"))
                    hasCoffee = true;
                if (name.contains("bloc") || name.contains("note") || name.contains("papier"))
                    hasNotepad = true;
            }
        }

        return hasProjector && hasCoffee && hasNotepad;
    }

    private boolean isTrainingBundle(List<Supplement> supplements) {
        boolean hasProjector = false;
        boolean hasWhiteboard = false;
        boolean hasSnacks = false;

        for (Supplement s : supplements) {
            String name = s.getLibelle().toLowerCase();
            if (name.contains("projecteur") || name.contains("vidéo"))
                hasProjector = true;
            if (name.contains("tableau") || name.contains("whiteboard"))
                hasWhiteboard = true;
            if (name.contains("snack") || name.contains("collation") || name.contains("pause"))
                hasSnacks = true;
        }
        return hasProjector && hasWhiteboard && hasSnacks;
    }
}
