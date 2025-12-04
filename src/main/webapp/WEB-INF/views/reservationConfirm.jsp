<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reservation Confirmee - CoworkSpace</title>

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
            <div class="container" style="max-width: 600px;">
                <div class="text-center mb-5">
                    <div class="mb-3">
                        <i class="bi bi-check-circle-fill text-success" style="font-size: 5rem;"></i>
                    </div>
                    <h1 class="display-5 fw-bold text-success">Reservation Confirmee !</h1>
                    <p class="text-muted fs-5">Votre espace a ete reserve avec succes</p>
                </div>

                <div class="alert alert-success shadow-sm mb-4" role="alert">
                    <i class="bi bi-check-circle me-2"></i>
                    <strong>Felicitations !</strong> Votre reservation a ete enregistree. Vous recevrez un email de
                    confirmation sous peu.
                </div>

                <div class="card border-0 shadow-sm mb-4">
                    <div class="card-header bg-white py-3">
                        <h5 class="mb-0 fw-bold"><i class="bi bi-receipt me-2"></i>Details de votre reservation</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between border-bottom pb-3 mb-3">
                            <span class="text-muted">Numero de reservation</span>
                            <span class="fw-bold">#${reservation.id}</span>
                        </div>
                        <div class="d-flex justify-content-between border-bottom pb-3 mb-3">
                            <span class="text-muted">Espace</span>
                            <span class="fw-bold">${reservation.espaceTravail.nom}</span>
                        </div>
                        <div class="d-flex justify-content-between border-bottom pb-3 mb-3">
                            <span class="text-muted">Date de debut</span>
                            <span class="fw-bold">${reservation.dateHeureDebut}</span>
                        </div>
                        <div class="d-flex justify-content-between border-bottom pb-3 mb-3">
                            <span class="text-muted">Date de fin</span>
                            <span class="fw-bold">${reservation.dateHeureFin}</span>
                        </div>
                        <div class="d-flex justify-content-between border-bottom pb-3 mb-3">
                            <span class="text-muted">Statut</span>
                            <span class="badge bg-success">CONFIRMEE</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center pt-2">
                            <span class="text-muted fs-5">Prix total</span>
                            <span class="fw-bold text-primary fs-3">${reservation.montantTotal} DT</span>
                        </div>
                    </div>
                </div>

                <div class="card border-0 shadow-sm bg-light mb-4">
                    <div class="card-body text-center p-4">
                        <h5 class="fw-bold mb-3">Prochaines etapes</h5>
                        <p class="text-muted mb-4">
                            Presentez-vous a l'accueil avec votre numero de reservation.
                            Un email de confirmation a ete envoye a votre adresse.
                        </p>
                        <div class="d-flex justify-content-center gap-3 flex-wrap">
                            <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-primary">
                                <i class="bi bi-arrow-left me-2"></i>Retour aux espaces
                            </a>
                            <a href="${pageContext.request.contextPath}/myReservations" class="btn btn-outline-primary">
                                <i class="bi bi-list-check me-2"></i>Voir mes reservations
                            </a>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/mainMenu" class="btn btn-outline-secondary">
                        <i class="bi bi-house me-2"></i>Retour au menu principal
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