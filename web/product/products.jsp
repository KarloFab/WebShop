<%-- 
    Document   : products
    Created on : 07-Apr-2019, 15:30:22
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@include file="/partials/header.jsp" %>
        <div>
            <c:forEach items="${products}" var="p" >
                <li>
                    <a href='/WebShop/Product?productId=${p.idproduct}'>${p.name}</a>
                </li>
                <form action="/WebShop/ShoppingCart" method="post">
                    <input type="submit" value="Add to shopping cart">
                    <input type="hidden" value="${p.idproduct}" name="productId">
                </form>   
            </c:forEach>
        </div>
        <%@include file="/partials/footer.jsp" %>
        <form action="/WebShop/AddProduct" method="get">
            <input type="submit" value="Add new product">
        </form>  
    </body>
</html>
