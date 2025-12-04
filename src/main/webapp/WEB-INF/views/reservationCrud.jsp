<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion Reservations - CoworkSpace Admin</title>

        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@500;600;700&display=swap"
            rel="stylesheet">

        <!-- Bootstrap 5.3.3 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    </head>

    <body class="d-flex flex-column min-vh-100">
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">Admin Panel</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link"
                                href="${pageContext.request.contextPath}/mainMenu">Tableau de bord</a></li>
                        <li class="nav-item"><a class="nav-link"
                                href="${pageContext.request.contextPath}/admin/users">Utilisateurs</a></li>
                        <li class="nav-item"><a class="nav-link"
                                href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a></li>
                        <li class="nav-item"><a class="nav-link active"
                                href="${pageContext.request.contextPath}/admin/reservations">Reservations</a></li>
                        <li class="nav-item"><a class="nav-link"
                                href="${pageContext.request.contextPath}/admin/supplements">Supplements</a></li>
                    </ul>
                    <div class="d-flex align-items-center gap-2">
                        <span class="text-light d-none d-md-inline">Admin: ${sessionScope.utilisateur.nom}</span>
                        <a href="${pageContext.request.contextPath}/logout"
                            class="btn btn-outline-light btn-sm">Deconnexion</a>
                    </div>
                </div>
            </div>
        </nav>

        <main class="container flex-grow-1 py-4">
            <div class="mb-4">
                <h1 class="h3 mb-1">Gestion des Reservations</h1>
                <p class="text-muted mb-0">Consulter et gerer toutes les reservations</p>
            </div>

            <!-- Reservations Table -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white">
                    <h5 class="mb-0"><i class="bi bi-calendar-check me-2"></i>Toutes les reservations</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Utilisateur</th>
                                    <th>Espace</th>
                                    <th>Date Debut</th>
                                    <th>Date Fin</th>
                                    <th>Prix</th>
                                    <th>Statut</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="resa" items="${reservations}">
                                    <tr>
                                        <td class="text-muted">#${resa.id}</td>
                                        <td>
                                            <strong>${resa.utilisateur.nom}</strong><br>
                                            <small class="text-muted">${resa.utilisateur.email}</small>
                                        </td>
                                        <td>${resa.espaceTravail.nom}</td>
                                        <td><small>${resa.dateHeureDebut}</small></td>
                                        <td><small>${resa.dateHeureFin}</small></td>
                                        <td><strong class="text-primary">${resa.montantTotal} DT</strong></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${resa.statut == 'CONFIRMEE'}">
                                                    <span class="badge bg-success">CONFIRMEE</span>
                                                </c:when>
                                                <c:when test="${resa.statut == 'ANNULEE'}">
                                                    <span class="badge bg-danger">ANNULEE</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary">${resa.statut}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-end">
                                            <c:if test="${resa.statut != 'ANNULEE'}">
                                                <form action="${pageContext.request.contextPath}/admin/reservations"
                                                    method="post" style="display:inline;"
                                                    onsubmit="return confirm('Etes-vous sur de vouloir annuler cette reservation ?')">
                                                    <input type="hidden" name="action" value="cancel" />
                                                    <input type="hidden" name="reservationId" value="${resa.id}" />
                                                    <button type="submit" class="btn btn-danger btn-sm">
                                                        <i class="bi bi-x-circle me-1"></i>Annuler
                                                    </button>
                                                </form>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>

        <footer class="bg-dark text-light py-3 mt-auto">
            <div class="container text-center">
                <p class="mb-0">&copy; 2025 CoworkSpace Admin. Tous droits reserves.</p>
            </div>
        </footer>

        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

        <!-- Custom JS -->
        <script src="${pageContext.request.contextPath}/js/app.js"></script>
    </body>

    </html>