<%-- 
    Document   : userLoginHistory
    Created on : 01-Sep-2019, 15:25:12
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User login histories</title>
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
    <c:forEach items="${logins}" var="login" >
        <h3>${login.user.username}</h3>
        <form action="/WebShop/UserDetails" method="get">
            <input type="submit"  value="Check user details" name="userDetails" class="btn btn-secondary"/>
            <input type="hidden" value="${login.user.iduser}" name="userId">
        </form>
        <hr>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Address</th>
                    <th scope="col">Login time </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${login.address}</td>
                    <td>${login.loginTime}</td>
                </tr>
            </tbody>
        </table>
        <hr>
    </c:forEach>
    <%@include file="partials/footer.jsp" %>
</body>
</html>
