<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script src="${pageContext.request.contextPath}/js/app.js"></script>
    <title>Espaces Disponibles</title>
</head>
<body>
<h2>Espaces disponibles</h2>
<c:if test="${empty espaces}">
    <p>Aucun espace correspondant.</p>
</c:if>
<c:forEach var="espace" items="${espaces}">
    <div style="border:1px solid #ddd;padding:10px;margin:8px 0;">
        <img src="${pageContext.request.contextPath}/images/espace${espace.id}.jpg" width="100" style="float:right;margin-left:10px;" />
        <b>${espace.nom}</b> (${espace.typeEspace})<br>
        Capacité : ${espace.capacite}<br>
        Prix : 
        <c:choose>
            <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                <span style="text-decoration:line-through;opacity:0.5;">${espace.prixHoraire} €</span>
                <b style="color:green;">${espace.prixHoraire * 0.8} € (-20%)</b>
            </c:when>
            <c:otherwise>
                ${espace.prixHoraire} €
            </c:otherwise>
        </c:choose>
        <br>
        <button onclick="document.getElementById('desc${espace.id}').style.display='block';">↓ Description</button>
        <div id="desc${espace.id}" style="display:none;">
            <i>${espace.description}</i>
        </div>
        <form action="${pageContext.request.contextPath}/reservation" method="get">
            <input type="hidden" name="espaceId" value="${espace.id}" />
            <button type="submit">Réserver</button>
        </form>
        <div style="clear:both"></div>
    </div>
</c:forEach>
<a href="${pageContext.request.contextPath}/mainMenu">Retour menu</a>
</body>
</html>
