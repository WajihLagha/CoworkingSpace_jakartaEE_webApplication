package com.coworking.test;

import com.coworking.dao.JPAUtil;
import jakarta.persistence.EntityManager;

/**
 * Test class to verify database connection
 * Run this to check if the database connection is working
 */
public class TestDatabaseConnection {

    public static void main(String[] args) {
        System.out.println("=== Testing Database Connection ===");
        System.out.println();

        try {
            // Test 1: Check if JPAUtil is ready
            System.out.println("Test 1: Checking if JPAUtil is initialized...");
            boolean isReady = JPAUtil.isReady();
            System.out.println("JPAUtil Ready: " + isReady);
            System.out.println();

            if (!isReady) {
                System.err.println("ERROR: JPAUtil is not ready. Check server logs for initialization errors.");
                System.exit(1);
            }

            // Test 2: Get EntityManager
            System.out.println("Test 2: Creating EntityManager...");
            EntityManager em = JPAUtil.getEntityManager();
            System.out.println("EntityManager created successfully: " + em);
            System.out.println();

            // Test 3: Execute a simple query
            System.out.println("Test 3: Testing database query...");
            em.getTransaction().begin();
            Object result = em.createNativeQuery("SELECT 1").getSingleResult();
            em.getTransaction().commit();
            System.out.println("Query result: " + result);
            System.out.println();

            // Test 4: Check utilisateur table
            System.out.println("Test 4: Counting users in database...");
            em.getTransaction().begin();
            Long count = (Long) em.createQuery("SELECT COUNT(u) FROM Utilisateur u").getSingleResult();
            em.getTransaction().commit();
            System.out.println("Total users in database: " + count);
            System.out.println();

            // Close EntityManager
            em.close();

            System.out.println("=================================");
            System.out.println("✅ ALL TESTS PASSED!");
            System.out.println("=================================");
            System.out.println("Database connection is working correctly.");
            System.out.println("You can now start your application.");

        } catch (Exception e) {
            System.err.println("=================================");
            System.err.println("❌ TEST FAILED!");
            System.err.println("=================================");
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
    }
}
