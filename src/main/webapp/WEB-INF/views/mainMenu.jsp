<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
    <title>Menu principal</title>
</head>
<body>
<h2>Bienvenue ${sessionScope.utilisateur.nom}</h2>
<c:choose>
    <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ADMIN'}">
        <a href="${pageContext.request.contextPath}/admin/users">Gestion Utilisateurs</a> |
        <a href="${pageContext.request.contextPath}/admin/workspaces">Gestion Espaces</a> |
        <a href="${pageContext.request.contextPath}/admin/reservations">Gestion Réservations</a> |
        <a href="${pageContext.request.contextPath}/admin/supplements">Suppléments</a>
    </c:when>
    <c:otherwise>
        <a href="${pageContext.request.contextPath}/chooseType">Réserver un espace</a> |
        <a href="${pageContext.request.contextPath}/myReservations">Mes réservations</a>
    </c:otherwise>
</c:choose>
<a href="${pageContext.request.contextPath}/logout" style="float:right;">Déconnexion</a>
</body>
</html>
