package com.coworking.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JPAUtil {
    private static final Logger LOGGER = Logger.getLogger(JPAUtil.class.getName());
    private static EntityManagerFactory emf;
    private static Throwable initializationError;

    // Lazy initialization to avoid class loading failures
    static {
        try {
            LOGGER.info("Initializing EntityManagerFactory for persistence unit 'coworkingPU'...");
            emf = Persistence.createEntityManagerFactory("coworkingPU");
            LOGGER.info("EntityManagerFactory initialized successfully");

            // Test the connection
            testConnection();
        } catch (Throwable ex) {
            initializationError = ex;
            LOGGER.log(Level.SEVERE, "Failed to initialize EntityManagerFactory", ex);
            LOGGER.severe("=== DATABASE CONNECTION FAILED ===");
            LOGGER.severe("Please check:");
            LOGGER.severe("1. MySQL server is running");
            LOGGER.severe("2. Database 'coworking_db' exists");
            LOGGER.severe("3. Credentials are correct (user: root, password: 1234)");
            LOGGER.severe("4. MySQL is listening on localhost:3306");
            LOGGER.severe("==================================");
        }
    }

    public static EntityManager getEntityManager() {
        if (emf == null) {
            if (initializationError != null) {
                throw new IllegalStateException(
                        "EntityManagerFactory initialization failed. Check server logs for details.",
                        initializationError);
            }
            throw new IllegalStateException("EntityManagerFactory is not initialized");
        }
        return emf.createEntityManager();
    }

    /**
     * Test database connection by creating and closing an EntityManager
     */
    private static void testConnection() {
        try {
            EntityManager em = emf.createEntityManager();
            em.close();
            LOGGER.info("Database connection test: SUCCESS");
        } catch (Exception e) {
            LOGGER.log(Level.WARNING, "Database connection test failed, but EMF was created", e);
        }
    }

    /**
     * Shutdown the EntityManagerFactory (call this on application shutdown)
     */
    public static void shutdown() {
        if (emf != null && emf.isOpen()) {
            LOGGER.info("Closing EntityManagerFactory...");
            emf.close();
            LOGGER.info("EntityManagerFactory closed");
        }
    }

    /**
     * Check if the EntityManagerFactory is initialized and ready
     */
    public static boolean isReady() {
        return emf != null && emf.isOpen();
    }
}
