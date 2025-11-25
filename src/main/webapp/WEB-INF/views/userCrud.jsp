<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<title>Gestion Utilisateurs</title></head>
<body>
<h2>Tableau Utilisateurs</h2>
<!-- Création utilisateur -->
<form method="post" action="${pageContext.request.contextPath}/admin/users">
    <input type="hidden" name="action" value="create" />
    <input type="text" name="nom" required placeholder="Nom" />
    <input type="email" name="email" required placeholder="Email" />
    <input type="password" name="motDePasse" required placeholder="Mot de passe" />
    <select name="typeUtilisateur">
        <option value="ETUDIANT">Etudiant</option>
        <option value="ENTREPRISE">Entreprise</option>
        <option value="PARTICULIER">Particulier</option>
        <option value="ADMIN">Admin</option>
    </select>
    <input type="text" name="nomEntreprise" placeholder="Nom entreprise" />
    <button type="submit">Ajouter</button>
</form>
<!-- Tableau -->
<table border="1">
    <tr><th>ID</th><th>Nom</th><th>Email</th><th>Type</th><th>Entreprise</th><th>Action</th></tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.nom}</td>
            <td>${user.email}</td>
            <td>${user.typeUtilisateur}</td>
            <td>${user.nomEntreprise}</td>
            <td>
                <form method="post" action="${pageContext.request.contextPath}/admin/users" style="display:inline;">
                    <input type="hidden" name="action" value="delete" />
                    <input type="hidden" name="userId" value="${user.id}" />
                    <button type="submit">Supprimer</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/mainMenu">Retour admin</a>
</body>
</html>
