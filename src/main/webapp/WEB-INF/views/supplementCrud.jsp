<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion Supplements - CoworkSpace Admin</title>
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
                    <li><a href="${pageContext.request.contextPath}/admin/reservations">Reservations</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/supplements" class="active">Supplements</a></li>
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
                    <a href="${pageContext.request.contextPath}/admin/reservations">Reservations</a>
                    <a href="${pageContext.request.contextPath}/admin/supplements" class="active">Supplements</a>
                </div>
            </div>
        </nav>
    </header>
    
    <main class="page-content">
        <div class="container">
            <div class="d-flex justify-between align-center mb-6">
                <div>
                    <h1>Gestion des Supplements</h1>
                    <p class="text-secondary">Ajouter ou supprimer des options supplementaires</p>
                </div>
            </div>

            <!-- Add Supplement Form -->
            <div class="card mb-8">
                <div class="card-header">
                    <h3 class="card-title mb-0">Ajouter un nouveau supplement</h3>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/supplements" method="post" data-validate="true">
                        <input type="hidden" name="action" value="create" />
                        <div class="form-row">
                            <div class="form-group">
                                <label for="libelle" class="form-label required">Libelle</label>
                                <input type="text" id="libelle" name="libelle" class="form-input" placeholder="Ex: Projecteur, Cafe illimite..." required />
                            </div>
                            <div class="form-group">
                                <label for="prixUnitaire" class="form-label required">Prix Unitaire (EUR)</label>
                                <input type="number" id="prixUnitaire" name="prixUnitaire" class="form-input" step="0.01" min="0" placeholder="0.00" required />
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="submit" class="btn btn-primary">
                                + Ajouter le supplement
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Supplements Table -->
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title mb-0">Liste des supplements</h3>
                </div>
                <div class="card-body p-0">
                    <div class="table-container">
                        <table class="data-table" data-sortable="true">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Libelle</th>
                                    <th>Prix</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="supp" items="${supplements}">
                                    <tr>
                                        <td>#${supp.id}</td>
                                        <td><strong>${supp.libelle}</strong></td>
                                        <td><strong>${supp.prixUnitaire} EUR</strong></td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/admin/supplements" method="post" 
                                                  style="display:inline;"
                                                  data-confirm="true" 
                                                  data-confirm-message="Etes-vous sur de vouloir supprimer ce supplement ?">
                                                <input type="hidden" name="action" value="delete" />
                                                <input type="hidden" name="supplementId" value="${supp.id}" />
                                                <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                                            </form>
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
