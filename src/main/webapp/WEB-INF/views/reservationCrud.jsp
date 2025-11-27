<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion Reservations - CoworkSpace Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body class="page-wrapper">
    <header class="page-header">
        <nav class="navbar">
            <div class="container navbar-content">
                <div class="navbar-brand">
                    <span> Admin Panel</span>
                </div>
                <ul class="navbar-menu">
                    <li><a href="${pageContext.request.contextPath}/mainMenu">Tableau de bord</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/users">Utilisateurs</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/reservations" class="active">Reservations</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/supplements">Supplements</a></li>
                </ul>
                <div class="navbar-user">
                    <span class="navbar-user-name">Admin: ${sessionScope.utilisateur.nom}</span>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-ghost btn-sm">Deconnexion</a>
                </div>
                <button class="navbar-toggle" aria-label="Menu" aria-expanded="false">Menu</button>
            </div>
            <div class="container">
                <div class="navbar-mobile">
                    <a href="${pageContext.request.contextPath}/mainMenu">Tableau de bord</a>
                    <a href="${pageContext.request.contextPath}/admin/users">Utilisateurs</a>
                    <a href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a>
                    <a href="${pageContext.request.contextPath}/admin/reservations" class="active">Reservations</a>
                    <a href="${pageContext.request.contextPath}/admin/supplements">Supplements</a>
                </div>
            </div>
        </nav>
    </header>
    
    <main class="page-content">
        <div class="container">
            <div class="d-flex justify-between align-center mb-6">
                <div>
                    <h1>Gestion des Reservations</h1>
                    <p class="text-secondary">Consulter et gerer toutes les reservations</p>
                </div>
            </div>

            <!-- Reservations Table -->
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title mb-0">Toutes les reservations</h3>
                </div>
                <div class="card-body p-0">
                    <div class="table-container">
                        <table class="data-table" data-sortable="true">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Utilisateur</th>
                                    <th>Espace</th>
                                    <th>Date Debut</th>
                                    <th>Date Fin</th>
                                    <th>Prix</th>
                                    <th>Statut</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="resa" items="${reservations}">
                                    <tr>
                                        <td>#${resa.id}</td>
                                        <td>
                                            <strong>${resa.utilisateur.nom}</strong><br>
                                            <small class="text-secondary">${resa.utilisateur.email}</small>
                                        </td>
                                        <td>${resa.espaceCoworking.nom}</td>
                                        <td>${resa.dateHeureDebut}</td>
                                        <td>${resa.dateHeureFin}</td>
                                        <td><strong>${resa.prixTotal} EUR</strong></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${resa.statut == 'CONFIRMEE'}">
                                                    <span class="badge badge-success">CONFIRMEE</span>
                                                </c:when>
                                                <c:when test="${resa.statut == 'ANNULEE'}">
                                                    <span class="badge badge-danger">ANNULEE</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-gray">${resa.statut}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:if test="${resa.statut != 'ANNULEE'}">
                                                <form action="${pageContext.request.contextPath}/admin/reservations" method="post" 
                                                      style="display:inline;"
                                                      data-confirm="true" 
                                                      data-confirm-message="Etes-vous sur de vouloir annuler cette reservation ?">
                                                    <input type="hidden" name="action" value="cancel" />
                                                    <input type="hidden" name="reservationId" value="${resa.id}" />
                                                    <button type="submit" class="btn btn-danger btn-sm">Annuler</button>
                                                </form>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <footer class="page-footer">
        <div class="container text-center">
            <p>&copy; 2025 CoworkSpace Admin. Tous droits reserves.</p>
        </div>
    </footer>
</body>
</html>
