<%-- 
    Document   : userDetails
    Created on : 02-Sep-2019, 20:04:59
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Details</title>
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <div id="userDetails" style="margin-left:100px;">
            <h3>Username: ${user.username}</h3>
            <hr>
            <h4>Email address: ${user.emailAdress}</h4>
            <hr>
            <h4>First name: ${user.firstName}</h4>
            <hr>
            <h4>Last name: ${user.lastName}</h4>
            <hr>
            <h4>Address: ${user.address}</h4>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Roles
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <c:forEach var="userRole" items="${user.userRoles}">
                        <a class="dropdown-item" href="#">${userRole.role.name}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%@include file="partials/footer.jsp" %>
    </body>
</html>
