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

                <!-- Google Fonts -->
                <link
                    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@500;600;700&display=swap"
                    rel="stylesheet">

                <!-- Bootstrap 5.3.3 CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">

                <!-- Bootstrap Icons -->
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

                <!-- Custom CSS -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            </head>

            <body class="d-flex flex-column min-vh-100">
                <!-- Navigation -->
                <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                    <div class="container">
                        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">CoworkingSpace</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNav">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav me-auto">
                                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                                <li class="nav-item"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/admin/users">Utilisateurs</a></li>
                                <li class="nav-item"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a></li>
                                <li class="nav-item"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/admin/reservations">Réservations</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/admin/supplements">Suppléments</a></li>
                            </ul>
                            <a href="${pageContext.request.contextPath}/logout"
                                class="btn btn-outline-light btn-sm">Déconnexion</a>
                        </div>
                    </div>
                </nav>

                <!-- Main Content -->
                <main class="container flex-grow-1 py-5">
                    <div class="mb-4">
                        <h1 class="display-5 fw-bold">Tableau de Bord Administrateur</h1>
                        <p class="text-muted fs-5">Bienvenue, <%= utilisateur.getNom() %>
                        </p>
                    </div>

                    <!-- Dashboard Cards -->
                    <div class="row g-4 mb-5">
                        <!-- Users Card -->
                        <div class="col-md-6 col-lg-3">
                            <div class="card text-center border-0 shadow-sm h-100">
                                <div class="card-body p-4">
                                    <i class="bi bi-people-fill text-primary" style="font-size: 3rem;"></i>
                                    <h5 class="card-title mt-3">Gestion des Utilisateurs</h5>
                                    <p class="text-muted small">Gérer les comptes utilisateurs et leurs permissions</p>
                                    <a href="${pageContext.request.contextPath}/admin/users"
                                        class="btn btn-primary mt-2">Voir les utilisateurs</a>
                                </div>
                            </div>
                        </div>

                        <!-- Workspaces Card -->
                        <div class="col-md-6 col-lg-3">
                            <div class="card text-center border-0 shadow-sm h-100">
                                <div class="card-body p-4">
                                    <i class="bi bi-building text-primary" style="font-size: 3rem;"></i>
                                    <h5 class="card-title mt-3">Gestion des Espaces</h5>
                                    <p class="text-muted small">Créer et modifier les espaces de travail</p>
                                    <a href="${pageContext.request.contextPath}/admin/workspaces"
                                        class="btn btn-primary mt-2">Voir les espaces</a>
                                </div>
                            </div>
                        </div>

                        <!-- Reservations Card -->
                        <div class="col-md-6 col-lg-3">
                            <div class="card text-center border-0 shadow-sm h-100">
                                <div class="card-body p-4">
                                    <i class="bi bi-calendar-check text-primary" style="font-size: 3rem;"></i>
                                    <h5 class="card-title mt-3">Gestion des Réservations</h5>
                                    <p class="text-muted small">Consulter et gérer toutes les réservations</p>
                                    <a href="${pageContext.request.contextPath}/admin/reservations"
                                        class="btn btn-primary mt-2">Voir les réservations</a>
                                </div>
                            </div>
                        </div>

                        <!-- Supplements Card -->
                        <div class="col-md-6 col-lg-3">
                            <div class="card text-center border-0 shadow-sm h-100">
                                <div class="card-body p-4">
                                    <i class="bi bi-plus-circle text-primary" style="font-size: 3rem;"></i>
                                    <h5 class="card-title mt-3">Gestion des Suppléments</h5>
                                    <p class="text-muted small">Gérer les services supplémentaires</p>
                                    <a href="${pageContext.request.contextPath}/admin/supplements"
                                        class="btn btn-primary mt-2">Voir les suppléments</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Stats -->
                    <div class="card border-0 shadow-sm">
                        <div class="card-body p-4">
                            <h2 class="h4 mb-4">Statistiques Rapides</h2>
                            <div class="row g-4 text-center">
                                <div class="col-md-3">
                                    <div class="display-4 fw-bold text-primary">${totalUsers}</div>
                                    <div class="text-muted mt-2">Total Utilisateurs</div>
                                </div>
                                <div class="col-md-3">
                                    <div class="display-4 fw-bold text-primary">${totalWorkspaces}</div>
                                    <div class="text-muted mt-2">Total Espaces</div>
                                </div>
                                <div class="col-md-3">
                                    <div class="display-4 fw-bold text-primary">${activeReservations}</div>
                                    <div class="text-muted mt-2">Réservations Actives</div>
                                </div>
                                <div class="col-md-3">
                                    <div class="display-4 fw-bold text-primary">${totalSupplements}</div>
                                    <div class="text-muted mt-2">Suppléments Disponibles</div>
                                </div>
                            </div>
                            <p class="text-center text-muted small mt-4 mb-0">
                                <em>Note: Les statistiques détaillées peuvent être ajoutées ultérieurement</em>
                            </p>
                        </div>
                    </div>
                </main>

                <!-- Bootstrap Bundle JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>

                <!-- Custom JS -->
                <script src="${pageContext.request.contextPath}/js/app.js"></script>
            </body>

            </html>