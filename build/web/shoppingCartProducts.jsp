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
        <div>
            <c:forEach items="${shoppingCart.shoppingCartProducts}" var="sc" >
                <div class="allcontain">
                    <div lass="row firstrow">
                        <div class="" style="width:600px;">
                            <div class="featurecontant">
                                <h1>${sc.product.name}</h1>
                                <p>"Lorem ipsum dolor sit amet, consectetur ,<br>
                                    sed do eiusmod tempor incididunt </p>
                                <h2>${sc.product.price} &euro;</h2>
                                <p>${sc.quantity}</p>
                                <form action="/WebShop/AddRemoveProductServlet" method="post">
                                    <input type="submit" id="${sc.product.idproduct}" value="+" name="add" class="btn btn-secondary"/>
                                    <input type="submit" id="${sc.product.idproduct}" value="-" name="remove" class="btn btn-secondary"/>
                                    <input type="hidden" value="${sc.product.idproduct}" name="productId">
                                </form>
                                <form action="/WebShop/RemoveShoppingCartProductServlet" method="post">
                                    <input type="hidden" value="${sc.product.idproduct}" name="productId" >
                                    <input type="submit" value="Remove product from shopping cart" class="btn btn-secondary">
                                </form>
                            </div>
                        </div>
                        <c:forEach items="${sc.product.productCategories}" var="productCategory">
                            <p> Category: <c:out value = "${productCategory.category.name}" /> </p>  
                        </c:forEach>
                    </div>
                </c:forEach>
                <form action="/WebShop/CheckoutServlet" method="get">
                    <input type="submit" value="Checkout" class="btn btn-dark">
                </form> 
            </div>
            <%@include file="partials/footer.jsp" %>
    </body>
</html>
