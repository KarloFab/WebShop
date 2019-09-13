/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.category;

import entites.Product;
import entites.ProductCategory;
import java.io.IOException;
import java.util.List;
import static java.util.stream.Collectors.toList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Karlo
 */
public class CategoriesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = (List<Product>) request.getSession().getAttribute("products");
        String selectedCategory = request.getParameter("category");
        products = products.stream()
                .filter(p -> p.getProductCategories().stream()
                        .anyMatch(pc -> pc.getCategory().getName()
                                .equals(selectedCategory)))
                .collect(toList());

        if (products.isEmpty()) {
            request.getSession().setAttribute("products", null);

        } else {
            request.getSession().setAttribute("products", products);
        }

        response.sendRedirect("main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
