/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.category;

import entites.Category;
import entites.Product;
import java.io.IOException;
import java.util.ArrayList;
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

        List<Product> products = (List<Product>) request.getSession().getAttribute("productsFiltered");
        List<String> selectedCategories = (List<String>) request.getSession().getAttribute("selectedCategories");
        String selectedCategory = request.getParameter("category");

        if (products.isEmpty()) {
            products = (List<Product>) request.getSession().getAttribute("products");
        }

        if (selectedCategories == null) {
            selectedCategories = new ArrayList<>();
        }

        if (!selectedCategories.contains(selectedCategory)) {
            selectedCategories.add(selectedCategory);
        }

        products = filterProducts(products, selectedCategories);

        request.getSession().setAttribute("selectedCategories", selectedCategories);
        request.getSession().setAttribute("productsFiltered", products);
        response.sendRedirect("main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = (List<Product>) request.getSession().getAttribute("productsFiltered");
        List<String> selectedCategories = (List<String>) request.getSession().getAttribute("selectedCategories");
        String selectedCategory = request.getParameter("category");

        selectedCategories.remove(selectedCategory);

        if (selectedCategories.isEmpty()) {
            products = (List<Product>) request.getSession().getAttribute("products");
        } else {
            products = filterProducts(products, selectedCategories);
        }

        request.getSession().setAttribute("selectedCategories", selectedCategories);
        request.getSession().setAttribute("productsFiltered", products);
        response.sendRedirect("main.jsp");
    }

    private List<Product> filterProducts(List<Product> products, List<String> categories) {
        return products.stream()
                .filter(p -> p.getProductCategories().stream()
                        .map(pc -> pc.getCategory().getName())
                        .anyMatch(productCategoryName -> categories.stream()
                                .anyMatch(c -> c.equals(productCategoryName))))
                .collect(toList());
    }
}
