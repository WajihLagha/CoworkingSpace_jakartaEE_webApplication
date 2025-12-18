<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Reserver - CoworkSpace</title>

            <!-- Google Fonts -->
            <link
                href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@500;600;700&display=swap"
                rel="stylesheet">

            <!-- Bootstrap 5.3.3 CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">

            <!-- Bootstrap Icons -->
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

            <!-- Custom CSS -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        </head>

        <body class="d-flex flex-column min-vh-100">
            <header class="border-bottom bg-white sticky-top shadow-sm">
                <nav class="navbar navbar-expand-md navbar-light">
                    <div class="container">
                        <a class="navbar-brand fw-bold text-primary fs-4"
                            href="${pageContext.request.contextPath}/">CoworkSpace</a>

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarMain">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarMain">
                            <ul class="navbar-nav ms-auto mb-2 mb-md-0">
                                <li class="nav-item"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/mainMenu">Accueil</a></li>
                                <li class="nav-item"><a class="nav-link active"
                                        href="${pageContext.request.contextPath}/chooseType">Reserver</a></li>
                                <li class="nav-item"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/myReservations">Mes Reservations</a>
                                </li>
                            </ul>
                            <div class="d-flex align-items-center ms-md-3 gap-2">
                                <span class="text-muted d-none d-md-inline">Bonjour,
                                    ${sessionScope.utilisateur.nom}</span>
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="btn btn-outline-secondary btn-sm">Deconnexion</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </header>

            <main class="flex-grow-1 py-5">
                <div class="container" style="max-width: 800px;">
                    <div class="mb-4">
                        <a href="${pageContext.request.contextPath}/workspaces" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left me-2"></i>Retour aux espaces
                        </a>
                    </div>

                    <div class="text-center mb-5">
                        <h1 class="display-5 fw-bold">Finaliser votre reservation</h1>
                        <p class="text-muted fs-5">Remplissez les details de votre reservation</p>
                    </div>

                    <div class="card border-0 shadow-sm mb-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 fw-bold"><i class="bi bi-info-circle me-2"></i>Informations de l'espace</h5>
                        </div>
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <p class="mb-1 text-muted">Espace</p>
                                    <p class="fw-bold fs-5">${espace.nom}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1 text-muted">Type</p>
                                    <p class="fw-bold">
                                        <c:choose>
                                            <c:when test="${espace.typeEspace == 'BUREAU'}">Bureau Individuel</c:when>
                                            <c:when test="${espace.typeEspace == 'SALLE_REUNION'}">Salle de Reunion
                                            </c:when>
                                            <c:otherwise>Salle de Formation</c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1 text-muted">Capacite</p>
                                    <p class="fw-bold"><i class="bi bi-people me-2"></i>${espace.capacite} personnes</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1 text-muted">Prix</p>
                                    <div class="fw-bold text-primary fs-5">
                                        <c:choose>
                                            <c:when test="${sessionScope.utilisateur.typeUtilisateur == 'ETUDIANT'}">
                                                <span
                                                    class="text-decoration-line-through text-muted fs-6 me-2">${prixBase}
                                                    DT</span>
                                                <fmt:formatNumber value="${prixReduit}" type="number"
                                                    minFractionDigits="2" maxFractionDigits="2" /> DT/h
                                                <span class="badge bg-success ms-2">-20%</span>
                                            </c:when>
                                            <c:otherwise>
                                                ${prixBase} DT/h
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/reservation" method="post" class="needs-validation"
                        novalidate>
                        <input type="hidden" name="espaceId" value="${espace.id}" />

                        <div class="card border-0 shadow-sm mb-4">
                            <div class="card-header bg-white py-3">
                                <h5 class="mb-0 fw-bold"><i class="bi bi-calendar-event me-2"></i>Periode de reservation
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="dateDebut" class="form-label">Date et heure de debut <span
                                                class="text-danger">*</span></label>
                                        <input type="datetime-local" id="dateDebut" name="dateDebut"
                                            class="form-control" required />
                                        <div class="form-text">Selectionnez la date et l'heure de debut</div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="duration" class="form-label">Duree (heures) <span
                                                class="text-danger">*</span></label>
                                        <input type="number" id="duration" name="duration" class="form-control" min="1"
                                            value="1" required />
                                        <div class="form-text">Indiquez la duree souhaitee en heures</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <c:if test="${espace.typeEspace == 'SALLE_REUNION' && not empty supplements}">
                            <!-- Smart Bundle Card -->
                            <div class="card border-0 shadow-sm mb-4 position-relative overflow-hidden"
                                style="background: linear-gradient(135deg, #fdfbf7 0%, #fff 100%); border-left: 5px solid #ffc107;">
                                <div class="position-absolute top-0 end-0 p-3 opacity-25">
                                    <i class="bi bi-stars text-warning" style="font-size: 5rem;"></i>
                                </div>
                                <div class="card-body p-4 position-relative">
                                    <div
                                        class="d-flex flex-column flex-md-row align-items-center justify-content-between gap-4">
                                        <div class="d-flex align-items-center">
                                            <div class="rounded-circle p-3 d-flex align-items-center justify-content-center shadow-sm"
                                                style="background: linear-gradient(45deg, #ffc107, #ffdb4d); width: 64px; height: 64px;">
                                                <i class="bi bi-gift-fill text-dark fs-3"></i>
                                            </div>
                                            <div class="ms-3">
                                                <div class="badge bg-warning text-dark mb-1 px-3 py-1 rounded-pill">
                                                    Offre Spéciale</div>
                                                <h4 class="fw-bold mb-1" style="color: #2c3e50;">Pack Réunion Tout-en-un
                                                </h4>
                                                <p class="text-muted mb-0">Boostez votre productivité avec nos
                                                    essentiels.</p>
                                            </div>
                                        </div>

                                        <div class="bg-white p-3 rounded-3 shadow-sm d-none d-lg-block border">
                                            <ul class="list-unstyled mb-0 small text-muted">
                                                <li class="mb-1"><i
                                                        class="bi bi-check-circle-fill text-success me-2"></i>Vidéoprojecteur
                                                    HD</li>
                                                <li class="mb-1"><i
                                                        class="bi bi-check-circle-fill text-success me-2"></i>Service
                                                    Café Illimité</li>
                                                <li><i class="bi bi-check-circle-fill text-success me-2"></i>Bloc-notes
                                                    & Stylos</li>
                                            </ul>
                                        </div>

                                        <div class="text-center text-md-end">
                                            <div class="mb-2">
                                                <span class="fs-5 fw-bold text-success">-10%</span>
                                                <span class="text-muted small">sur les suppléments</span>
                                            </div>
                                            <button type="button"
                                                class="btn btn-dark px-4 py-2 shadow-sm rounded-pill hover-scale"
                                                onclick="activateMeetingBundle()" id="btn-activate-bundle">
                                                <i class="bi bi-magic me-2"></i>Activer le Pack
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${not empty supplements}">
                            <div class="card border-0 shadow-sm mb-4">
                                <div class="card-header bg-white py-3">
                                    <h5 class="mb-0 fw-bold"><i class="bi bi-plus-circle me-2"></i>Supplements
                                        optionnels
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="row g-3">
                                        <c:forEach var="supplement" items="${supplements}">
                                            <div class="col-md-6">
                                                <div class="form-check p-3 border rounded bg-light h-100">
                                                    <input class="form-check-input" type="checkbox" name="supplements"
                                                        value="${supplement.id}" id="supp_${supplement.id}">
                                                    <label class="form-check-label w-100" for="supp_${supplement.id}">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <span class="fw-bold">${supplement.libelle}</span>
                                                            <span
                                                                class="badge bg-primary rounded-pill">+${supplement.prixUnitaire}
                                                                DT</span>
                                                        </div>
                                                    </label>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="${pageContext.request.contextPath}/workspaces"
                                class="btn btn-outline-secondary me-md-2">Annuler</a>
                            <button type="submit" class="btn btn-primary px-5 py-2 fw-bold">
                                <i class="bi bi-check-circle me-2"></i>Confirmer la reservation
                            </button>
                        </div>
                    </form>
                </div>
            </main>

            <footer class="bg-dark text-light py-4 mt-auto">
                <div class="container text-center">
                    <p class="mb-0">&copy; 2025 CoworkSpace. Tous droits reserves.</p>
                </div>
            </footer>

            <!-- Bootstrap Bundle JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>

            <!-- Custom JS -->
            <script src="${pageContext.request.contextPath}/js/app.js"></script>
            <script>
                function activateMeetingBundle() {
                    const supplements = document.querySelectorAll('input[name="supplements"]');
                    let count = 0;

                    supplements.forEach(checkbox => {
                        const label = document.querySelector(`label[for="${checkbox.id}"]`);
                        if (label) {
                            const text = label.textContent.toLowerCase();
                            // Logic matches ReservationService.isMeetingBundle
                            if (text.includes('projecteur') || text.includes('vidéo') || text.includes('ecran') ||
                                text.includes('café') || text.includes('coffee') || text.includes('boisson') ||
                                text.includes('bloc') || text.includes('note') || text.includes('papier')) {
                                checkbox.checked = true;
                                count++;
                                // Trigger change event for price calculator if it exists
                                const event = new Event('change');
                                checkbox.dispatchEvent(event);
                            }
                        }
                    });

                    if (count > 0) {
                        if (window.showNotification) {
                            showNotification('Pack Réunion activé ! Une réduction de 10% sera appliquée sur ces suppléments.', 'success');
                        } else {
                            alert('Pack Réunion activé ! Une réduction de 10% sera appliquée sur ces suppléments.');
                        }
                    } else {
                        if (window.showNotification) {
                            showNotification('Aucun supplément correspondant au pack n\'a été trouvé.', 'warning');
                        } else {
                            alert('Aucun supplément correspondant au pack n\'a été trouvé.');
                        }
                    }
                }
            </script>
        </body>

        </html>