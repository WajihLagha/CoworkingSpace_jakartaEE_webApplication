<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion Utilisateurs - CoworkSpace Admin</title>
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
                    <li><a href="${pageContext.request.contextPath}/admin/users" class="active">Utilisateurs</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/reservations">Reservations</a></li>
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
                    <a href="${pageContext.request.contextPath}/admin/users" class="active">Utilisateurs</a>
                    <a href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a>
                    <a href="${pageContext.request.contextPath}/admin/reservations">Reservations</a>
                    <a href="${pageContext.request.contextPath}/admin/supplements">Supplements</a>
                </div>
            </div>
        </nav>
    </header>
    
    <main class="page-content">
        <div class="container">
            <div class="d-flex justify-between align-center mb-6">
                <div>
                    <h1>Gestion des Utilisateurs</h1>
                    <p class="text-secondary">Ajouter, modifier ou supprimer des utilisateurs</p>
                </div>
            </div>

            <!-- Add User Form -->
            <div class="card mb-8">
                <div class="card-header">
                    <h3 class="card-title mb-0">Ajouter un nouvel utilisateur</h3>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/users" method="post" data-validate="true">
                        <input type="hidden" name="action" value="create" />
                        <div class="form-row">
                            <div class="form-group">
                                <label for="nom" class="form-label required">Nom complet</label>
                                <input type="text" id="nom" name="nom" class="form-input" placeholder="Ex: Jean Dupont" required />
                            </div>
                            <div class="form-group">
                                <label for="email" class="form-label required">Email</label>
                                <input type="email" id="email" name="email" class="form-input" placeholder="Ex: jean@example.com" required />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="motDePasse" class="form-label required">Mot de passe</label>
                                <input type="password" id="motDePasse" name="motDePasse" class="form-input" placeholder="Minimum 6 caracteres" required />
                            </div>
                            <div class="form-group">
                                <label for="typeUtilisateur" class="form-label required">Type de compte</label>
                                <select id="typeUtilisateur" name="typeUtilisateur" class="form-select" required>
                                    <option value="PARTICULIER">Particulier</option>
                                    <option value="ETUDIANT">Etudiant</option>
                                    <option value="ADMIN">Administrateur</option>
                                </select>
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="submit" class="btn btn-primary">
                                + Creer l utilisateur
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Users Table -->
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title mb-0">Liste des utilisateurs</h3>
                </div>
                <div class="card-body p-0">
                    <div class="table-container">
                        <table class="data-table" data-sortable="true">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom</th>
                                    <th>Email</th>
                                    <th>Type</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <td>#${user.id}</td>
                                        <td><strong>${user.nom}</strong></td>
                                        <td>${user.email}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${user.typeUtilisateur == 'ADMIN'}">
                                                    <span class="badge badge-danger">ADMIN</span>
                                                </c:when>
                                                <c:when test="${user.typeUtilisateur == 'ETUDIANT'}">
                                                    <span class="badge badge-success">ETUDIANT</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-gray">PARTICULIER</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/admin/users" method="post" 
                                                  style="display:inline;" 
                                                  data-confirm="true" 
                                                  data-confirm-message="Etes-vous sur de vouloir supprimer cet utilisateur ?">
                                                <input type="hidden" name="action" value="delete" />
                                                <input type="hidden" name="userId" value="${user.id}" />
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
