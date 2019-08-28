<%-- 
    Document   : checkout
    Created on : 28-Aug-2019, 21:58:41
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${shoppingCart.shoppingCartProducts}" var="sc" >
                    <tr>
                        <td>${sc.product.name}</td>
                        <td>${sc.product.price}</td>
                        <td>${sc.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <th></th>
                    <th scope="col">Price Sum</th>
                    <th scope="col">Quantity Sum</th>
                </tr>
                <tr>
                    <td></td>
                    <td>${productsPricesSum}</td>
                    <td>${shoppingCartProductsQuantitySum}</td>
                </tr>
            </tfoot>
        </table>
        <form action="/WebShop/CheckoutServlet" method="post">
            <input type="submit" value="BUY" class="btn btn-secondary">
        </form>
        <%@include file="partials/footer.jsp" %>
    </body>
</html>
