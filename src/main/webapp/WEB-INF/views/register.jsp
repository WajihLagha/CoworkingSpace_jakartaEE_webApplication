<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Inscription - CoworkSpace</title>
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
                            "Rejoignez notre communauté de professionnels et profitez d'espaces de travail
                            exceptionnels."
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
                            <h1 class="auth-title">Créer un compte</h1>
                            <p class="auth-subtitle">Commencez votre expérience CoworkSpace dès aujourd'hui.</p>
                        </div>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger mb-6 fade-in">
                                ${error}
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/register" method="post" data-validate="true"
                            class="form">
                            <div class="form-group">
                                <label for="nom" class="form-label required">Nom complet</label>
                                <input type="text" id="nom" name="nom" class="form-input" placeholder="Jean Dupont"
                                    required autofocus>
                            </div>

                            <div class="form-group">
                                <label for="email" class="form-label required">Adresse email</label>
                                <input type="email" id="email" name="email" class="form-input"
                                    placeholder="jean.dupont@example.com" required>
                            </div>

                            <div class="form-group">
                                <label for="motDePasse" class="form-label required">Mot de passe</label>
                                <input type="password" id="motDePasse" name="motDePasse" class="form-input"
                                    placeholder="Minimum 6 caractères" required minlength="6">
                                <span class="form-help">Le mot de passe doit contenir au moins 6 caractères</span>
                            </div>

                            <div class="form-group">
                                <label for="typeUtilisateur" class="form-label required">Type de compte</label>
                                <select id="typeUtilisateur" name="typeUtilisateur" class="form-select" required>
                                    <option value="">Sélectionnez un type</option>
                                    <option value="PARTICULIER">Particulier</option>
                                    <option value="ETUDIANT">Étudiant (-20% de réduction)</option>
                                </select>
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="btn btn-primary btn-block btn-lg">Créer mon compte</button>
                            </div>
                        </form>

                        <div class="text-center mt-8">
                            <p class="text-secondary">
                                Vous avez déjà un compte ?
                                <a href="${pageContext.request.contextPath}/login"
                                    class="text-primary font-medium hover:underline">Se connecter</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>