/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.usershoppinghistory;

import entites.Bill;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.BillDao;
import servlets.utils.BillFilterUtil;

/**
 *
 * @author Karlo
 */
public class UsersShoppingHistory extends HttpServlet {

    private final AbstractDao billDao = new BillDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().setAttribute("bills", billDao.findAll(Bill.class));
        response.sendRedirect("usersShoppingHistory.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usernameToSearch = request.getParameter("username");
        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");
        List<Bill> bills = billDao.findAll(Bill.class);

        bills = BillFilterUtil.filterBillsByUsernameAndShoppingDateBetween(bills, usernameToSearch, dateFrom, dateTo);

        if (bills.isEmpty()) {
            request.getSession().setAttribute("bills", null);
            request.setAttribute("message", "No records found!");
        } else {
            request.setAttribute("bills", bills);
        }

        request.getRequestDispatcher("usersShoppingHistory.jsp").forward(request, response);
    }
}
