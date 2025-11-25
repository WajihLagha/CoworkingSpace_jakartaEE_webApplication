<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<title>Gestion suppléments</title></head>
<body>
<h2>Suppléments (CRUD)</h2>
<form method="post" action="${pageContext.request.contextPath}/admin/supplements">
    <input type="hidden" name="action" value="create" />
    <input type="text" name="libelle" required placeholder="Nom" />
    <input type="number" step="0.01" name="prixUnitaire" required placeholder="Prix" />
    <input type="text" name="description" placeholder="Description" />
    <button type="submit">Ajouter</button>
</form>
<table border="1">
    <tr><th>ID</th><th>Libellé</th><th>Prix</th><th>Description</th><th>Action</th></tr>
    <c:forEach var="supp" items="${supplements}">
    <tr>
        <td>${supp.id}</td>
        <td>${supp.libelle}</td>
        <td>${supp.prixUnitaire}</td>
        <td>${supp.description}</td>
        <td>
            <form method="post" action="${pageContext.request.contextPath}/admin/supplements" style="display:inline;">
                <input type="hidden" name="action" value="delete" />
                <input type="hidden" name="supplementId" value="${supp.id}" />
                <button type="submit">Supprimer</button>
            </form>
        </td>
    </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/mainMenu">Retour admin</a>
</body>
</html>
