<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion Espaces - CoworkSpace Admin</title>

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
                        <li class="nav-item"><a class="nav-link active"
                                href="${pageContext.request.contextPath}/admin/workspaces">Espaces</a></li>
                        <li class="nav-item"><a class="nav-link"
                                href="${pageContext.request.contextPath}/admin/reservations">Reservations</a></li>
                        <li class="nav-item"><a class="nav-link"
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
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="h3 mb-1">Gestion des Espaces</h1>
                    <p class="text-muted mb-0">Ajouter, modifier ou supprimer des espaces de travail</p>
                </div>
            </div>

            <!-- Add Workspace Form -->
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-white">
                    <h5 class="mb-0"><i class="bi bi-building-add me-2"></i>Ajouter un nouvel espace</h5>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/workspaces" method="post">
                        <input type="hidden" name="action" value="create" />
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="nom" class="form-label">Nom de l'espace <span
                                        class="text-danger">*</span></label>
                                <input type="text" id="nom" name="nom" class="form-control"
                                    placeholder="give workspace name" required />
                            </div>
                            <div class="col-md-6">
                                <label for="typeEspace" class="form-label">Type d'espace <span
                                        class="text-danger">*</span></label>
                                <select id="typeEspace" name="typeEspace" class="form-select" required>
                                    <option value="">Selectionnez un type</option>
                                    <option value="BUREAU">Bureau individuel</option>
                                    <option value="SALLE_REUNION">Salle de reunion</option>
                                    <option value="SALLE_FORMATION">Salle de formation</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="capacite" class="form-label">Capacite (personnes) <span
                                        class="text-danger">*</span></label>
                                <input type="number" id="capacite" name="capacite" class="form-control" min="1"
                                    placeholder="give capacity" required />
                            </div>
                            <div class="col-md-6">
                                <label for="prixHoraire" class="form-label">Prix Horaire (DT) <span
                                        class="text-danger">*</span></label>
                                <input type="number" id="prixHoraire" name="prixHoraire" class="form-control"
                                    step="0.01" min="0" placeholder="give price" required />
                            </div>
                            <div class="col-12">
                                <label for="image" class="form-label">URL de l'image</label>
                                <input type="text" id="image" name="image" class="form-control"
                                    placeholder="https://example.com/image.jpg" />
                            </div>
                            <div class="col-12">
                                <label for="description" class="form-label">Description</label>
                                <textarea id="description" name="description" class="form-control" rows="3"
                                    placeholder="give description"></textarea>
                            </div>
                        </div>
                        <div class="text-end mt-3">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-plus-circle me-2"></i>Creer l'espace
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Workspaces Table -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white">
                    <h5 class="mb-0"><i class="bi bi-building me-2"></i>Liste des espaces</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Nom</th>
                                    <th>Type</th>
                                    <th>Capacite</th>
                                    <th>Prix/h</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="workspace" items="${workspaces}">
                                    <tr>
                                        <td class="text-muted">#${workspace.id}</td>
                                        <td>
                                            <c:if test="${not empty workspace.image}">
                                                <img src="${workspace.image}" alt="${workspace.nom}" class="rounded"
                                                    style="width: 50px; height: 50px; object-fit: cover;">
                                            </c:if>
                                            <c:if test="${empty workspace.image}">
                                                <div class="rounded bg-light d-flex align-items-center justify-content-center text-muted"
                                                    style="width: 50px; height: 50px;">
                                                    <i class="bi bi-image"></i>
                                                </div>
                                            </c:if>
                                        </td>
                                        <td><strong>${workspace.nom}</strong></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${workspace.typeEspace == 'BUREAU'}">
                                                    <span class="badge bg-info text-dark">Bureau</span>
                                                </c:when>
                                                <c:when test="${workspace.typeEspace == 'SALLE_REUNION'}">
                                                    <span class="badge bg-primary">Reunion</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-warning text-dark">Formation</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><i class="bi bi-people me-1"></i>${workspace.capacite}</td>
                                        <td><strong class="text-primary">${workspace.prixHoraire} DT</strong></td>
                                        <td class="text-end">
                                            <form action="${pageContext.request.contextPath}/admin/workspaces"
                                                method="post" style="display:inline;"
                                                onsubmit="return confirm('Etes-vous sur de vouloir supprimer cet espace ?')">
                                                <input type="hidden" name="action" value="delete" />
                                                <input type="hidden" name="workspaceId" value="${workspace.id}" />
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