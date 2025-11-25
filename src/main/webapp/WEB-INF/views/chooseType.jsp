<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
    <title>Choisir Type d'Espace</title>
</head>
<body>
<h2>Choisissez le type d'espace</h2>
<form action="${pageContext.request.contextPath}/workspaces" method="post">
    <button name="typeEspace" value="BUREAU" style="width:220px;height:120px">
        <img src="${pageContext.request.contextPath}/images/bureau.jpg" width="90" /><br>Bureau
    </button>
    <button name="typeEspace" value="SALLE_REUNION" style="width:220px;height:120px">
        <img src="${pageContext.request.contextPath}/images/reunion.jpg" width="90" /><br>Salle de réunion
    </button>
    <button name="typeEspace" value="SALLE_FORMATION" style="width:220px;height:120px">
        <img src="${pageContext.request.contextPath}/images/formation.jpg" width="90" /><br>Salle de formation
    </button>
</form>
</body>
</html>
