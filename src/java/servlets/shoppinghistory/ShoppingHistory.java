/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.shoppinghistory;

import entites.Bill;
import entites.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.BillService;

/**
 *
 * @author Karlo
 */
public class ShoppingHistory extends HttpServlet {

    private BillService billService = new BillService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            List<Bill> bills = billService.findBillsByUser(user);
            request.getSession().setAttribute("bills", bills);
            response.sendRedirect("shoppingHistory.jsp");
        } else {
            response.sendRedirect("userRegistration.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
