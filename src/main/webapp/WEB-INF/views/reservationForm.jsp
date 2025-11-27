<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserver - CoworkSpace</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body class="page-wrapper">
    <header class="page-header">
        <nav class="navbar">
            <div class="container navbar-content">
                <div class="navbar-brand">
                    <span>CoworkSpace</span>
                </div>
                <ul class="navbar-menu">
                    <li><a href="${pageContext.request.contextPath}/mainMenu">Accueil</a></li>
                    <li><a href="${pageContext.request.contextPath}/chooseType" class="active">Reserver</a></li>
                    <li><a href="${pageContext.request.contextPath}/myReservations">Mes Reservations</a></li>
                </ul>
                <div class="navbar-user">
                    <span class="navbar-user-name">Bonjour, ${sessionScope.utilisateur.nom}</span>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-ghost btn-sm">Deconnexion</a>
                </div>
                <button class="navbar-toggle" aria-label="Menu" aria-expanded="false">Menu</button>
            </div>
        </nav>
    </header>
    
    <main class="page-content">
        <div class="container" style="max-width: 800px;">
            <div class="mb-6">
                <a href="${pageContext.request.contextPath}/workspaces" class="btn btn-ghost">
                    &larr; Retour aux espaces
                </a>
            </div>
            
            <div class="text-center mb-8">
                <h1>Finaliser votre reservation</h1>
                <p class="text-secondary">Remplissez les details de votre reservation</p>
            </div>
            
            <div class="card mb-6">
                <div class="card-header">
                    <h3 class="card-title mb-0">Informations de l espace</h3>
                </div>
                <div class="card-body">
                    <div class="form-row">
                        <div>
                            <strong>Espace:</strong> ${espace.nom}
                        </div>
                        <div>
                            <strong>Type:</strong> ${espace.typeEspace}
                        </div>
                        <div>
                            <strong>Capacite:</strong> ${espace.capacite} personnes
                        </div>
                        <div>
                            <strong>Prix:</strong> 
                            <c:choose>
                                <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                                    <span style="text-decoration: line-through; opacity: 0.6;">${prixBase} EUR</span>
                                    <strong style="color: var(--color-secondary);"> ${prixReduit} EUR/h</strong>
                                    <span class="badge badge-success">-20%</span>
                                </c:when>
                                <c:otherwise>
                                    <strong>${prixBase} EUR/h</strong>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
            
            <form action="${pageContext.request.contextPath}/reservation" method="post" data-validate="true">
                <input type="hidden" name="espaceId" value="${espace.id}" />
                
                <div class="card mb-6">
                    <div class="card-header">
                        <h3 class="card-title mb-0">Periode de reservation</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="dateDebut" class="form-label required">Date et heure de debut</label>
                                <input type="datetime-local" 
                                       id="dateDebut" 
                                       name="dateDebut" 
                                       class="form-input" 
                                       required />
                                <span class="form-help">Selectionnez la date et l heure de debut</span>
                            </div>
                            
                            <div class="form-group">
                                <label for="dateFin" class="form-label required">Date et heure de fin</label>
                                <input type="datetime-local" 
                                       id="dateFin" 
                                       name="dateFin" 
                                       class="form-input" 
                                       required />
                                <span class="form-help">Selectionnez la date et l heure de fin</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <c:if test="${not empty supplements}">
                    <div class="card mb-6">
                        <div class="card-header">
                            <h3 class="card-title mb-0">Supplements optionnels</h3>
                        </div>
                        <div class="card-body">
                            <p class="text-secondary mb-4">Ameliorez votre experience avec nos options supplementaires</p>
                            
                            <div style="display: grid; gap: 1rem;">
                                <c:forEach var="supp" items="${supplements}">
                                    <div class="form-check" style="padding: 1rem; border: 2px solid var(--color-border); border-radius: var(--radius-md); transition: all 0.2s;">
                                        <input type="checkbox" 
                                               id="supp${supp.id}" 
                                               name="supplementIds" 
                                               value="${supp.id}" 
                                               class="form-checkbox"
                                               data-price="${supp.prixUnitaire}"
                                               onchange="calculatePrice()" />
                                        <label for="supp${supp.id}" style="flex: 1; cursor: pointer;">
                                            <strong>${supp.libelle}</strong>
                                            <span style="float: right; color: var(--color-primary); font-weight: bold;">
                                                +${supp.prixUnitaire} EUR
                                            </span>
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:if>
                
                <div class="card mb-6" style="background: var(--color-primary-lighter); border: 2px solid var(--color-primary);">
                    <div class="card-body">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <div>
                                <div style="font-size: var(--text-sm); color: var(--color-text-secondary); margin-bottom: 0.25rem;">
                                    Prix total (hors duree)
                                </div>
                                <div style="font-size: var(--text-3xl); font-weight: var(--font-bold); color: var(--color-primary);">
                                    <span id="total-price" 
                                          data-base-price="${prixBase}"
                                          data-student="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                                        ${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT' ? prixReduit : prixBase}
                                    </span> EUR
                                </div>
                            </div>
                            <div style="text-align: right;">
                                <div style="font-size: var(--text-xs); color: var(--color-text-secondary);">
                                    Le prix final sera calcule
                                </div>
                                <div style="font-size: var(--text-xs); color: var(--color-text-secondary);">
                                    en fonction de la duree
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary btn-lg" style="flex: 1;">
                        Confirmer la reservation
                    </button>
                    <a href="${pageContext.request.contextPath}/workspaces" class="btn btn-outline btn-lg">
                        Annuler
                    </a>
                </div>
            </form>
        </div>
    </main>
    
    <footer class="page-footer">
        <div class="container text-center">
            <p>&copy; 2025 CoworkSpace. Tous droits reserves.</p>
        </div>
    </footer>
</body>
</html>
