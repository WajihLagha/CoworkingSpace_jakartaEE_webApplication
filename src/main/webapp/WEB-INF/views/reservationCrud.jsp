<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<title>Gestion Réservations</title></head>
<body>
<h2>Tableau Réservations</h2>
<table border="1">
    <tr>
        <th>ID</th><th>Espace</th><th>Utilisateur</th><th>Début</th><th>Fin</th><th>Statut</th><th>Actions</th>
    </tr>
    <c:forEach var="reservation" items="${reservations}">
        <tr>
            <td>${reservation.id}</td>
            <td>${reservation.espaceTravail.nom}</td>
            <td>${reservation.utilisateur.nom}</td>
            <td>${reservation.dateHeureDebut}</td>
            <td>${reservation.dateHeureFin}</td>
            <td>
                <c:choose>
                    <c:when test="${reservation.statut == 'CONFIRMEE'}"><span style="color:green;">Confirmée</span></c:when>
                    <c:when test="${reservation.statut == 'ANNULEE'}"><span style="color:red;">Annulée</span></c:when>
                    <c:otherwise><span style="color:orange;">En attente</span></c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:if test="${reservation.statut != 'ANNULEE'}">
                    <form method="post" action="${pageContext.request.contextPath}/admin/reservations" style="display:inline;">
                        <input type="hidden" name="action" value="cancel" />
                        <input type="hidden" name="reservationId" value="${reservation.id}" />
                        <button type="submit">Annuler</button>
                    </form>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/mainMenu">Retour admin</a>
</body>
</html>
