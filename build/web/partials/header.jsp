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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="source/font-awesome-4.5.0/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="resources/mystyle.css">
    </head>
    <body>
        <div class="allcontain">
            <div class="header">
                <ul class="socialicon">
                    <li><a href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="http://www.instagram.com"><i class="fa fa-instagram"></i></a></li>
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
            <div style="margin:0; text-align:center;">
                <nav class="navbar-default" >
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav" style="text-align: center;" id="navbarontop">
                            <li style="display: inline-block;"><a href="/WebShop/Main">HOME</a></li>
                            <li class="dropdown" style="display: inline-block;">
                                <a class="dropdown-toggle" data-toggle="dropdown" 
                                   role="button" aria-haspopup="true"
                                   aria-expanded="false">CATEGORIES <span class="caret"></span></a>
                                <ul class="dropdown-menu dropdowncostume" aria-labelledby="dropdownMenuButton">
                                    <c:forEach items="${categories}" var="c" >
                                        <li><a href="/WebShop/Categories?category=${c.name}" class="dropdown-item">${c.name}</a></li>
                                        </c:forEach>
                                </ul>
                            </li>
                            <c:if test="${isAdmin}">
                                <li style="display: inline-block;">
                                    <a href="/WebShop/AddProduct">ADD PRODUCT</a>
                                </li>
                            </c:if>
                            <li style="display: inline-block;">
                                <c:if test="${not empty user}" >
                                    <a href="/WebShop/ShoppingHistory">Shopping History</a>
                                </c:if>
                            </li>
                            <li style="display: inline-block;">
                                <c:if test="${isAdmin}">
                                    <a href="/WebShop/UsersShoppingHistory">Users Shopping History</a>
                                </c:if>
                            </li>
                            <li style="display: inline-block;">
                                <c:if test="${isAdmin}">
                                    <a href="/WebShop/UsersLoginHistory">Users Activity History</a>
                                </c:if>
                            </li>
                        </ul>
                        <i class="fa" style="font-size:10px;float:right;">                    
                            <a href="/WebShop/ShoppingCart">
                                <img src="resources/imgs/Shopping-Cart-icon.png"
                                     style="width: 40px; height:40px;margin-top: 10px; margin-left: 30px;"/>
                            </a>
                            <span class='badge badge-warning' id='lblCartCount'>${shoppingCartProductsQuantitySum}</span>
                        </i>

                    </div>
                </nav>
            </div>
        </div>
    </body>
</html>
