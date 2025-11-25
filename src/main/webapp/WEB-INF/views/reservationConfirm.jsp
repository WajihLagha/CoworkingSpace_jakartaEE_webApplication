<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<title>Confirmation</title></head>
<body>
<h2>Réservation confirmée !</h2>
Espace réservé : ${reservation.espaceTravail.nom} <br>
Date début : ${reservation.dateHeureDebut} <br>
Date fin : ${reservation.dateHeureFin} <br>
Statut : ${reservation.statut} <br>
Suppléments :
<ul>
<c:forEach var="supp" items="${reservation.supplements}">
    <li>${supp.libelle} (${supp.prixUnitaire}€)</li>
</c:forEach>
</ul>
Prix total : <b>${reservation.montantTotal} €</b>
<a href="${pageContext.request.contextPath}/mainMenu">Retour menu</a>
</body>
</html>
