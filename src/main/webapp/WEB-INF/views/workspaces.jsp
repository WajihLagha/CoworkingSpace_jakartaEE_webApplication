<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Espaces Disponibles - CoworkSpace</title>
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
                <div class="container">
                    <div class="navbar-mobile">
                        <a href="${pageContext.request.contextPath}/mainMenu">Accueil</a>
                        <a href="${pageContext.request.contextPath}/chooseType" class="active">Reserver</a>
                        <a href="${pageContext.request.contextPath}/myReservations">Mes Reservations</a>
                    </div>
                </div>
            </nav>
        </header>

        <main class="page-content">
            <div class="container">
                <div class="mb-6">
                    <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-ghost">
                        &larr; Retour au choix du type
                    </a>
                </div>

                <div class="text-center mb-8">
                    <h1>Espaces Disponibles</h1>
                    <p class="text-secondary">Selectionnez l espace qui correspond a vos besoins</p>
                </div>

                <c:if test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                    <div class="alert alert-success mb-6">
                        <strong>Reduction Etudiante Active!</strong> Profitez de 20% de reduction sur tous les espaces.
                    </div>
                </c:if>

                <c:choose>
                    <c:when test="${empty espaces}">
                        <div class="card text-center p-6">
                            <div style="font-size: 3rem; margin-bottom: 1rem;"></div>
                            <h3>Aucun espace disponible</h3>
                            <p class="text-secondary">Desolee, il n y a pas d espaces de ce type pour le moment.</p>
                            <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-primary mt-4">
                                Essayer un autre type
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="workspace-grid">
                            <c:forEach var="espace" items="${espaces}">
                                <div class="workspace-card">
                                    <div style="position: relative;">
                                        <img src="${pageContext.request.contextPath}/images/${espace.typeEspace == 'BUREAU' ? 'bureau' : (espace.typeEspace == 'SALLE_REUNION' ? 'reunion' : 'formation')}.jpg"
                                            alt="${espace.nom}" class="workspace-card-image" />
                                        <c:if test="${espace.disponible}">
                                            <span class="workspace-card-badge"
                                                style="background: var(--color-success);">Disponible</span>
                                        </c:if>
                                    </div>

                                    <div class="workspace-card-content">
                                        <h3 class="workspace-card-title">${espace.nom}</h3>

                                        <div class="workspace-card-features mb-4">
                                            <span class="workspace-card-feature">
                                                Capacite: ${espace.capacite} pers.
                                            </span>
                                            <c:if test="${not empty espace.equipements}">
                                                <span class="workspace-card-feature">
                                                    ${espace.equipements}
                                                </span>
                                            </c:if>
                                        </div>

                                        <div id="desc${espace.id}" style="display: none;"
                                            class="workspace-card-description mb-4">
                                            <p><em>${espace.description}</em></p>
                                        </div>

                                        <button class="btn btn-ghost btn-sm mb-4" data-toggle="description"
                                            data-target="desc${espace.id}" aria-expanded="false">
                                            &#8595; Voir la description
                                        </button>

                                        <div class="workspace-card-price">
                                            <c:choose>
                                                <c:when
                                                    test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                                                    <span class="workspace-card-price-original">${espace.prixHoraire}
                                                        EUR</span>
                                                    <span
                                                        style="color: var(--color-secondary); font-size: var(--text-2xl);">
                                                        ${espace.prixHoraire * 0.8} EUR
                                                    </span>
                                                    <span class="workspace-card-price-discount">-20%</span>
                                                </c:when>
                                                <c:otherwise>
                                                    ${espace.prixHoraire} EUR
                                                </c:otherwise>
                                            </c:choose>
                                            <div
                                                style="font-size: var(--text-sm); color: var(--color-text-secondary); font-weight: normal;">
                                                par heure
                                            </div>
                                        </div>

                                        <form action="${pageContext.request.contextPath}/reservation" method="get"
                                            class="workspace-card-cta">
                                            <input type="hidden" name="espaceId" value="${espace.id}" />
                                            <c:choose>
                                                <c:when test="${espace.disponible}">
                                                    <button type="submit" class="btn btn-primary btn-block">
                                                        Reserver maintenant
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" class="btn btn-outline btn-block" disabled>
                                                        Non disponible
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>

                <div class="text-center mt-8">
                    <a href="${pageContext.request.contextPath}/mainMenu" class="btn btn-outline">
                        Retour au menu principal
                    </a>
                </div>
            </div>
        </main>

        <footer class="page-footer">
            <div class="container text-center">
                <p>&copy; 2025 CoworkSpace. Tous droits reserves.</p>
            </div>
        </footer>
    </body>

    </html>