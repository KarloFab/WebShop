<%-- 
    Document   : main
    Created on : 07-Apr-2019, 15:23:08
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Products</title>
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
        <c:choose>
            <c:when test="${!productsFiltered.isEmpty()}">
                <div class="allcontain">
                    <div class="feturedsection">
                        <h1 class="text-center"><span class="bdots">&bullet;</span> P R O D U C T S </span>&bullet;</h1>
                    </div>
                    <hr>
                    <c:forEach items="${selectedCategories}" var="category" >
                        <div class=" col-lg-1 category-box" style="margin-left:50px; margin-bottom:20px; display:inline-block;">
                            <h5 style="display:inline-block;">${category}</h5>
                            <div style="display:inline-block;">
                                <form action="/WebShop/Categories" method="post" style="display:inline-block;">
                                    <input type="hidden" value="${category}" name="category">
                                    <input type="submit" color="black" value="x" 
                                           style="width:25px; height:25px;padding:5px;margin-left:2px; font-size:27px; text-align: center; border:none;">
                                </form>
                            </div>
                        </div>
                        <div>
                        </c:forEach>
                        <div class="row firstrow">
                            <div class="col-lg-12 costumcol colborder1">
                                <c:forEach items="${productsFiltered}" var="p" >
                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                        <div class="featurecontant">
                                            <h1>${p.name}</h1>
                                            <div class="img-hover-zoom">
                                                <img src="${p.imagePath}"/>
                                            </div>
                                            <h2 style="margin-top:4px;">${p.price} &euro;</h2>
                                            <a href='/WebShop/Product?productId=${p.idproduct}' class="btn btn-dark" style="margin-left:70px;margin-bottom:30px;">DETAILS</a>
                                            <form action="/WebShop/ShoppingCart" method="post">
                                                <input type="submit" value="Add to shopping cart" class="btn btn-white" style="width:260px;">
                                                <input type="hidden" value="${p.idproduct}" name="productId">
                                            </form>  
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h1 style="text-align:center;margin-top: 30px;">There are no products for this category.</h1>
            </c:otherwise>
        </c:choose>
        <%@include file="partials/footer.jsp" %>
    </div>
</body>
</html>