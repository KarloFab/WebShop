/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.other;

import entites.Category;
import entites.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.CategoryDao;
import services.ProductService;

/**
 *
 * @author Karlo
 */
public class MainServlet extends HttpServlet {

    private ProductService productService = new ProductService();
    private List<Product> products = new ArrayList<>();
    private AbstractDao categoryDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //request.getSession().setAttribute("shoppingCart", shoppingCart);
        this.products = productService.findAll();
        request.getSession().setAttribute("products", products);
        request.getSession().setAttribute("categories", categoryDao.findAll(Category.class));
        response.sendRedirect("main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
