<%-- 
    Document   : product
    Created on : 07-Apr-2019, 16:07:46
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@include file="/partials/header.jsp" %>
        <div class="allcontain">
            <div class="row firstrow">
                <div class="col-xs-12 col-sm-6 col-md-12 col-lg-12 txt1colon product " style="width:900px;">
                    <div class="featurecontant">
                        <h1>${product.name}</h1>
                        <p>"Lorem ipsum dolor sit amet, consectetur ,<br>
                            sed do eiusmod tempor incididunt </p>
                        <h2>${product.price} &euro;</h2>
                        <form action="/WebShop/DeleteProduct" method="post">
                            <input type="hidden" value="${product.idproduct}" name="productId">
                            <input type="submit" value="Delete product">
                        </form> 
                        <form action="/WebShop/UpdateProduct" method="post">
                            <input type="hidden" value="${product.idproduct}" name="productId">
                            <input type="submit" value="Update product">
                        </form>
                    </div>
                </div>
                <c:forEach items="${product.productCategories}" var="productCategory">
                    Category: <c:out value = "${productCategory.category.name}"/><p>
                    </c:forEach>
                </p>  
            </div>
            <%@include file="/partials/footer.jsp" %>
        </div>
    </body>
</html>
