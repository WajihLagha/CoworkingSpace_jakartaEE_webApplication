<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choisir un Type d'Espace - CoworkSpace</title>

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
        <nav class="navbar navbar-light">
            <div class="container">
                <a class="navbar-brand fw-bold text-primary fs-4"
                    href="${pageContext.request.contextPath}/">CoworkSpace</a>
                <a href="${pageContext.request.contextPath}/mainMenu" class="btn btn-outline-secondary btn-sm">Retour au
                    menu</a>
            </div>
        </nav>
    </header>

    <main class="flex-grow-1 py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h1 class="display-5 fw-bold">Choisissez votre type d'espace</h1>
                <p class="text-muted fs-5">Selectionnez le type d'espace qui correspond a vos besoins</p>
            </div>

            <div class="row g-4 justify-content-center">
                <!-- Bureau Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 border-0 shadow hover-lift">
                        <img src="${pageContext.request.contextPath}/images/bureau.jpg" class="card-img-top"
                            alt="Bureau Individuel" style="height: 200px; object-fit: cover;">
                        <div class="card-body d-flex flex-column">
                            <h3 class="card-title fw-bold text-center mb-3">Bureau Individuel</h3>
                            <p class="card-text text-muted text-center mb-4">
                                Espace de travail personnel et calme, ideal pour se concentrer sur vos taches.
                            </p>
                            <div class="mb-4">
                                <ul class="list-unstyled">
                                    <li><i class="bi bi-check-circle-fill text-success me-2"></i>Espace personnel</li>
                                    <li><i class="bi bi-check-circle-fill text-success me-2"></i>Equipement complet</li>
                                    <li><i class="bi bi-check-circle-fill text-success me-2"></i>Wi-Fi haut debit</li>
                                </ul>
                            </div>
                            <form action="${pageContext.request.contextPath}/espaces" method="get" class="mt-auto">
                                <input type="hidden" name="type" value="BUREAU" />
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="bi bi-arrow-right-circle me-2"></i>Voir les bureaux
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Salle de Reunion Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 border-0 shadow hover-lift">
                        <img src="${pageContext.request.contextPath}/images/reunion.jpg" class="card-img-top"
                            alt="Salle de Reunion" style="height: 200px; object-fit: cover;">
                        <div class="card-body d-flex flex-column">
                            <h3 class="card-title fw-bold text-center mb-3">Salle de Reunion</h3>
                            <p class="card-text text-muted text-center mb-4">
                                Espace collaboratif equipe pour vos reunions et presentations professionnelles.
                            </p>
                            <div class="mb-4">
                                <ul class="list-unstyled">
                                    <li><i class="bi bi-check-circle-fill text-success me-2"></i>Ecran de projection
                                    </li>
                                    <li><i class="bi bi-check-circle-fill text-success me-2"></i>Tableau blanc</li>
                                    <li><i class="bi bi-check-circle-fill text-success me-2"></i>Videoconference</li>
                                </ul>
                            </div>
                            <form action="${pageContext.request.contextPath}/espaces" method="get" class="mt-auto">
                                <input type="hidden" name="type" value="SALLE_REUNION" />
                                <button type="submit" class="btn btn-success w-100">
                                    <i class="bi bi-arrow-right-circle me-2"></i>Voir les salles
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Salle de Formation Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 border-0 shadow hover-lift">
                        <img src="${pageContext.request.contextPath}/images/formation.jpg" class="card-img-top"
                            alt="Salle de Formation" style="height: 200px; object-fit: cover;">
                        <div class="card-body d-flex flex-column">
                            <h3 class="card-title fw-bold text-center mb-3">Salle de Formation</h3>
                            <p class="card-text text-muted text-center mb-4">
                                Grand espace amenage pour formations, workshops et evenements d'entreprise.
                            </p>
                            <div class="mb-4">
                                <ul class="list-unstyled">
                                    <li><i class="bi bi-check-circle-fill text-success me-2"></i>Grande capacite</li>
                                    <li><i class="bi bi-check-circle-fill text-success me-2"></i>Materiel audio</li>
                                    <li><i class="bi bi-check-circle-fill text-success me-2"></i>Configuration flexible
                                    </li>
                                </ul>
                            </div>
                            <form action="${pageContext.request.contextPath}/espaces" method="get" class="mt-auto">
                                <input type="hidden" name="type" value="SALLE_FORMATION" />
                                <button type="submit" class="btn btn-info w-100 text-white">
                                    <i class="bi bi-arrow-right-circle me-2"></i>Voir les espaces
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
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