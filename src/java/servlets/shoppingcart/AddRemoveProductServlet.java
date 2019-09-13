/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.shoppingcart;

import entites.ShoppingCart;
import entites.ShoppingCartProduct;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.ShoppingCartDao;
import servlets.utils.ShoppingCartUtil;

/**
 *
 * @author Karlo
 */
public class AddRemoveProductServlet extends HttpServlet {

    private AbstractDao shoppingCartDao = new ShoppingCartDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession()
                .getAttribute("shoppingCart");
        int productId = Integer.parseInt(request.getParameter("productId"));
        ShoppingCartProduct shoppingCartProduct = shoppingCart
                .getShoppingCartProducts()
                .stream()
                .filter(sc -> sc.getProduct().getIdproduct() == productId)
                .findFirst()
                .get();
        int quantity = shoppingCartProduct.getQuantity();
        if (request.getParameter("add") != null) {
            shoppingCartProduct.setQuantity(++quantity);
        } else if (request.getParameter("remove") != null) {
            if (quantity > 1) {
                shoppingCartProduct.setQuantity(--quantity);
            }
        }
        int productsQuantitySum = ShoppingCartUtil.getShoppingCartProductsQuantitySum(shoppingCart);
        request.getSession().setAttribute("shoppingCartProductsQuantitySum", productsQuantitySum);
        response.sendRedirect("shoppingCartProducts.jsp");
    }
}
