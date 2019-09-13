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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
        <script>
            $(function () {
                $("#datepickerFrom").datepicker();
                $("#datepickerTo").datepicker();
            });
        </script>
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
        <form action="/WebShop/UsersShoppingHistory" method="post" style="margin-top:40px; margin-left:30px;">
            <input class="form-control" name="username" type="text" placeholder="Search by Username.." style="width:200px;display:inline-block;">
            <input type="text" placeholder="Date from..." name="dateFrom" class="form-control" id="datepickerFrom" style="width:200px;display:inline-block;">
            <input type="text" placeholder="Date to..." name="dateTo" class="form-control" id="datepickerTo" style="width:200px;display:inline-block;">
            <input type="submit"  value="Search" name="username" class="btn btn-secondary" style="margin-left:10px;"/>
        </form>
        <p>${message}</p>
        <c:forEach items="${bills}" var="b" >
            <div style="padding:30px;">
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
                            <th scope="col">Payment Method</th>
                        </tr>
                        <tr>
                            <td></td>
                            <td>${productsPricesSum}</td>
                            <td>${shoppingCartProductsQuantitySum}</td>
                            <td>${b.paymentMethod.getName()}</td>
                        </tr>
                    </tfoot>
                </table>
                <br>
            </div>
        </c:forEach>
        <%@include file="partials/footer.jsp" %>
    </body>
</html>
