<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<title>Mes réservations</title></head>
<body>
<h2>Mes réservations</h2>
<table border="1">
    <tr>
        <th>Espace</th><th>Début</th><th>Fin</th><th>Statut</th><th>Action</th>
    </tr>
    <c:forEach var="resa" items="${reservations}">
        <tr>
            <td>${resa.espaceTravail.nom}</td>
            <td>${resa.dateHeureDebut}</td>
            <td>${resa.dateHeureFin}</td>
            <td>
                <c:choose>
                    <c:when test="${resa.statut == 'CONFIRMEE'}"><span style="color:green;">Confirmée</span></c:when>
                    <c:when test="${resa.statut == 'ANNULEE'}"><span style="color:red;">Annulée</span></c:when>
                    <c:otherwise><span style="color:orange;">En attente</span></c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:if test="${resa.statut != 'ANNULEE'}">
                    <form method="post" action="${pageContext.request.contextPath}/myReservations" style="display:inline;">
                        <input type="hidden" name="action" value="cancel" />
                        <input type="hidden" name="reservationId" value="${resa.id}" />
                        <button type="submit">Annuler</button>
                    </form>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/mainMenu">Menu principal</a>
</body>
</html>
