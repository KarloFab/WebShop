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

/**
 *
 * @author Karlo
 */
public class MainServlet extends HttpServlet {

    private ProductService productService = new ProductService();
    private List<Product> products = new ArrayList<>();
    private AbstractDao categoryDao = new CategoryDao();
    private final AbstractDao shoppingCartDao = new ShoppingCartDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.products = productService.findAll();
        List<ShoppingCart> shoppingCarts = shoppingCartDao.findAll(ShoppingCart.class);
        //todo DOHVATIT ZA USERA POSEBNO
        ShoppingCart shoppingCart = shoppingCarts.get(1);
        int productsQuantitySum = shoppingCart.getShoppingCartProducts()
                .stream()
                .mapToInt(ShoppingCartProduct::getQuantity).sum();
        BigDecimal productsPricesSum = shoppingCart.getShoppingCartProducts()
                .stream()
                .map(sp -> sp.getProduct().getPrice())
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        request.getSession().setAttribute("productsPricesSum", productsPricesSum);
        request.getSession().setAttribute("shoppingCartProductsQuantitySum", productsQuantitySum);
        request.getSession().setAttribute("shoppingCart", shoppingCart);
        request.getSession().setAttribute("products", products);
        request.getSession().setAttribute("categories", categoryDao.findAll(Category.class));
        response.sendRedirect("main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
