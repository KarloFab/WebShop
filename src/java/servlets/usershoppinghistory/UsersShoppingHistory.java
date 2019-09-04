/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.usershoppinghistory;

import entites.Bill;
import java.io.IOException;
import java.util.List;
import static java.util.stream.Collectors.toList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.BillDao;

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
        String usrenameToSearch = request.getParameter("username");
        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");

        List<Bill> bills = billDao.findAll(Bill.class);
        bills = bills.stream()
                .filter(bill -> bill.getUser().getUsername().equals(usrenameToSearch))
                .collect(toList());
        request.setAttribute("bills", bills);

        response.sendRedirect("usersShoppingHistory.jsp");
    }
}
