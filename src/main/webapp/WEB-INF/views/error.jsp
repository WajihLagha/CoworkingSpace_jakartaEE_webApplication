<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<title>Erreur</title>
</head>
<body>
<h2>Une erreur s'est produite</h2>
<p style="color:red;">
    <c:out value="${error}" default="Une erreur inconnue est survenue."/>
</p>
<a href="${pageContext.request.contextPath}/mainMenu">Retour</a>
</body>
</html>
