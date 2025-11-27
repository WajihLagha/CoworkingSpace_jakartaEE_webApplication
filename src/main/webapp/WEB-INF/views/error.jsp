<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur - CoworkSpace</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body class="page-wrapper">
    <main class="page-content">
        <div class="container" style="max-width: 600px;">
            <div class="text-center">
                <div style="font-size: 6rem; margin-bottom: 1rem;"></div>
                <h1 style="font-size: 3rem; color: var(--color-danger);">Oups !</h1>
                <h2 style="font-weight: normal; color: var(--color-text-secondary); margin-bottom: 2rem;">
                    Une erreur s est produite
                </h2>
                
                <div class="card mb-6">
                    <div class="card-body">
                        <div class="alert alert-error">
                            <strong>Message d erreur:</strong><br>
                            ${error != null ? error : "Une erreur inattendue s est produite"}
                        </div>
                    </div>
                </div>
                
                <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
                    <a href="${pageContext.request.contextPath}/mainMenu" class="btn btn-primary">
                        Retour au menu
                    </a>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-outline">
                        Page de connexion
                    </a>
                </div>
            </div>
        </div>
    </main>
    
    <footer class="page-footer">
        <div class="container text-center">
            <p>&copy; 2025 CoworkSpace. Tous droits reserves.</p>
        </div>
    </footer>
</body>
</html>
