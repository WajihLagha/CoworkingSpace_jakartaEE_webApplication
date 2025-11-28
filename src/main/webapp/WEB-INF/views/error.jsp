<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur - CoworkSpace</title>

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

<body class="d-flex flex-column min-vh-100 bg-light">
    <main class="flex-grow-1 d-flex align-items-center py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="text-center mb-4">
                        <i class="bi bi-exclamation-triangle-fill text-danger" style="font-size: 5rem;"></i>
                        <h1 class="display-4 text-danger mt-3">Oups !</h1>
                        <h2 class="fs-5 text-muted">Une erreur s'est produite</h2>
                    </div>

                    <div class="card border-0 shadow mb-4">
                        <div class="card-body">
                            <div class="alert alert-danger" role="alert">
                                <strong><i class="bi bi-info-circle me-2"></i>Message d'erreur:</strong><br>
                                ${error != null ? error : "Une erreur inattendue s'est produite"}
                            </div>
                        </div>
                    </div>

                    <div class="d-flex gap-2 justify-content-center flex-wrap">
                        <a href="${pageContext.request.contextPath}/mainMenu" class="btn btn-primary">
                            <i class="bi bi-house-door me-2"></i>Retour au menu
                        </a>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-primary">
                            <i class="bi bi-box-arrow-in-right me-2"></i>Page de connexion
                        </a>
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
</body>

</html>