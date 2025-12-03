<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mes Reservations - CoworkSpace</title>

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
        <header class="border-bottom bg-white sticky-top shadow-sm">
            <nav class="navbar navbar-expand-md navbar-light">
                <div class="container">
                    <a class="navbar-brand fw-bold text-primary fs-4"
                        href="${pageContext.request.contextPath}/">CoworkSpace</a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarMain">
                        <ul class="navbar-nav ms-auto mb-2 mb-md-0">
                            <li class="nav-item"><a class="nav-link"
                                    href="${pageContext.request.contextPath}/mainMenu">Accueil</a></li>
                            <li class="nav-item"><a class="nav-link"
                                    href="${pageContext.request.contextPath}/chooseType">Reserver</a></li>
                            <li class="nav-item"><a class="nav-link active"
                                    href="${pageContext.request.contextPath}/myReservations">Mes Reservations</a></li>
                        </ul>
                        <div class="d-flex align-items-center ms-md-3 gap-2">
                            <span class="text-muted d-none d-md-inline">Bonjour, ${sessionScope.utilisateur.nom}</span>
                            <a href="${pageContext.request.contextPath}/logout"
                                class="btn btn-outline-secondary btn-sm">Deconnexion</a>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <main class="flex-grow-1 py-5">
            <div class="container">
                <div class="text-center mb-5">
                    <h1 class="display-5 fw-bold">Mes Reservations</h1>
                    <p class="text-muted fs-5">Consultez et gerez vos reservations</p>
                </div>

                <c:choose>
                    <c:when test="${empty reservations}">
                        <div class="card border-0 shadow text-center p-5 mx-auto" style="max-width: 500px;">
                            <div class="card-body">
                                <i class="bi bi-calendar-x text-muted" style="font-size: 4rem;"></i>
                                <h3 class="mt-3">Aucune reservation</h3>
                                <p class="text-muted mb-4">Vous n'avez pas encore effectue de reservation.</p>
                                <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-primary">
                                    <i class="bi bi-plus-circle me-2"></i>Faire une reservation
                                </a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card border-0 shadow-sm">
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover align-middle mb-0">
                                        <thead class="table-light">
                                            <tr>
                                                <th>ID</th>
                                                <th>Espace</th>
                                                <th>Date Debut</th>
                                                <th>Date Fin</th>
                                                <th>Prix Total</th>
                                                <th>Statut</th>
                                                <th class="text-end">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="resa" items="${reservations}">
                                                <tr>
                                                    <td class="text-muted"><strong>#${resa.id}</strong></td>
                                                    <td>${resa.espaceTravail.nom}</td>
                                                    <td><small>${resa.dateHeureDebut}</small></td>
                                                    <td><small>${resa.dateHeureFin}</small></td>
                                                    <td><strong class="text-primary">${resa.montantTotal} DT</strong>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${resa.statut == 'CONFIRMEE'}">
                                                                <span class="badge bg-success">Confirmee</span>
                                                            </c:when>
                                                            <c:when test="${resa.statut == 'ANNULEE'}">
                                                                <span class="badge bg-danger">Annulee</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-secondary">${resa.statut}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="text-end">
                                                        <c:if test="${resa.statut != 'ANNULEE'}">
                                                            <form method="post"
                                                                action="${pageContext.request.contextPath}/myReservations"
                                                                style="display: inline;"
                                                                onsubmit="return confirm('Etes-vous sur de vouloir annuler cette reservation ?')">
                                                                <input type="hidden" name="action" value="cancel" />
                                                                <input type="hidden" name="reservationId"
                                                                    value="${resa.id}" />
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

                        <div class="text-center mt-4">
                            <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-primary">
                                <i class="bi bi-plus-circle me-2"></i>Nouvelle reservation
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>

                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/mainMenu" class="btn btn-outline-secondary">
                        <i class="bi bi-house-door me-2"></i>Retour au menu principal
                    </a>
                </div>
            </div>
        </main>

        <footer class="bg-dark text-light py-4 mt-auto">
            <div class="container text-center">
                <p class="mb-0">&copy; 2025 CoworkSpace. Tous droits reserves.</p>
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