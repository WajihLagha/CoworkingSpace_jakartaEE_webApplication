<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.coworking.model.Utilisateur" %>
<%
    // Check if user is logged in
    Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

    if (utilisateur == null) {
        // Not logged in - redirect to login page
        response.sendRedirect(request.getContextPath() + "/login");
    } else {
        // Logged in - redirect based on role
        if ("ADMIN".equals(utilisateur.getTypeUtilisateur().name())) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        } else {
            response.sendRedirect(request.getContextPath() + "/mainMenu");
        }
    }
%>
