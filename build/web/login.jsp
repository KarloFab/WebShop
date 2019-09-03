<%-- 
    Document   : login
    Created on : 07-Apr-2019, 15:05:09
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="resources/login.css" rel="stylesheet" type="text/css"/>

<div class="wrapper fadeInDown">
    <div id="formContent">
        <div class="fadeIn first">
        </div>
        <form action="Login" method="post">
            <input type="text" id="login" class="fadeIn second" name="username" placeholder="Username">
            <input type="text" id="password" class="fadeIn third" name="password" placeholder="Password">
            <input type="submit" class="fadeIn fourth" value="Log In">
        </form>
        <p>${message}</p>
        <div id="formFooter">
            <a class="forgotPassword" href="/WebShop/UserRegistration">Register</a>
            <br/>
        </div>

    </div>
</div>