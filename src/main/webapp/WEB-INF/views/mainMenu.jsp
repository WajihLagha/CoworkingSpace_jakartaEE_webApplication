<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Principal - CoworkSpace</title>
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
                <ul class="navbar-menu">
                    <c:choose>
                        <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ADMIN'}">
                            <li><a href="${pageContext.request.contextPath}/mainMenu" class="active">Tableau de bord</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/users">Utilisateurs</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/reservations">Reservations</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/supplements">Supplements</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${pageContext.request.contextPath}/mainMenu" class="active">Accueil</a></li>
                            <li><a href="${pageContext.request.contextPath}/chooseType">Reserver</a></li>
                            <li><a href="${pageContext.request.contextPath}/myReservations">Mes Reservations</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <div class="navbar-user">
                    <span class="navbar-user-name">Bonjour, ${sessionScope.utilisateur.nom}</span>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-ghost btn-sm">Deconnexion</a>
                </div>
                <button class="navbar-toggle" aria-label="Menu" aria-expanded="false">Menu</button>
            </div>
            <div class="container">
                <div class="navbar-mobile">
                    <c:choose>
                        <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ADMIN'}">
                            <a href="${pageContext.request.contextPath}/mainMenu" class="active">Tableau de bord</a>
                            <a href="${pageContext.request.contextPath}/admin/users">Utilisateurs</a>
                            <a href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a>
                            <a href="${pageContext.request.contextPath}/admin/reservations">Reservations</a>
                            <a href="${pageContext.request.contextPath}/admin/supplements">Supplements</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/mainMenu" class="active">Accueil</a>
                            <a href="${pageContext.request.contextPath}/chooseType">Reserver</a>
                            <a href="${pageContext.request.contextPath}/myReservations">Mes Reservations</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>
    </header>
    <main class="page-content">
        <div class="container">
            <c:choose>
                <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ADMIN'}">
                    <div class="text-center mb-8">
                        <h1>Tableau de Bord Administrateur</h1>
                        <p class="text-secondary">Gerez votre espace de coworking</p>
                    </div>
                    <div class="menu-cards">
                        <div class="menu-card">
                            <div style="font-size: 3rem; margin-bottom: 1rem;">Users</div>
                            <div class="title">Utilisateurs</div>
                            <p class="description">Gerer les comptes utilisateurs</p>
                            <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-primary">Acceder</a>
                        </div>
                        <div class="menu-card">
                            <div style="font-size: 3rem; margin-bottom: 1rem;">Spaces</div>
                            <div class="title">Espaces</div>
                            <p class="description">Gerer les espaces de travail</p>
                            <a href="${pageContext.request.contextPath}/admin/workspaces" class="btn btn-primary">Acceder</a>
                        </div>
                        <div class="menu-card">
                            <div style="font-size: 3rem; margin-bottom: 1rem;">Calendar</div>
                            <div class="title">Reservations</div>
                            <p class="description">Voir toutes les reservations</p>
                            <a href="${pageContext.request.contextPath}/admin/reservations" class="btn btn-primary">Acceder</a>
                        </div>
                        <div class="menu-card">
                            <div style="font-size: 3rem; margin-bottom: 1rem;">Plus</div>
                            <div class="title">Supplements</div>
                            <p class="description">Gerer les options supplementaires</p>
                            <a href="${pageContext.request.contextPath}/admin/supplements" class="btn btn-primary">Acceder</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="text-center mb-8">
                        <h1>Bienvenue ${sessionScope.utilisateur.nom} !</h1>
                        <p class="text-secondary">Trouvez l espace de travail parfait pour vous</p>
                    </div>
                    <div class="menu-cards">
                        <div class="menu-card">
                            <div style="font-size: 3rem; margin-bottom: 1rem;">Search</div>
                            <div class="title">Reserver un Espace</div>
                            <p class="description">Parcourez nos espaces disponibles et reservez celui qui vous convient</p>
                            <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-primary btn-lg">Commencer</a>
                        </div>
                        <div class="menu-card">
                            <div style="font-size: 3rem; margin-bottom: 1rem;">List</div>
                            <div class="title">Mes Reservations</div>
                            <p class="description">Consultez et gerez vos reservations en cours et passees</p>
                            <a href="${pageContext.request.contextPath}/myReservations" class="btn btn-outline">Voir mes reservations</a>
                        </div>
                    </div>
                    <c:if test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                        <div class="alert alert-success text-center mt-8">
                            <strong>Reduction Etudiante Active!</strong><br>
                            Profitez de 20% de reduction sur toutes vos reservations
                        </div>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
    <footer class="page-footer">
        <div class="container text-center">
            <p>&copy; 2025 CoworkSpace. Tous droits reserves.</p>
        </div>
    </footer>
</body>
</html>
