/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.other;

import entites.User;
import entites.UserLoginHistory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.UserLoginHistoryDao;
import services.UserService;

/**
 *
 * @author Karlo
 */
public class LoginServlet extends HttpServlet {

    private UserService userService = new UserService();
    private AbstractDao userLoginHistoryDao = new UserLoginHistoryDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userService.findUserByUsernameAndPassword(username, password);

        if (user != null) {
            userLoginHistoryDao.save(new UserLoginHistory(user, request.getRemoteAddr(), new Date()));
            request.getSession().setAttribute("user", user);
            response.sendRedirect("Main");
        } else {
            request.getSession().setAttribute("user", null);
            request.setAttribute("message", "Wrong credentials");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
