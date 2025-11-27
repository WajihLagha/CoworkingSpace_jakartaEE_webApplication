<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choisir un Type d Espace - CoworkSpace</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body class="page-wrapper">
    <header class="page-header">
        <nav class="navbar">
            <div class="container navbar-content">
                <div class="navbar-brand">
                    <span>CoworkSpace</span>
                </div>
                <div class="navbar-user">
                    <a href="${pageContext.request.contextPath}/mainMenu" class="btn btn-ghost btn-sm">Retour au menu</a>
                </div>
            </div>
        </nav>
    </header>
    
    <main class="page-content">
        <div class="container">
            <div class="text-center mb-8">
                <h1>Choisissez votre type d espace</h1>
                <p class="text-secondary">Selectionnez le type d espace qui correspond a vos besoins</p>
            </div>
            
            <form action="${pageContext.request.contextPath}/workspaces" method="post">
                <div class="menu-cards">
                    <button type="submit" name="typeEspace" value="BUREAU" class="menu-card" style="border: none; cursor: pointer; background: white;">
                        <img src="${pageContext.request.contextPath}/images/bureau.jpg" alt="Bureau individuel" />
                        <div class="title">Bureau Individuel</div>
                        <p class="description">Espace de travail prive et calme pour une personne</p>
                        <span class="btn btn-primary">Voir les bureaux</span>
                    </button>
                    
                    <button type="submit" name="typeEspace" value="SALLE_REUNION" class="menu-card" style="border: none; cursor: pointer; background: white;">
                        <img src="${pageContext.request.contextPath}/images/reunion.jpg" alt="Salle de reunion" />
                        <div class="title">Salle de Reunion</div>
                        <p class="description">Espace equipe pour vos reunions et presentations</p>
                        <span class="btn btn-primary">Voir les salles</span>
                    </button>
                    
                    <button type="submit" name="typeEspace" value="SALLE_FORMATION" class="menu-card" style="border: none; cursor: pointer; background: white;">
                        <img src="${pageContext.request.contextPath}/images/formation.jpg" alt="Salle de formation" />
                        <div class="title">Salle de Formation</div>
                        <p class="description">Grand espace pour formations et ateliers</p>
                        <span class="btn btn-primary">Voir les salles</span>
                    </button>
                </div>
            </form>
        </div>
    </main>
    
    <footer class="page-footer">
        <div class="container text-center">
            <p>&copy; 2025 CoworkSpace. Tous droits reserves.</p>
        </div>
    </footer>
</body>
</html>
