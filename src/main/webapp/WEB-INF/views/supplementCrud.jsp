<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion Supplements - CoworkSpace Admin</title>

        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@500;600;700&display=swap"
            rel="stylesheet">

        <!-- Bootstrap 5.3.3 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    </head>

    <body class="d-flex flex-column min-vh-100">
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">Admin Panel</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link"
                                href="${pageContext.request.contextPath}/mainMenu">Tableau de bord</a></li>
                        <li class="nav-item"><a class="nav-link"
                                href="${pageContext.request.contextPath}/admin/users">Utilisateurs</a></li>
                        <li class="nav-item"><a class="nav-link"
                                href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a></li>
                        <li class="nav-item"><a class="nav-link"
                                href="${pageContext.request.contextPath}/admin/reservations">Reservations</a></li>
                        <li class="nav-item"><a class="nav-link active"
                                href="${pageContext.request.contextPath}/admin/supplements">Supplements</a></li>
                    </ul>
                    <div class="d-flex align-items-center gap-2">
                        <span class="text-light d-none d-md-inline">Admin: ${sessionScope.utilisateur.nom}</span>
                        <a href="${pageContext.request.contextPath}/logout"
                            class="btn btn-outline-light btn-sm">Deconnexion</a>
                    </div>
                </div>
            </div>
        </nav>

        <main class="container flex-grow-1 py-4">
            <div class="mb-4">
                <h1 class="h3 mb-1">Gestion des Supplements</h1>
                <p class="text-muted mb-0">Ajouter ou supprimer des options supplementaires</p>
            </div>

            <!-- Add Supplement Form -->
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-white">
                    <h5 class="mb-0"><i class="bi bi-plus-circle me-2"></i>Ajouter un nouveau supplement</h5>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/supplements" method="post">
                        <input type="hidden" name="action" value="create" />
                        <div class="row g-3">
                            <div class="col-md-8">
                                <label for="libelle" class="form-label">Libelle <span
                                        class="text-danger">*</span></label>
                                <input type="text" id="libelle" name="libelle" class="form-control"
                                    placeholder="give supplement name" required />
                            </div>
                            <div class="col-md-4">
                                <label for="prixUnitaire" class="form-label">Prix Unitaire (DT) <span
                                        class="text-danger">*</span></label>
                                <input type="number" id="prixUnitaire" name="prixUnitaire" class="form-control"
                                    step="0.01" min="0" placeholder="give price" required />
                            </div>
                        </div>
                        <div class="text-end mt-3">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-plus-circle me-2"></i>Ajouter le supplement
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Supplements Table -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white">
                    <h5 class="mb-0"><i class="bi bi-list-ul me-2"></i>Liste des supplements</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Libelle</th>
                                    <th>Prix</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="supp" items="${supplements}">
                                    <tr>
                                        <td class="text-muted">#${supp.id}</td>
                                        <td><strong>${supp.libelle}</strong></td>
                                        <td><strong class="text-primary">${supp.prixUnitaire} DT</strong></td>
                                        <td class="text-end">
                                            <form action="${pageContext.request.contextPath}/admin/supplements"
                                                method="post" style="display:inline;"
                                                onsubmit="return confirm('Etes-vous sur de vouloir supprimer ce supplement ?')">
                                                <input type="hidden" name="action" value="delete" />
                                                <input type="hidden" name="supplementId" value="${supp.id}" />
                                                <button type="submit" class="btn btn-danger btn-sm">
                                                    <i class="bi bi-trash me-1"></i>Supprimer
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>

        <footer class="bg-dark text-light py-3 mt-auto">
            <div class="container text-center">
                <p class="mb-0">&copy; 2025 CoworkSpace Admin. Tous droits reserves.</p>
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