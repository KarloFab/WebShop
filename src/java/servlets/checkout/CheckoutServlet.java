/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.checkout;

import entites.Bill;
import entites.ShoppingCart;
import entites.User;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.BillDao;
import repositories.ShoppingCartDao;

/**
 *
 * @author Karlo
 */
public class CheckoutServlet extends HttpServlet {

    private AbstractDao billDao = new BillDao();
    private AbstractDao shoppingCartDao = new ShoppingCartDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
        BigDecimal productsPricesSum = BigDecimal.ZERO;
        if (shoppingCart != null) {
            productsPricesSum = shoppingCart.getShoppingCartProducts()
                    .stream()
                    .map(sp -> sp.getProduct().getPrice())
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
        }
        request.getSession().setAttribute("productsPricesSum", productsPricesSum);
        response.sendRedirect("checkout.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
        shoppingCart.setIsBought(Boolean.TRUE);

        shoppingCartDao.update(shoppingCart);

        Bill bill = new Bill();
        bill.setShoppingCart(shoppingCart);
        bill.setStore(null);
        bill.setUser(user);

        billDao.save(bill);

        request.getSession().setAttribute("shoppingCart", new ShoppingCart());
        request.getSession().setAttribute("shoppingCartProductsQuantitySum", 0);
        response.sendRedirect("main.jsp");
    }
}
