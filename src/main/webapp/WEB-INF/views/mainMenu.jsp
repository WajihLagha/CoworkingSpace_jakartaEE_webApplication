<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu Principal - CoworkSpace</title>

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
                            <c:choose>
                                <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ADMIN'}">
                                    <li class="nav-item"><a class="nav-link active"
                                            href="${pageContext.request.contextPath}/mainMenu">Tableau de bord</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="${pageContext.request.contextPath}/admin/users">Utilisateurs</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="${pageContext.request.contextPath}/admin/reservations">Reservations</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="${pageContext.request.contextPath}/admin/supplements">Supplements</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item"><a class="nav-link active"
                                            href="${pageContext.request.contextPath}/mainMenu">Accueil</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="${pageContext.request.contextPath}/chooseType">Reserver</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="${pageContext.request.contextPath}/myReservations">Mes
                                            Reservations</a></li>
                                </c:otherwise>
                            </c:choose>
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
            <div class="container fade-in-up">
                <c:choose>
                    <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ADMIN'}">
                        <div class="text-center mb-5">
                            <h1 class="display-5 fw-bold">Tableau de Bord Administrateur</h1>
                            <p class="text-muted fs-5">Gerez votre espace de coworking</p>
                        </div>
                        <div class="row g-4">
                            <div class="col-md-6 col-lg-3">
                                <div class="card h-100 text-center border-0 shadow-sm hover-lift">
                                    <div class="card-body p-4">
                                        <i class="bi bi-people-fill text-primary fs-1 mb-3"></i>
                                        <h5 class="card-title">Utilisateurs</h5>
                                        <p class="card-text text-muted">Gerer les comptes utilisateurs</p>
                                        <a href="${pageContext.request.contextPath}/admin/users"
                                            class="btn btn-primary mt-2">Acceder</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="card h-100 text-center border-0 shadow-sm hover-lift">
                                    <div class="card-body p-4">
                                        <i class="bi bi-building text-primary fs-1 mb-3"></i>
                                        <h5 class="card-title">Espaces</h5>
                                        <p class="card-text text-muted">Gerer les espaces de travail</p>
                                        <a href="${pageContext.request.contextPath}/admin/workspaces"
                                            class="btn btn-primary mt-2">Acceder</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="card h-100 text-center border-0 shadow-sm hover-lift">
                                    <div class="card-body p-4">
                                        <i class="bi bi-calendar-check text-primary fs-1 mb-3"></i>
                                        <h5 class="card-title">Reservations</h5>
                                        <p class="card-text text-muted">Voir toutes les reservations</p>
                                        <a href="${pageContext.request.contextPath}/admin/reservations"
                                            class="btn btn-primary mt-2">Acceder</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="card h-100 text-center border-0 shadow-sm hover-lift">
                                    <div class="card-body p-4">
                                        <i class="bi bi-plus-circle text-primary fs-1 mb-3"></i>
                                        <h5 class="card-title">Supplements</h5>
                                        <p class="card-text text-muted">Gerer les options supplementaires</p>
                                        <a href="${pageContext.request.contextPath}/admin/supplements"
                                            class="btn btn-primary mt-2">Acceder</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center mb-5">
                            <h1 class="display-5 fw-bold">Bienvenue ${sessionScope.utilisateur.nom} !</h1>
                            <c:choose>
                                <c:when test="${not empty recommendedSpace}">
                                    <div class="row justify-content-center mt-5">
                                        <div class="col-md-8 col-lg-6">
                                            <div
                                                class="card border-0 shadow-lg hover-lift position-relative overflow-hidden">
                                                <div class="position-absolute top-0 start-0 w-100 bg-primary text-white text-center py-1 fw-bold"
                                                    style="font-size: 0.8rem; z-index: 10;">
                                                    <i class="bi bi-star-fill me-1"></i> RECOMMANDE POUR VOUS
                                                </div>
                                                <c:choose>
                                                    <c:when test="${not empty recommendedSpace.image}">
                                                        <img src="${recommendedSpace.image}" class="card-img-top mt-4"
                                                            alt="${recommendedSpace.nom}"
                                                            style="height: 250px; object-fit: cover;">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="${pageContext.request.contextPath}/images/${recommendedSpace.typeEspace == 'BUREAU' ? 'bureau.png' : (recommendedSpace.typeEspace == 'SALLE_REUNION' ? 'meeting.png' : 'formation.png')}"
                                                            class="card-img-top mt-4" alt="${recommendedSpace.nom}"
                                                            style="height: 250px; object-fit: cover;">
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="card-body text-center p-4">
                                                    <h3 class="card-title fw-bold mb-2">${recommendedSpace.nom}</h3>
                                                    <p class="text-muted mb-3">${recommendedSpace.description}</p>
                                                    <div
                                                        class="d-flex justify-content-center align-items-center gap-3 mb-4">
                                                        <span class="badge bg-light text-dark border"><i
                                                                class="bi bi-people me-1"></i>${recommendedSpace.capacite}
                                                            pers.</span>
                                                        <span
                                                            class="badge bg-primary-subtle text-primary border border-primary"><i
                                                                class="bi bi-tag me-1"></i>${recommendedSpace.prixHoraire}
                                                            DT/h</span>
                                                    </div>
                                                    <a href="${pageContext.request.contextPath}/reservation?espaceId=${recommendedSpace.id}"
                                                        class="btn btn-primary btn-lg w-100 shadow-sm">
                                                        <i class="bi bi-calendar-check me-2"></i>Reserver cet espace
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:when test="${isNewUser}">
                                    <p class="text-muted fs-5">Nouveau ici ? Lancez-vous en réservant votre premier
                                        espace !</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="text-muted fs-5">Trouvez l'espace de travail parfait pour vous</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="row g-4 justify-content-center">
                            <div class="col-md-6 col-lg-5">
                                <div class="card h-100 text-center border-0 shadow hover-lift">
                                    <div class="card-body p-5">
                                        <i class="bi bi-search text-primary fs-1 mb-3"></i>
                                        <h3 class="card-title">Reserver un Espace</h3>
                                        <p class="card-text text-muted mb-4">Parcourez nos espaces disponibles et
                                            reservez celui qui vous convient</p>
                                        <a href="${pageContext.request.contextPath}/chooseType"
                                            class="btn btn-primary btn-lg">Commencer</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-5">
                                <div class="card h-100 text-center border-0 shadow hover-lift">
                                    <div class="card-body p-5">
                                        <i class="bi bi-list-check text-primary fs-1 mb-3"></i>
                                        <h3 class="card-title">Mes Reservations</h3>
                                        <p class="card-text text-muted mb-4">Consultez et gerez vos reservations en
                                            cours et passees</p>
                                        <a href="${pageContext.request.contextPath}/myReservations"
                                            class="btn btn-outline-primary btn-lg">Voir mes reservations</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                            <div class="alert alert-success text-center mt-5 shadow-sm" role="alert">
                                <i class="bi bi-mortarboard-fill me-2"></i>
                                <strong>Reduction Etudiante Active!</strong><br>
                                Profitez de 20% de reduction sur toutes vos reservations
                            </div>
                        </c:if>
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