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

/**
 *
 * @author Karlo
 */
public class ShoppingCartServlet extends HttpServlet {

    private final AbstractDao productDao = new ProductDao();
    private final AbstractDao shoppingCartDao = new ShoppingCartDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("shoppingCart") == null) {
            List<ShoppingCart> shoppingCarts = shoppingCartDao.findAll(ShoppingCart.class);
            //todo DOHVATIT ZA USERA POSEBNO
            request.getSession().setAttribute("shoppingCart", shoppingCarts.get(1));
        }
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

        if (shoppingCart.getShoppingCartProducts().contains(product)) {
            ShoppingCartProduct shoppingCartProduct = shoppingCart
                    .getShoppingCartProducts()
                    .stream()
                    .filter(sp -> sp.getProduct().equals(product))
                    .findFirst()
                    .get();

            int quantity = shoppingCartProduct.getQuantity();
            shoppingCartProduct.setQuantity(quantity += 1);
        } else {
            shoppingCart.getShoppingCartProducts()
                    .add(new ShoppingCartProduct(product, shoppingCart, 1));
            shoppingCartDao.save(shoppingCart);
            response.sendRedirect("Products");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
