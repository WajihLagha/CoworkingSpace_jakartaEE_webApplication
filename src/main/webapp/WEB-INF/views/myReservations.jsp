<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes Reservations - CoworkSpace</title>
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
                    <li><a href="${pageContext.request.contextPath}/mainMenu">Accueil</a></li>
                    <li><a href="${pageContext.request.contextPath}/chooseType">Reserver</a></li>
                    <li><a href="${pageContext.request.contextPath}/myReservations" class="active">Mes Reservations</a></li>
                </ul>
                <div class="navbar-user">
                    <span class="navbar-user-name">Bonjour, ${sessionScope.utilisateur.nom}</span>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-ghost btn-sm">Deconnexion</a>
                </div>
                <button class="navbar-toggle" aria-label="Menu" aria-expanded="false">Menu</button>
            </div>
            <div class="container">
                <div class="navbar-mobile">
                    <a href="${pageContext.request.contextPath}/mainMenu">Accueil</a>
                    <a href="${pageContext.request.contextPath}/chooseType">Reserver</a>
                    <a href="${pageContext.request.contextPath}/myReservations" class="active">Mes Reservations</a>
                </div>
            </div>
        </nav>
    </header>
    
    <main class="page-content">
        <div class="container">
            <div class="text-center mb-8">
                <h1>Mes Reservations</h1>
                <p class="text-secondary">Consultez et gerez vos reservations</p>
            </div>
            
            <c:choose>
                <c:when test="${empty reservations}">
                    <div class="card text-center p-6">
                        <div style="font-size: 3rem; margin-bottom: 1rem;"></div>
                        <h3>Aucune reservation</h3>
                        <p class="text-secondary mb-4">Vous n avez pas encore effectue de reservation.</p>
                        <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-primary">
                            Faire une reservation
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-container">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Espace</th>
                                    <th>Date Debut</th>
                                    <th>Date Fin</th>
                                    <th>Prix Total</th>
                                    <th>Statut</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="resa" items="${reservations}">
                                    <tr>
                                        <td><strong>#${resa.id}</strong></td>
                                        <td>${resa.espaceCoworking.nom}</td>
                                        <td>${resa.dateHeureDebut}</td>
                                        <td>${resa.dateHeureFin}</td>
                                        <td><strong>${resa.prixTotal} EUR</strong></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${resa.statut == 'CONFIRMEE'}">
                                                    <span class="badge badge-success">Confirmee</span>
                                                </c:when>
                                                <c:when test="${resa.statut == 'ANNULEE'}">
                                                    <span class="badge badge-danger">Annulee</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-gray">${resa.statut}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:if test="${resa.statut != 'ANNULEE'}">
                                                <form method="post" 
                                                      action="${pageContext.request.contextPath}/myReservations" 
                                                      style="display: inline;"
                                                      data-confirm="true"
                                                      data-confirm-message="Etes-vous sur de vouloir annuler cette reservation ?">
                                                    <input type="hidden" name="action" value="cancel" />
                                                    <input type="hidden" name="reservationId" value="${resa.id}" />
                                                    <button type="submit" class="btn btn-danger btn-sm">
                                                        Annuler
                                                    </button>
                                                </form>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="text-center mt-6">
                        <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-primary">
                            Nouvelle reservation
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
            
            <div class="text-center mt-6">
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
