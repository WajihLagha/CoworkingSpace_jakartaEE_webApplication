package com.coworking.dao;

import com.coworking.model.Review;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class ReviewDAO {

    public void save(Review review) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(review);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public List<Review> findByEspace(Long espaceId) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            TypedQuery<Review> query = em.createQuery(
                    "SELECT r FROM Review r WHERE r.espaceTravail.id = :eid ORDER BY r.dateReview DESC", Review.class);
            query.setParameter("eid", espaceId);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public double getAverageRating(Long espaceId) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            Double avg = em
                    .createQuery("SELECT AVG(r.note) FROM Review r WHERE r.espaceTravail.id = :eid", Double.class)
                    .setParameter("eid", espaceId)
                    .getSingleResult();
            return (avg != null) ? avg : 0.0;
        } finally {
            em.close();
        }
    }

    public boolean hasUserReviewed(Long userId, Long espaceId) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            Long count = em
                    .createQuery(
                            "SELECT COUNT(r) FROM Review r WHERE r.utilisateur.id = :uid AND r.espaceTravail.id = :eid",
                            Long.class)
                    .setParameter("uid", userId)
                    .setParameter("eid", espaceId)
                    .getSingleResult();
            return count > 0;
        } finally {
            em.close();
        }
    }
}
