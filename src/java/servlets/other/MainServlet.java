/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.other;

import entites.Category;
import entites.Product;
import entites.ShoppingCart;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.CategoryDao;
import services.ProductService;
import servlets.utils.ShoppingCartUtil;

/**
 *
 * @author Karlo
 */
public class MainServlet extends HttpServlet {

    private ProductService productService = new ProductService();
    private final AbstractDao categoryDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productsQuantitySum = 0;

        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
        if (shoppingCart != null) {
            productsQuantitySum = ShoppingCartUtil.getShoppingCartProductsQuantitySum(shoppingCart);
        }

        List<Product> products =  productService.findAll();
        
        request.getSession().setAttribute("shoppingCartProductsQuantitySum", productsQuantitySum);
        request.getSession().setAttribute("products", products);
        request.getSession().setAttribute("productsFiltered", products);
        request.getSession().setAttribute("categories", categoryDao.findAll(Category.class));
        request.getRequestDispatcher("main.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
