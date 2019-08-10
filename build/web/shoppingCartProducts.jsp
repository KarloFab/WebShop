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
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
        <div>
            <c:forEach items="${shoppingCart.shoppingCartProducts}" var="sc" >
                <div class="allcontain">
                    <div class="row firstrow">
                        <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12 txt1colon product " style="width:600px;">
                            <div class="featurecontant">
                                <h1>${product.name}</h1>
                                <p>"Lorem ipsum dolor sit amet, consectetur ,<br>
                                    sed do eiusmod tempor incididunt </p>
                                <h2>${product.price} &euro;</h2>
                            </div>
                        </div>
                        <c:forEach items="${product.productCategories}" var="productCategory">
                            Category: <c:out value = "${productCategory.category.name}"/><p>
                            </c:forEach>
                        </p>  
                    </div>
                </c:forEach>
            </div>
            <%@include file="partials/footer.jsp" %>
    </body>
</html>
