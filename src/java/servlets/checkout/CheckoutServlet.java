/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.checkout;

import entites.Bill;
import entites.PaymentMethod;
import entites.ShoppingCart;
import entites.User;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.BillDao;
import repositories.PaymentMethodDao;
import repositories.ShoppingCartDao;

/**
 *
 * @author Karlo
 */
public class CheckoutServlet extends HttpServlet {

    private AbstractDao billDao = new BillDao();
    private AbstractDao shoppingCartDao = new ShoppingCartDao();
    private AbstractDao paymentMethodDao = new PaymentMethodDao();

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

        List<PaymentMethod> paymentMethods = paymentMethodDao.findAll(PaymentMethod.class);
        String payPal = request.getParameter("PayPal");
        String cashDelivery = request.getParameter("Cash-Delivery");
        PaymentMethod paymentMethod = null;

        if (payPal != null) {
            paymentMethod = paymentMethods.stream()
                    .filter(pm -> pm.getName().equals(payPal))
                    .findFirst()
                    .orElse(null);

        } else if (request.getAttribute(cashDelivery) != null) {
            paymentMethod = paymentMethods.stream()
                    .filter(pm -> pm.getName().equals(cashDelivery))
                    .findFirst()
                    .orElse(null);
        }

        Bill bill = new Bill();
        bill.setShoppingCart(shoppingCart);
        bill.setStore(null);
        bill.setUser(user);
        bill.setPaymentMethod(paymentMethod);
        bill.setDate(new Date());

        billDao.save(bill);

        request.getSession().setAttribute("shoppingCart", new ShoppingCart());
        request.getSession().setAttribute("shoppingCartProductsQuantitySum", 0);
        response.sendRedirect("main.jsp");
    }
}
