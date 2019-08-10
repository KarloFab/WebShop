package servlets.product;

import entites.Category;
import entites.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.CategoryDao;
import services.ProductService;

/**
 *
 * @author Karlo
 */
public class ProductsServlet extends HttpServlet {

    private ProductService productService = new ProductService();
    private List<Product> products = new ArrayList<>();
    private AbstractDao categoryDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.products = productService.findAll();
        request.getSession().setAttribute("products", products);
        request.getSession().setAttribute("categories", categoryDao.findAll(Category.class));
        response.sendRedirect("product/products.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
