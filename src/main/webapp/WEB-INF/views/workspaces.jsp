<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Espaces Disponibles - Cowork Space</title>

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
                            <li class="nav-item"><a class="nav-link active"
                                    href="${pageContext.request.contextPath}/chooseType">Reserver</a></li>
                            <li class="nav-item"><a class="nav-link"
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
                <div class="mb-4">
                    <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left me-2"></i>Retour au choix du type
                    </a>
                </div>

                <div class="text-center mb-5">
                    <h1 class="display-5 fw-bold">Espaces Disponibles</h1>
                    <p class="text-muted fs-5">Selectionnez l'espace qui correspond a vos besoins</p>
                </div>

                <c:if test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                    <div class="alert alert-success shadow-sm" role="alert">
                        <i class="bi bi-mortarboard-fill me-2"></i>
                        <strong>Reduction Etudiante Active!</strong> Profitez de 20% de reduction sur tous les espaces.
                    </div>
                </c:if>

                <c:choose>
                    <c:when test="${empty espaces}">
                        <div class="card text-center border-0 shadow p-5">
                            <div class="card-body">
                                <i class="bi bi-inbox text-muted" style="font-size: 4rem;"></i>
                                <h3 class="mt-3">Aucun espace disponible</h3>
                                <p class="text-muted">Desolee, il n'y a pas d'espaces de ce type pour le moment.</p>
                                <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-primary mt-3">
                                    Essayer un autre type
                                </a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row g-4">
                            <c:forEach var="espace" items="${espaces}">
                                <div class="col-md-6 col-lg-4">
                                    <div class="card h-100 border-0 shadow hover-lift">
                                        <img src="${pageContext.request.contextPath}/images/${espace.typeEspace == 'BUREAU' ? 'bureau' : (espace.typeEspace == 'SALLE_REUNION' ? 'reunion' : 'formation')}.jpg"
                                            alt="${espace.nom}" class="card-img-top"
                                            style="height: 200px; object-fit: cover;" />

                                        <div class="card-body d-flex flex-column">
                                            <h5 class="card-title fw-bold">${espace.nom}</h5>

                                            <div class="d-flex flex-wrap gap-2 mb-3">
                                                <span class="badge bg-light text-dark">
                                                    <i class="bi bi-people me-1"></i>Capacite: ${espace.capacite} pers.
                                                </span>
                                            </div>

                                            <c:if test="${not empty espace.description}">
                                                <div class="collapse mb-3" id="desc${espace.id}">
                                                    <p class="text-muted"><em>${espace.description}</em></p>
                                                </div>

                                                <button class="btn btn-sm btn-outline-secondary mb-3" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#desc${espace.id}">
                                                    <i class="bi bi-chevron-down"></i> Voir la description
                                                </button>
                                            </c:if>

                                            <div class="mb-3">
                                                <div class="fs-3 fw-bold text-primary">
                                                    <c:choose>
                                                        <c:when
                                                            test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                                                            <span
                                                                class="text-decoration-line-through text-muted fs-5">${espace.prixHoraire}
                                                                EUR</span>
                                                            <span class="text-success">${espace.prixHoraire * 0.8}
                                                                EUR</span>
                                                            <span class="badge bg-success ms-2">-20%</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${espace.prixHoraire} EUR
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <small class="text-muted">par heure</small>
                                            </div>

                                            <form action="${pageContext.request.contextPath}/reservation" method="get"
                                                class="mt-auto">
                                                <input type="hidden" name="espaceId" value="${espace.id}" />
                                                <button type="submit" class="btn btn-primary w-100">
                                                    <i class="bi bi-calendar-check me-2"></i>Reserver maintenant
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
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