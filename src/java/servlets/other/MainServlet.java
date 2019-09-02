/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.other;

import entites.Category;
import entites.Product;
import entites.ShoppingCart;
import entites.ShoppingCartProduct;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.CategoryDao;
import repositories.ShoppingCartDao;
import services.ProductService;
import servlets.utils.ShoppingCartUtil;

/**
 *
 * @author Karlo
 */
public class MainServlet extends HttpServlet {

    private ProductService productService = new ProductService();
    private AbstractDao categoryDao = new CategoryDao();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productsQuantitySum = 0;

        ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("shoppingCart");
        if (shoppingCart == null) {
            request.getSession().setAttribute("shoppingCart", new ShoppingCart());
        } else {
            productsQuantitySum = ShoppingCartUtil.getShoppingCartProductsQuantitySum(shoppingCart);
        }
        
        request.getSession().setAttribute("shoppingCartProductsQuantitySum", productsQuantitySum);
        request.getSession().setAttribute("products", productService.findAll());
        request.getSession().setAttribute("categories", categoryDao.findAll(Category.class));
        response.sendRedirect("main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
