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
        <%@include file="partials/header.jsp" %>
        <div class="" style="margin-top:40px;">
            <div style="display:inline-block;margin-left:50px;">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-12 product" style="width:550px;height:500px;padding:0px;" >
                    <div class="featurecontant" style='margin:0px;'>
                        <img src="${product.imagePath}" style="width:465px; height:500px;"/>
                    </div>
                </div>
            </div>
            <div style='display:inline-block;'>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-12">
                    <div style='margin:0px;width:500px;height:500px;padding:0px;'>
                        <h1>${product.name}</h1>
                        <hr>
                        <p> <b>Description: </b>${product.description}</p>
                        </h2>
                        <hr>
                        <c:forEach items="${product.productCategories}" var="productCategory">
                            <p><b> Category: </b><c:out value = "${productCategory.category.name}"/><p>
                            </c:forEach>
                        <hr>
                        <h3><b>${product.price} &euro;</b></h3>
                        <form action="/ShoppingCart" method="post" style="margin-top:40px;">
                            <input type="submit" value="Add to shopping cart" class="btn btn-white" style="width:260px;">
                            <input type="hidden" value="${product.idproduct}" name="productId">
                        </form>  
                        <c:if test="${isAdmin}">
                            <form action="/DeleteProduct" method="post">
                                <input type="hidden" value="${product.idproduct}" name="productId">
                                <input type="submit" value="Delete product">
                            </form> 
                            <form action="/UpdateProduct" method="post">
                                <input type="hidden" value="${product.idproduct}" name="productId">
                                <input type="submit" value="Update product">
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="partials/footer.jsp" %>
    </div>
</body>
</html>
