package com.coworking.dao;

import com.coworking.model.EspaceTravail;
import com.coworking.model.TypeEspace;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class EspaceTravailDAO {
    public void save(EspaceTravail espace) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(espace);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public EspaceTravail findById(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(EspaceTravail.class, id);
        } finally {
            em.close();
        }
    }

    public List<EspaceTravail> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT e FROM EspaceTravail e", EspaceTravail.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<EspaceTravail> findByType(TypeEspace type) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            TypedQuery<EspaceTravail> q = em.createQuery("SELECT e FROM EspaceTravail e WHERE e.typeEspace = :type", EspaceTravail.class);
            q.setParameter("type", type);
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public void update(EspaceTravail espace) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(espace);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void delete(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            EspaceTravail e = em.find(EspaceTravail.class, id);
            if (e != null) em.remove(e);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
