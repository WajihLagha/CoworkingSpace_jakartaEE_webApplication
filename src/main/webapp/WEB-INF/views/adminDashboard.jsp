<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.coworking.model.Utilisateur" %>
        <% Utilisateur utilisateur=(Utilisateur) session.getAttribute("utilisateur"); if (utilisateur==null ||
            !"ADMIN".equals(utilisateur.getTypeUtilisateur().name())) { response.sendRedirect(request.getContextPath()
            + "/login" ); return; } %>
            <!DOCTYPE html>
            <html lang="fr">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Tableau de Bord Admin - CoworkingSpace</title>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            </head>

            <body>
                <!-- Navigation -->
                <nav class="navbar">
                    <div class="container">
                        <div class="navbar-brand">
                            <a href="${pageContext.request.contextPath}/">CoworkingSpace</a>
                        </div>
                        <div class="navbar-menu">
                            <a href="${pageContext.request.contextPath}/admin/dashboard" class="active">Dashboard</a>
                            <a href="${pageContext.request.contextPath}/admin/users">Utilisateurs</a>
                            <a href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a>
                            <a href="${pageContext.request.contextPath}/admin/reservations">Réservations</a>
                            <a href="${pageContext.request.contextPath}/admin/supplements">Suppléments</a>
                            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline">Déconnexion</a>
                        </div>
                    </div>
                </nav>

                <!-- Main Content -->
                <main class="container" style="margin-top: 2rem;">
                    <div class="page-header">
                        <h1>Tableau de Bord Administrateur</h1>
                        <p class="subtitle">Bienvenue, <%= utilisateur.getNom() %>
                        </p>
                    </div>

                    <!-- Dashboard Cards -->
                    <div class="dashboard-grid"
                        style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

                        <!-- Users Card -->
                        <div class="card" style="text-align: center; padding: 2rem;">
                            <div class="card-icon" style="font-size: 3rem; margin-bottom: 1rem;">👥</div>
                            <h3>Gestion des Utilisateurs</h3>
                            <p style="color: var(--text-secondary); margin: 1rem 0;">Gérer les comptes utilisateurs et
                                leurs permissions</p>
                            <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-primary">Voir les
                                utilisateurs</a>
                        </div>

                        <!-- Workspaces Card -->
                        <div class="card" style="text-align: center; padding: 2rem;">
                            <div class="card-icon" style="font-size: 3rem; margin-bottom: 1rem;">🏢</div>
                            <h3>Gestion des Espaces</h3>
                            <p style="color: var(--text-secondary); margin: 1rem 0;">Créer et modifier les espaces de
                                travail</p>
                            <a href="${pageContext.request.contextPath}/admin/workspaces" class="btn btn-primary">Voir
                                les espaces</a>
                        </div>

                        <!-- Reservations Card -->
                        <div class="card" style="text-align: center; padding: 2rem;">
                            <div class="card-icon" style="font-size: 3rem; margin-bottom: 1rem;">📅</div>
                            <h3>Gestion des Réservations</h3>
                            <p style="color: var(--text-secondary); margin: 1rem 0;">Consulter et gérer toutes les
                                réservations</p>
                            <a href="${pageContext.request.contextPath}/admin/reservations" class="btn btn-primary">Voir
                                les réservations</a>
                        </div>

                        <!-- Supplements Card -->
                        <div class="card" style="text-align: center; padding: 2rem;">
                            <div class="card-icon" style="font-size: 3rem; margin-bottom: 1rem;">➕</div>
                            <h3>Gestion des Suppléments</h3>
                            <p style="color: var(--text-secondary); margin: 1rem 0;">Gérer les services supplémentaires
                            </p>
                            <a href="${pageContext.request.contextPath}/admin/supplements" class="btn btn-primary">Voir
                                les suppléments</a>
                        </div>

                    </div>

                    <!-- Quick Stats -->
                    <div class="card" style="margin-top: 2rem; padding: 2rem;">
                        <h2 style="margin-bottom: 1.5rem;">Statistiques Rapides</h2>
                        <div
                            style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 2rem; text-align: center;">
                            <div>
                                <div style="font-size: 2.5rem; font-weight: bold; color: var(--primary);">-</div>
                                <div style="color: var(--text-secondary); margin-top: 0.5rem;">Total Utilisateurs</div>
                            </div>
                            <div>
                                <div style="font-size: 2.5rem; font-weight: bold; color: var(--primary);">-</div>
                                <div style="color: var(--text-secondary); margin-top: 0.5rem;">Total Espaces</div>
                            </div>
                            <div>
                                <div style="font-size: 2.5rem; font-weight: bold; color: var(--primary);">-</div>
                                <div style="color: var(--text-secondary); margin-top: 0.5rem;">Réservations Actives
                                </div>
                            </div>
                            <div>
                                <div style="font-size: 2.5rem; font-weight: bold; color: var(--primary);">-</div>
                                <div style="color: var(--text-secondary); margin-top: 0.5rem;">Suppléments Disponibles
                                </div>
                            </div>
                        </div>
                        <p
                            style="margin-top: 1.5rem; text-align: center; color: var(--text-secondary); font-size: 0.9rem;">
                            <em>Note: Les statistiques détaillées peuvent être ajoutées ultérieurement</em>
                        </p>
                    </div>

                </main>

                <script src="${pageContext.request.contextPath}/js/app.js"></script>
            </body>

            </html>