<%-- 
    Document   : usersShoppingHistory
    Created on : 01-Sep-2019, 11:51:39
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users Shopping History</title>
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
        <c:forEach items="${bills}" var="b" >
            <h3>${b.user.username}</h3>
            <hr>
            <h4><fmt:formatDate type="both" value="${b.date}"/></h4>
            <hr>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${b.shoppingCart.shoppingCartProducts}" var="scp" >
                        <tr>
                            <td>${scp.product.name}</td>
                            <td>${scp.product.price}</td>
                            <td>${scp.quantity}</td>
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
            <br>
        </c:forEach>
        <%@include file="partials/footer.jsp" %>
    </body>
</html>
