package com.coworking.dao;

import com.coworking.model.Reservation;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class ReservationDAO {
    public void save(Reservation resa) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(resa);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Reservation findById(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Reservation.class, id);
        } finally {
            em.close();
        }
    }

    public List<Reservation> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT r FROM Reservation r", Reservation.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<Reservation> findByUtilisateur(Long userId) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            TypedQuery<Reservation> q = em.createQuery(
                    "SELECT r FROM Reservation r JOIN FETCH r.espaceTravail WHERE r.utilisateur.id = :uid",
                    Reservation.class);
            q.setParameter("uid", userId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public void update(Reservation resa) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(resa);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void delete(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Reservation r = em.find(Reservation.class, id);
            if (r != null)
                em.remove(r);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public long count() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT COUNT(r) FROM Reservation r", Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }

    public long countActive() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT COUNT(r) FROM Reservation r WHERE r.statut = 'CONFIRMEE'", Long.class)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }
}
