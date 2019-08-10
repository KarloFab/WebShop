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
        <title>Store</title>
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
        <div class="allcontain">
            <div class="feturedsection">
                <h1 class="text-center"><span class="bdots">&bullet;</span>P R O D U C T S </span>&bullet;</h1>
            </div>
            <div class="feturedimage">
                <div class="row firstrow">
                    <div class="col-lg-12 costumcol colborder1">
                        <c:forEach items="${products}" var="p" >
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 txt1colon ">
                                <div class="featurecontant">
                                    <h1>${p.name}</h1>
                                    <p>"Lorem ipsum dolor sit amet, consectetur ,<br>
                                        sed do eiusmod tempor incididunt </p>
                                    <img src="${p.imagePath}" style="width:100px; height:100px;"/>
                                    <h2>${p.price} &euro;</h2>
                                    <a href='/WebShop/Product?productId=${p.idproduct}' style="text-align:center;width: 100px;
                                       height:30px;color:white;background-color: black;">DETAILS</a>
                                    <form action="/WebShop/ShoppingCart" method="post">
                                        <input type="submit" value="Add to shopping cart" style="text-align:center;width: 100px;
                                       height:30px;color:white;background-color: black; width:160px;">
                                        <input type="hidden" value="${p.idproduct}" name="productId">
                                    </form>  
                                    <div id="readmore">
                                        <h1>Car Name</h1>
                                        <p>"Lorem ipsum dolor sit amet, consectetur ,<br>
                                            sed do eiusmod tempor incididunt <br>"Lorem ipsum dolor sit amet, consectetur ,<br>
                                            sed do eiusmod tempor incididunt"Lorem ipsum dolor sit amet, consectetur1 ,
                                            sed do eiusmod tempor incididunt"Lorem ipsum dolor sit amet, consectetur1
                                            sed do eiusmod tempor incididunt"Lorem ipsum dolor sit amet, consectetur1<br>
                                        </p>
                                        <button id="btnRL">READ LESS</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <%@include file="partials/footer.jsp" %>
    </div>
</body>
</html>