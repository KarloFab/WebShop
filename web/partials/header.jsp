<%-- 
    Document   : header
    Created on : 07-Apr-2019, 15:39:27
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="source/font-awesome-4.5.0/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="resources/slider.css">
        <link rel="stylesheet" type="text/css" href="resources/mystyle.css">
    </head>
    <body>
        <div class="allcontain">
            <div class="header">
                <ul class="socialicon">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                </ul>
                <ul class="store">
                    <li>Store </li>
                </ul>
                <ul class="logreg">
                    <c:choose>
                        <c:when test="${user != null}">
                            <li><a href="/WebShop/LogoutServlet">Log Out </a> </li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="/WebShop/Login">Log In |</a></li>
                            <li><a href="/WebShop/UserRegistration">Register </a> </li>
                            </c:otherwise>
                        </c:choose>
                </ul>
            </div>
            <nav class="topnavbar navbar-default topnav">
                <div class="collapse navbar-collapse" id="upmenu">
                    <ul class="nav navbar-nav" id="navbarontop">
                        <li class="active"><a href="/WebShop/Main">HOME</a></li>
                        <li class="dropdown">
                            <a href="/WebShop/Categories" class="dropdown-toggle" data-toggle="dropdown" 
                               role="button" aria-haspopup="true"
                               aria-expanded="false">CATEGORIES <span class="caret"></span></a>
                            <ul class="dropdown-menu dropdowncostume">
                                <c:forEach items="${categories}" var="c" >
                                    <li><a href="#">${c.name}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                        <li>
                            <a href="/WebShop/AddProduct">ADD PRODUCT</a>
                        </li>
                        <li>
                            <c:if test="${not empty user}" >
                                <a href="/WebShop/ShoppingHistory">Shopping History</a>
                            </c:if>
                        </li>
                        <li>
                            <c:if test="${not empty user}" >
                                <a href="/WebShop/UsersShoppingHistory">Users Shopping History</a>
                            </c:if>
                        </li>
                        <li>
                            <c:if test="${not empty user}" >
                                <a href="/WebShop/UsersLoginHistory">Users Activity History</a>
                            </c:if>
                        </li>
                    </ul>
                    <i class="fa" style="font-size:10px">                    
                        <a href="/WebShop/ShoppingCart">
                            <img src="resources/imgs/Shopping-Cart-icon.png" alt="" 
                                 style="width: 40px; height:40px;margin-top: 5px; margin-left: 70px;"/>
                        </a>
                    </i>
                    <span class='badge badge-warning' id='lblCartCount'>${shoppingCartProductsQuantitySum}</span>
                </div>
            </nav>
        </div>
    </body>
    <script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.js"></script>
    <script type="text/javascript" src="source/js/isotope.js"></script>
    <script type="text/javascript" src="source/js/myscript.js"></script> 
    <script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.1.11.js"></script>
    <script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
</html>
