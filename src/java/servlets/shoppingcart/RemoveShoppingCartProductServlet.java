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
public class RemoveShoppingCartProductServlet extends HttpServlet {

    private AbstractDao shoppingCartProductDao = new ShoppingCartDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession()
                .getAttribute("shoppingCart");
        if (shoppingCart != null) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            ShoppingCartProduct shoppingCartProduct = shoppingCart
                    .getShoppingCartProducts()
                    .stream()
                    .filter(sc -> sc.getProduct().getIdproduct() == productId)
                    .findFirst()
                    .get();
            shoppingCart.getShoppingCartProducts().remove(shoppingCartProduct);
            int productsQuantitySum = ShoppingCartUtil.getShoppingCartProductsQuantitySum(shoppingCart);
            request.getSession().setAttribute("shoppingCartProductsQuantitySum", productsQuantitySum);

            if (shoppingCart.getShoppingCartProducts().isEmpty()) {
                request.getSession().setAttribute("shoppingCart", null);
            }
            response.sendRedirect("shoppingCartProducts.jsp");
        }
    }
}
