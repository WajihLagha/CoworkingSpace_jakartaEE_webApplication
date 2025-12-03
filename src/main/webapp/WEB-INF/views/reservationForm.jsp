<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Reserver - CoworkSpace</title>

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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        </head>

        <body class="d-flex flex-column min-vh-100">
            <header class="border-bottom bg-white sticky-top shadow-sm">
                <nav class="navbar navbar-expand-md navbar-light">
                    <div class="container">
                        <a class="navbar-brand fw-bold text-primary fs-4"
                            href="${pageContext.request.contextPath}/">CoworkSpace</a>

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarMain">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarMain">
                            <ul class="navbar-nav ms-auto mb-2 mb-md-0">
                                <li class="nav-item"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/mainMenu">Accueil</a></li>
                                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/chooseType">Reserver</a></li>
                                <li class="nav-item"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/myReservations">Mes Reservations</a>
                                </li>
                            </ul>
                            <div class="d-flex align-items-center ms-md-3 gap-2">
                                <span class="text-muted d-none d-md-inline">Bonjour,
                                    ${sessionScope.utilisateur.nom}</span>
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="btn btn-outline-secondary btn-sm">Deconnexion</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </header>

            <main class="flex-grow-1 py-5">
                <div class="container" style="max-width: 800px;">
                    <div class="mb-4">
                        <a href="${pageContext.request.contextPath}/workspaces" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left me-2"></i>Retour aux espaces
                        </a>
                    </div>

                    <div class="text-center mb-5">
                        <h1 class="display-5 fw-bold">Finaliser votre reservation</h1>
                        <p class="text-muted fs-5">Remplissez les details de votre reservation</p>
                    </div>

                    <div class="card border-0 shadow-sm mb-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 fw-bold"><i class="bi bi-info-circle me-2"></i>Informations de l'espace</h5>
                        </div>
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <p class="mb-1 text-muted">Espace</p>
                                    <p class="fw-bold fs-5">${espace.nom}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1 text-muted">Type</p>
                                    <p class="fw-bold">
                                        <c:choose>
                                            <c:when test="${espace.typeEspace == 'BUREAU'}">Bureau Individuel</c:when>
                                            <c:when test="${espace.typeEspace == 'SALLE_REUNION'}">Salle de Reunion
                                            </c:when>
                                            <c:otherwise>Salle de Formation</c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1 text-muted">Capacite</p>
                                    <p class="fw-bold"><i class="bi bi-people me-2"></i>${espace.capacite} personnes</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1 text-muted">Prix</p>
                                    <div class="fw-bold text-primary fs-5">
                                        <c:choose>
                                            <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                                                <span
                                                    class="text-decoration-line-through text-muted fs-6 me-2">${prixBase}
                                                    DT</span>
                                                <fmt:formatNumber value="${prixReduit}" type="number"
                                                    minFractionDigits="2" maxFractionDigits="2" /> DT/h
                                                <span class="badge bg-success ms-2">-20%</span>
                                            </c:when>
                                            <c:otherwise>
                                                ${prixBase} DT/h
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/reservation" method="post" class="needs-validation"
                        novalidate>
                        <input type="hidden" name="espaceId" value="${espace.id}" />

                        <div class="card border-0 shadow-sm mb-4">
                            <div class="card-header bg-white py-3">
                                <h5 class="mb-0 fw-bold"><i class="bi bi-calendar-event me-2"></i>Periode de reservation
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="dateDebut" class="form-label">Date et heure de debut <span
                                                class="text-danger">*</span></label>
                                        <input type="datetime-local" id="dateDebut" name="dateDebut"
                                            class="form-control" required />
                                        <div class="form-text">Selectionnez la date et l'heure de debut</div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="dateFin" class="form-label">Date et heure de fin <span
                                                class="text-danger">*</span></label>
                                        <input type="datetime-local" id="dateFin" name="dateFin" class="form-control"
                                            required />
                                        <div class="form-text">Selectionnez la date et l'heure de fin</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <c:if test="${not empty supplements}">
                            <div class="card border-0 shadow-sm mb-4">
                                <div class="card-header bg-white py-3">
                                    <h5 class="mb-0 fw-bold"><i class="bi bi-plus-circle me-2"></i>Supplements
                                        optionnels
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="row g-3">
                                        <c:forEach var="supplement" items="${supplements}">
                                            <div class="col-md-6">
                                                <div class="form-check p-3 border rounded bg-light h-100">
                                                    <input class="form-check-input" type="checkbox" name="supplements"
                                                        value="${supplement.id}" id="supp_${supplement.id}">
                                                    <label class="form-check-label w-100" for="supp_${supplement.id}">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <span class="fw-bold">${supplement.nom}</span>
                                                            <span
                                                                class="badge bg-primary rounded-pill">+${supplement.prix}
                                                                DT</span>
                                                        </div>
                                                    </label>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="${pageContext.request.contextPath}/workspaces"
                                class="btn btn-outline-secondary me-md-2">Annuler</a>
                            <button type="submit" class="btn btn-primary px-5 py-2 fw-bold">
                                <i class="bi bi-check-circle me-2"></i>Confirmer la reservation
                            </button>
                        </div>
                    </form>
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