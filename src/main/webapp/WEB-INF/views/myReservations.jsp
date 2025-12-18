<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Mes Reservations - CoworkSpace</title>

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
                                <li class="nav-item"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/chooseType">Reserver</a></li>
                                <li class="nav-item"><a class="nav-link active"
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
                <div class="container">
                    <div class="text-center mb-5">
                        <h1 class="display-5 fw-bold">Mes Reservations</h1>
                        <p class="text-muted fs-5">Consultez et gerez vos reservations</p>
                    </div>

                    <c:choose>
                        <c:when test="${empty reservations}">
                            <div class="card border-0 shadow text-center p-5 mx-auto" style="max-width: 500px;">
                                <div class="card-body">
                                    <i class="bi bi-calendar-x text-muted" style="font-size: 4rem;"></i>
                                    <h3 class="mt-3">Aucune reservation</h3>
                                    <p class="text-muted mb-4">Vous n'avez pas encore effectue de reservation.</p>
                                    <a href="${pageContext.request.contextPath}/chooseType" class="btn btn-primary">
                                        <i class="bi bi-plus-circle me-2"></i>Faire une reservation
                                    </a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row g-4">
                                <c:forEach var="resa" items="${reservations}">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="card h-100 border-0 shadow-sm hover-lift">
                                            <div
                                                class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                                                <h6 class="mb-0 fw-bold">#${resa.id}</h6>
                                                <c:choose>
                                                    <c:when test="${resa.statut == 'CONFIRMEE'}">
                                                        <span
                                                            class="badge bg-success-subtle text-success border border-success px-3">Confirmee</span>
                                                    </c:when>
                                                    <c:when test="${resa.statut == 'ANNULEE'}">
                                                        <span
                                                            class="badge bg-danger-subtle text-danger border border-danger px-3">Annulee</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span
                                                            class="badge bg-secondary-subtle text-secondary border border-secondary px-3">${resa.statut}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="card-body">
                                                <h5 class="card-title fw-bold mb-3">${resa.espaceTravail.nom}</h5>

                                                <div class="mb-3">
                                                    <div class="d-flex align-items-center text-muted mb-2">
                                                        <i class="bi bi-calendar-event me-2 text-primary"></i>
                                                        <span>${resa.formattedDateHeureDebut}</span>
                                                    </div>
                                                    <div class="d-flex align-items-center text-muted">
                                                        <i class="bi bi-arrow-right me-2 text-primary"></i>
                                                        <span>${resa.formattedDateHeureFin}</span>
                                                    </div>
                                                </div>

                                                <div class="d-flex justify-content-between align-items-end mt-4">
                                                    <div>
                                                        <small class="text-muted d-block">Montant Total</small>
                                                        <span class="fs-4 fw-bold text-primary">
                                                            <fmt:formatNumber value="${resa.montantTotal}" type="number"
                                                                minFractionDigits="2" maxFractionDigits="2" /> DT
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-footer bg-white border-top-0 pb-3 pt-0">
                                                <c:if test="${resa.statut != 'ANNULEE'}">
                                                    <div class="d-flex gap-2">
                                                        <c:if test="${resa.statut == 'CONFIRMEE'}">
                                                            <button type="button" class="btn btn-outline-warning w-100"
                                                                onclick="openReviewModal(${resa.espaceTravail.id}, '${resa.espaceTravail.nom}')">
                                                                <i class="bi bi-star me-1"></i>Noter
                                                            </button>
                                                        </c:if>
                                                        <form method="post"
                                                            action="${pageContext.request.contextPath}/myReservations"
                                                            class="w-100"
                                                            onsubmit="return confirm('Etes-vous sur de vouloir annuler cette reservation ?')">
                                                            <input type="hidden" name="action" value="cancel" />
                                                            <input type="hidden" name="reservationId"
                                                                value="${resa.id}" />
                                                            <button type="submit" class="btn btn-outline-danger w-100">
                                                                <i class="bi bi-x-circle me-1"></i>Annuler
                                                            </button>
                                                        </form>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="text-center mt-5">
                                <a href="${pageContext.request.contextPath}/chooseType"
                                    class="btn btn-primary btn-lg shadow-sm">
                                    <i class="bi bi-plus-circle me-2"></i>Nouvelle reservation
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <div class="text-center mt-4">
                        <a href="${pageContext.request.contextPath}/mainMenu" class="btn btn-outline-secondary">
                            <i class="bi bi-house-door me-2"></i>Retour au menu principal
                        </a>
                    </div>
                </div>
                </div>
            </main>

            <!-- Review Modal -->
            <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="${pageContext.request.contextPath}/reviews" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="reviewModalLabel">Noter l'espace</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="espaceId" id="reviewEspaceId" />
                                <h5 id="reviewEspaceName" class="mb-3 text-center fw-bold"></h5>

                                <div class="mb-3 text-center">
                                    <label class="form-label d-block">Votre note</label>
                                    <div class="rating-stars h2 text-warning" style="cursor: pointer;">
                                        <i class="bi bi-star" data-value="1"></i>
                                        <i class="bi bi-star" data-value="2"></i>
                                        <i class="bi bi-star" data-value="3"></i>
                                        <i class="bi bi-star" data-value="4"></i>
                                        <i class="bi bi-star" data-value="5"></i>
                                    </div>
                                    <input type="hidden" name="note" id="reviewNote" value="5" required />
                                </div>

                                <div class="mb-3">
                                    <label for="commentaire" class="form-label">Votre commentaire (optionnel)</label>
                                    <textarea class="form-control" id="commentaire" name="commentaire"
                                        rows="3"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                                <button type="submit" class="btn btn-primary">Envoyer l'avis</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script>
                function openReviewModal(espaceId, espaceName) {
                    document.getElementById('reviewEspaceId').value = espaceId;
                    document.getElementById('reviewEspaceName').textContent = espaceName;

                    // Reset stars
                    updateStars(5);
                    document.getElementById('reviewNote').value = 5;

                    const modal = new bootstrap.Modal(document.getElementById('reviewModal'));
                    modal.show();
                }

                // Star rating interaction
                document.querySelectorAll('.rating-stars i').forEach(star => {
                    star.addEventListener('mouseover', function () {
                        const value = this.getAttribute('data-value');
                        updateStars(value);
                    });

                    star.addEventListener('click', function () {
                        const value = this.getAttribute('data-value');
                        document.getElementById('reviewNote').value = value;
                        updateStars(value);
                    });
                });

                document.querySelector('.rating-stars').addEventListener('mouseleave', function () {
                    const value = document.getElementById('reviewNote').value;
                    updateStars(value);
                });

                function updateStars(value) {
                    document.querySelectorAll('.rating-stars i').forEach(star => {
                        const starValue = star.getAttribute('data-value');
                        if (starValue <= value) {
                            star.classList.remove('bi-star');
                            star.classList.add('bi-star-fill');
                        } else {
                            star.classList.remove('bi-star-fill');
                            star.classList.add('bi-star');
                        }
                    });
                }
            </script>

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
        </body>

        </html>