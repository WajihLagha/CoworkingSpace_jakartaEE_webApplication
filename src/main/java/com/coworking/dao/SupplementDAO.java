package com.coworking.dao;

import com.coworking.model.Supplement;
import jakarta.persistence.EntityManager;
import java.util.List;

public class SupplementDAO {
    public void save(Supplement supp) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(supp);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Supplement findById(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Supplement.class, id);
        } finally {
            em.close();
        }
    }

    public List<Supplement> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT s FROM Supplement s", Supplement.class).getResultList();
        } finally {
            em.close();
        }
    }

    public void update(Supplement supp) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(supp);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void delete(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Supplement s = em.find(Supplement.class, id);
            if (s != null)
                em.remove(s);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public long count() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT COUNT(s) FROM Supplement s", Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }
}
