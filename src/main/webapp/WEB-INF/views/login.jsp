<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Connexion - CoworkSpace</title>

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

            <!-- Custom CSS (overrides Bootstrap) -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        </head>

        <body>
            <div class="auth-container">
                <!-- Sidebar (Image & Quote) -->
                <div class="auth-sidebar">
                    <div class="auth-sidebar-content">
                        <a href="${pageContext.request.contextPath}/" class="auth-logo"
                            style="color: white;">CoworkSpace</a>
                    </div>
                    <div class="auth-sidebar-content">
                        <blockquote class="auth-quote">
                            "L'environnement de travail idéal pour booster votre productivité et votre créativité."
                        </blockquote>
                        <div class="auth-quote-author">
                            — L'équipe CoworkSpace
                        </div>
                    </div>
                </div>

                <!-- Main Content (Form) -->
                <div class="auth-main">
                    <div class="auth-form-container fade-in-up">
                        <div class="auth-header">
                            <a href="${pageContext.request.contextPath}/" class="auth-logo d-lg-none">CoworkSpace</a>
                            <h1 class="auth-title">Bon retour !</h1>
                            <p class="auth-subtitle">Connectez-vous pour accéder à votre espace.</p>
                        </div>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger mb-4 fade show" role="alert">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/login" method="post" data-validate="true">
                            <div class="mb-3">
                                <label for="email" class="form-label">Adresse email <span
                                        class="text-danger">*</span></label>
                                <input type="email" id="email" name="email" class="form-control"
                                    placeholder="give your email" required autofocus>
                            </div>

                            <div class="mb-3">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <label for="password" class="form-label mb-0">Mot de passe <span
                                            class="text-danger">*</span></label>
                                    <!-- <a href="#" class="text-primary text-decoration-none small">Mot de passe oublié ?</a> -->
                                </div>
                                <input type="password" id="password" name="motDePasse" class="form-control"
                                    placeholder="••••••••" required>
                            </div>

                            <div class="d-grid gap-2 mt-4">
                                <button type="submit" class="btn btn-primary btn-lg">Se connecter</button>
                            </div>
                        </form>

                        <div class="text-center mt-4">
                            <p class="text-secondary mb-0">
                                Vous n'avez pas de compte ?
                                <a href="${pageContext.request.contextPath}/register"
                                    class="text-primary fw-medium text-decoration-none">Créer un compte</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bootstrap Bundle JS (includes Popper) -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>

            <!-- Custom JS -->
            <script src="${pageContext.request.contextPath}/js/app.js"></script>
        </body>

        </html>