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

            <form action="${pageContext.request.contextPath}/workspaces" method="post">
                <div class="row g-4">
                    <div class="col-md-4">
                        <button type="submit" name="typeEspace" value="BUREAU" class="menu-card w-100 border-0 p-0">
                            <div class="card h-100 border-0 shadow hover-lift">
                                <img src="${pageContext.request.contextPath}/images/bureau.jpg" alt="Bureau individuel"
                                    class="card-img-top" style="height: 300px; object-fit: cover;" />
                                <div class="card-body text-center p-4">
                                    <h5 class="card-title fw-bold">Bureau Individuel</h5>
                                    <p class="card-text text-muted">Espace de travail prive et calme pour une personne
                                    </p>
                                    <span class="btn btn-primary mt-2">Voir les bureaux</span>
                                </div>
                            </div>
                        </button>
                    </div>

                    <div class="col-md-4">
                        <button type="submit" name="typeEspace" value="SALLE_REUNION"
                            class="menu-card w-100 border-0 p-0">
                            <div class="card h-100 border-0 shadow hover-lift">
                                <img src="${pageContext.request.contextPath}/images/reunion.jpg" alt="Salle de reunion"
                                    class="card-img-top" style="height: 300px; object-fit: cover;" />
                                <div class="card-body text-center p-4">
                                    <h5 class="card-title fw-bold">Salle de Reunion</h5>
                                    <p class="card-text text-muted">Espace equipe pour vos reunions et presentations</p>
                                    <span class="btn btn-primary mt-2">Voir les salles</span>
                                </div>
                            </div>
                        </button>
                    </div>

                    <div class="col-md-4">
                        <button type="submit" name="typeEspace" value="SALLE_FORMATION"
                            class="menu-card w-100 border-0 p-0">
                            <div class="card h-100 border-0 shadow hover-lift">
                                <img src="${pageContext.request.contextPath}/images/formation.jpg"
                                    alt="Salle de formation" class="card-img-top"
                                    style="height: 300px; object-fit: cover;" />
                                <div class="card-body text-center p-4">
                                    <h5 class="card-title fw-bold">Salle de Formation</h5>
                                    <p class="card-text text-muted">Grand espace pour formations et ateliers</p>
                                    <span class="btn btn-primary mt-2">Voir les salles</span>
                                </div>
                            </div>
                        </button>
                    </div>
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