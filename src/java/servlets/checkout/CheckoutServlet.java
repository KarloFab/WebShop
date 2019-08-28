/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.checkout;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Karlo
 */
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("checkout.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getSession().getAttribute("username").toString();
        String password = request.getSession().getAttribute("password").toString();

        //TODO check properly AND CHECK IF USER EXISTS OR NOT, IF IT DOESNT EXITS THEN REDIRECT
       
        if(!username.equals("a") && !password.equals("a")){
            response.sendRedirect("login.jsp");
        }
    }
}
