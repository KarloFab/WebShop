/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.shoppingcart;

import entites.Product;
import entites.ShoppingCart;
import entites.ShoppingCartProduct;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.ProductDao;
import repositories.ShoppingCartDao;
import repositories.ShoppingCartProductDao;

/**
 *
 * @author Karlo
 */
public class ShoppingCartServlet extends HttpServlet {

    private final AbstractDao productDao = new ProductDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("shoppingCartProducts.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession()
                .getAttribute("shoppingCart");
        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
            request.getSession().setAttribute("shoppingCart", shoppingCart);
        }
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = (Product) productDao.findById(Product.class, productId);

        ShoppingCartProduct shoppingCartProduct = shoppingCart
                .getShoppingCartProducts()
                .stream()
                .filter(sp -> sp.getProduct().getIdproduct() == product.getIdproduct())
                .findFirst()
                .orElse(null);

        if (shoppingCartProduct != null) {
            int quantity = shoppingCartProduct.getQuantity();
            shoppingCartProduct.setQuantity(quantity += 1);
        } else {
            shoppingCart.getShoppingCartProducts()
                    .add(new ShoppingCartProduct(product, shoppingCart, 1));
        }
        response.sendRedirect("Main");
    }
}
