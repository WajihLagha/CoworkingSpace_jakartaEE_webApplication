package com.coworking.web;

import com.coworking.model.Supplement;
import com.coworking.dao.SupplementDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.util.List;

@WebServlet("/admin/supplements")
public class SupplementCrudServlet extends HttpServlet {
    private SupplementDAO supplementDAO = new SupplementDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        List<Supplement> supplements = supplementDAO.findAll();
        req.setAttribute("supplements", supplements);
        req.getRequestDispatcher("/WEB-INF/views/supplementCrud.jsp").forward(req, resp);
    }
    // Add doPost for add/edit/delete
}
