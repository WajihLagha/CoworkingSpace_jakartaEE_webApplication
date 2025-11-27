package com.coworking.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.coworking.dao.JPAUtil;
import jakarta.persistence.EntityManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

@WebServlet("/test-db")
public class DatabaseTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Database Connection Test</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; margin: 40px; background: #f5f5f5; }");
        out.println(
                ".container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }");
        out.println("h1 { color: #333; }");
        out.println(".success { color: #28a745; font-weight: bold; }");
        out.println(".error { color: #dc3545; font-weight: bold; }");
        out.println(".info { background: #e7f3ff; padding: 15px; border-left: 4px solid #2196F3; margin: 15px 0; }");
        out.println("pre { background: #f8f9fa; padding: 15px; border-radius: 4px; overflow-x: auto; }");
        out.println("table { border-collapse: collapse; width: 100%; margin: 20px 0; }");
        out.println("th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }");
        out.println("th { background-color: #4CAF50; color: white; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");
        out.println("<h1>🔌 Database Connection Test</h1>");

        // Test 1: Direct JDBC Connection
        out.println("<h2>Test 1: Direct JDBC Connection</h2>");
        testJDBCConnection(out);

        // Test 2: JPA EntityManager
        out.println("<h2>Test 2: JPA EntityManager Connection</h2>");
        testJPAConnection(out);

        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }

    private void testJDBCConnection(PrintWriter out) {
        String url = "jdbc:mysql://localhost:3306/coworking_db?useSSL=false";
        String user = "root";
        String password = "";

        out.println("<div class='info'>");
        out.println("<strong>Connection Details:</strong><br>");
        out.println("URL: " + url + "<br>");
        out.println("User: " + user + "<br>");
        out.println("Password: (empty)");
        out.println("</div>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            out.println("<p class='success'>✅ MySQL Driver loaded successfully</p>");

            Connection conn = DriverManager.getConnection(url, user, password);
            out.println("<p class='success'>✅ JDBC Connection successful!</p>");

            out.println("<table>");
            out.println("<tr><th>Property</th><th>Value</th></tr>");
            out.println(
                    "<tr><td>Database Product</td><td>" + conn.getMetaData().getDatabaseProductName() + "</td></tr>");
            out.println("<tr><td>Database Version</td><td>" + conn.getMetaData().getDatabaseProductVersion()
                    + "</td></tr>");
            out.println("<tr><td>Driver Name</td><td>" + conn.getMetaData().getDriverName() + "</td></tr>");
            out.println("<tr><td>Driver Version</td><td>" + conn.getMetaData().getDriverVersion() + "</td></tr>");
            out.println("<tr><td>Catalog (Database)</td><td>" + conn.getCatalog() + "</td></tr>");
            out.println("</table>");

            conn.close();
            out.println("<p class='success'>✅ Connection closed successfully</p>");

        } catch (ClassNotFoundException e) {
            out.println("<p class='error'>❌ MySQL Driver not found!</p>");
            out.println("<pre>Error: " + e.getMessage() + "</pre>");
            out.println("<p><strong>Fix:</strong> Add mysql-connector-j JAR to WEB-INF/lib/</p>");
        } catch (Exception e) {
            out.println("<p class='error'>❌ JDBC Connection failed!</p>");
            out.println("<pre>Error: " + e.getMessage() + "</pre>");
            e.printStackTrace(out);
        }
    }

    private void testJPAConnection(PrintWriter out) {
        try {
            EntityManager em = JPAUtil.getEntityManager();
            out.println("<p class='success'>✅ EntityManager created successfully!</p>");
            out.println("<p>EntityManager instance: " + em.getClass().getName() + "</p>");

            // Test a simple query
            try {
                Long count = em.createQuery("SELECT COUNT(u) FROM Utilisateur u", Long.class).getSingleResult();
                out.println("<p class='success'>✅ Query executed successfully!</p>");
                out.println("<p>Number of users in database: <strong>" + count + "</strong></p>");
            } catch (Exception e) {
                out.println("<p class='error'>⚠️ Query execution failed (this is normal if tables are empty)</p>");
                out.println("<pre>" + e.getMessage() + "</pre>");
            }

            em.close();
            out.println("<p class='success'>✅ EntityManager closed successfully</p>");

        } catch (Exception e) {
            out.println("<p class='error'>❌ JPA Connection failed!</p>");
            out.println("<pre>Error: " + e.getMessage() + "</pre>");
            e.printStackTrace(out);
        }
    }
}
