<%-- 
    Document   : addProduct
    Created on : 06-May-2019, 19:34:09
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Add product</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@include file="/partials/header.jsp" %>
        <h1>Add product</h1>
        <div class="row firstrow">
            <form action="/WebShop/AddProduct" method="post">
                <p>Name</p>
                <input type="text" name="name">
                <p>Description</p>
                <input type="text" name="description">
                <p>Price</p>
                <input type="text" name="price">
                <p>Code</p>
                <input type="text" name="code">
                <input type="submit" value="Add product" class="btn btn-secondary">
            </form>  
        </div>
        <%@include file="/partials/footer.jsp" %>
    </body>
</html>
