<%-- 
    Document   : userRegistration
    Created on : 14-May-2019, 21:51:33
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <%@include file="/partials/header.jsp" %>
        <form action="/WebShop/UserRegistration" method="post">
            <p>Name</p>
            <input type="text" name="name">
            <p>Surname</p>
            <input type="text" name="surname">
            <p>Address</p>
            <input type="text" name="address">
            <p>Username</p>
            <input type="text" name="username">
            <p>Password</p>
            <input type="password" name="password">
            <p>Email</p>
            <input type="text" name="email">
            <input type="submit" value="Register">
        </form> 
        <%@include file="/partials/footer.jsp" %>
    </body>
</html>
