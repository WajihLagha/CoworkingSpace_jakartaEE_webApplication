<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Connexion - CoworkSpace</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <link
                href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@500;600;700&display=swap"
                rel="stylesheet">
            <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
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
                    <div class="auth-form-container">
                        <div class="auth-header">
                            <a href="${pageContext.request.contextPath}/" class="auth-logo d-lg-none">CoworkSpace</a>
                            <h1 class="auth-title">Bon retour !</h1>
                            <p class="auth-subtitle">Connectez-vous pour accéder à votre espace.</p>
                        </div>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger mb-6 fade-in">
                                ${error}
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/login" method="post" data-validate="true"
                            class="form">
                            <div class="form-group">
                                <label for="email" class="form-label required">Adresse email</label>
                                <input type="email" id="email" name="email" class="form-input"
                                    placeholder="votre@email.com" required autofocus>
                            </div>

                            <div class="form-group">
                                <div
                                    style="display: flex; justify-content: space-between; align-items: center; margin-bottom: var(--space-2);">
                                    <label for="password" class="form-label required" style="margin-bottom: 0;">Mot de
                                        passe</label>
                                    <!-- <a href="#" class="text-sm text-primary hover:underline">Mot de passe oublié ?</a> -->
                                </div>
                                <input type="password" id="password" name="motDePasse" class="form-input"
                                    placeholder="••••••••" required>
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="btn btn-primary btn-block btn-lg">Se connecter</button>
                            </div>
                        </form>

                        <div class="text-center mt-8">
                            <p class="text-secondary">
                                Vous n'avez pas de compte ?
                                <a href="${pageContext.request.contextPath}/register"
                                    class="text-primary font-medium hover:underline">Créer un compte</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>