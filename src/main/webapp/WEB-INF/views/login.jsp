<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
    <title>Connexion</title>
</head>
<body>
<h2>Connexion</h2>
<form action="${pageContext.request.contextPath}/login" method="post">
    Email : <input type="email" name="email" required><br>
    Mot de passe : <input type="password" name="motDePasse" required><br>
    <button type="submit">Se connecter</button>
</form>
<c:if test="${not empty error}">
    <span style="color:red">${error}</span>
</c:if>
<a href="${pageContext.request.contextPath}/register">Créer un compte</a>
</body>
</html>
