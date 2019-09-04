/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.user;

import entites.Role;
import entites.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repositories.AbstractDao;
import repositories.RolesDao;
import repositories.UserDao;

/**
 *
 * @author Karlo
 */
public class UserDetails extends HttpServlet {

    private AbstractDao userDao = new UserDao();
    private AbstractDao rolesDao = new RolesDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        request.getSession().setAttribute("roles", rolesDao.findAll(Role.class));
        request.getSession().setAttribute("user", userDao.findById(User.class, userId));
        response.sendRedirect("userDetails.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
