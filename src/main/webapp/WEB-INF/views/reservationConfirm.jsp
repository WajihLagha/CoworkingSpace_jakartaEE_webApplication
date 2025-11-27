<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Confirmee - CoworkSpace</title>
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
                    <a href="${pageContext.request.contextPath}/mainMenu" class="btn btn-ghost btn-sm">Menu principal</a>
                </div>
            </div>
        </nav>
    </header>
    
    <main class="page-content">
        <div class="container" style="max-width: 600px;">
            <div class="text-center mb-8">
                <div style="font-size: 5rem; margin-bottom: 1rem;">&#10004;</div>
                <h1 style="color: var(--color-success);">Reservation Confirmee !</h1>
                <p class="text-secondary">Votre espace a ete reserve avec succes</p>
            </div>
            
            <div class="alert alert-success mb-6">
                <strong>Felicitations !</strong> Votre reservation a ete enregistree. Vous recevrez un email de confirmation sous peu.
            </div>
            
            <div class="card mb-6">
                <div class="card-header">
                    <h3 class="card-title mb-0">Details de votre reservation</h3>
                </div>
                <div class="card-body">
                    <div style="display: grid; gap: 1rem;">
                        <div style="display: flex; justify-content: space-between; padding-bottom: 1rem; border-bottom: 1px solid var(--color-border);">
                            <span class="text-secondary">Numero de reservation</span>
                            <strong>#${reservation.id}</strong>
                        </div>
                        <div style="display: flex; justify-content: space-between; padding-bottom: 1rem; border-bottom: 1px solid var(--color-border);">
                            <span class="text-secondary">Espace</span>
                            <strong>${reservation.espaceCoworking.nom}</strong>
                        </div>
                        <div style="display: flex; justify-content: space-between; padding-bottom: 1rem; border-bottom: 1px solid var(--color-border);">
                            <span class="text-secondary">Date de debut</span>
                            <strong>${reservation.dateHeureDebut}</strong>
                        </div>
                        <div style="display: flex; justify-content: space-between; padding-bottom: 1rem; border-bottom: 1px solid var(--color-border);">
                            <span class="text-secondary">Date de fin</span>
                            <strong>${reservation.dateHeureFin}</strong>
                        </div>
                        <div style="display: flex; justify-content: space-between; padding-bottom: 1rem; border-bottom: 1px solid var(--color-border);">
                            <span class="text-secondary">Statut</span>
                            <span class="badge badge-success">CONFIRMEE</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; font-size: var(--text-xl);">
                            <span class="text-secondary">Prix total</span>
                            <strong style="color: var(--color-primary);">${reservation.prixTotal} EUR</strong>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="card mb-6" style="background: var(--color-gray-50);">
                <div class="card-body text-center">
                    <h4 style="margin-bottom: 1rem;">Prochaines etapes</h4>
                    <p class="text-secondary" style="margin-bottom: 1.5rem;">
                        Presentez-vous a l accueil avec votre numero de reservation. 
                        Un email de confirmation a ete envoye a votre adresse.
                    </p>
                    <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
                        <a href="${pageContext.request.contextPath}/myReservations" class="btn btn-primary">
                            Voir mes reservations
                        </a>
                        <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-outline">
                            Faire une nouvelle reservation
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="text-center">
                <a href="${pageContext.request.contextPath}/mainMenu" class="btn btn-ghost">
                    Retour au menu principal
                </a>
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
