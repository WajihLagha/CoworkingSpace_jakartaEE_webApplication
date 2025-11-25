<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<title>Réserver cet espace</title>
</head>
<body>
<h2>Réserver</h2>
<form action="${pageContext.request.contextPath}/reservation" method="post">
    Date début : <input type="datetime-local" name="dateDebut" required><br>
    Date fin : <input type="datetime-local" name="dateFin" required><br>
    <c:if test="${not empty supplements}">
        <b>Suppléments:</b><br>
        <c:forEach var="supp" items="${supplements}">
            <input type="checkbox" name="supplements" value="${supp.id}" /> ${supp.libelle} (${supp.prixUnitaire}€)<br>
        </c:forEach>
    </c:if>
    <p>
    Prix (hors suppléments) :
    <c:choose>
        <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
            <span style="text-decoration:line-through;opacity:0.5">${prixBase} €</span>
            <b style="color:green">${prixReduit} € (-20%)</b>
        </c:when>
        <c:otherwise>
            <b>${prixBase} €</b>
        </c:otherwise>
    </c:choose></p>
    <button type="submit">Réserver</button>
</form>
<a href="${pageContext.request.contextPath}/workspaces">Retour à la liste</a>
</body>
</html>
