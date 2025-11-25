<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
    <title>Inscription</title>
</head>
<body>
<h2>Inscription</h2>
<form action="${pageContext.request.contextPath}/register" method="post">
    Nom : <input type="text" name="nom" required><br>
    Email : <input type="email" name="email" required><br>
    Mot de passe : <input type="password" name="motDePasse" required><br>
    Type utilisateur :
    <select name="typeUtilisateur">
        <option value="ETUDIANT">Etudiant</option>
        <option value="ENTREPRISE">Entreprise</option>
        <option value="PARTICULIER">Particulier</option>
    </select><br>
    Nom entreprise (si entreprise) : <input type="text" name="nomEntreprise"><br>
    <button type="submit">S'inscrire</button>
</form>
<c:if test="${not empty message}">
    <span style="color:green">${message}</span>
</c:if>
<a href="${pageContext.request.contextPath}/login">Déjà inscrit ? Se connecter</a>
</body>
</html>
