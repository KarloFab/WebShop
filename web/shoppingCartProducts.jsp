<%-- 
    Document   : shoppingCartProducts
    Created on : 07-Apr-2019, 17:37:33
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping cart products</title>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
        <c:choose>
            <c:when test="${shoppingCart != null}">
                <div>
                    <form action="/WebShop/CheckoutServlet" method="get" >
                        <input type="submit" value="Checkout" class="btn btn-white" style="float:right; margin-right:40px; margin-top:10px;">
                    </form> 
                    <div class="">
                        <c:forEach items="${shoppingCart.shoppingCartProducts}" var="sc" >
                            <div class="row firstrow">
                                <div>
                                    <div style="padding:10px; width:80%;border:1px solid black;margin:50px;">
                                        <h3>${sc.product.name}</h3>
                                        <h4>Quantity: ${sc.quantity}</h4>
                                        <p>${sc.product.description} &euro;</p>
                                        <h4>${sc.product.price} &euro;</h4>
                                        <div style="overflow:hiddeN">
                                            <form action="/WebShop/AddRemoveProductServlet" method="post" style="margin-bottom:20px;">
                                                <input type="submit" id="${sc.product.idproduct}" value="+" 
                                                       name="add" class="btn btn-white" style="font-size:20px;"/>
                                                <input type="submit" id="${sc.product.idproduct}" value="-" 
                                                       name="remove" class="btn btn-white" style="font-size:20px;"/>
                                                <input type="hidden" value="${sc.product.idproduct}" name="productId">
                                            </form>
                                            <form action="/WebShop/RemoveShoppingCartProduct" method="post" style="float:right;">
                                                <input type="hidden" value="${sc.product.idproduct}" name="productId" >
                                                <input type="submit" value="Remove product from shopping cart" class="btn btn-secondary">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                            </c:forEach>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <h1 style="text-align:center;">Shopping Cart is empty</h1>
                </c:otherwise>
            </c:choose>
            <%@include file="partials/footer.jsp" %>
    </body>
</html>
