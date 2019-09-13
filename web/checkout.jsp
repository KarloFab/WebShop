<%-- 
    Document   : checkout
    Created on : 28-Aug-2019, 21:58:41
    Author     : Karlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
                <div style="padding:30px;">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${shoppingCart.shoppingCartProducts}" var="sc" >
                    <tr>
                        <td>${sc.product.name}</td>
                        <td>${sc.product.price}</td>
                        <td>${sc.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <th></th>
                    <th scope="col">Price Sum</th>
                    <th scope="col">Quantity Sum</th>
                </tr>
                <tr>
                    <td></td>
                    <td>${productsPricesSum}</td>
                    <td>${shoppingCartProductsQuantitySum}</td>
                </tr>
            </tfoot>
        </table>
        <input id="price" type="hidden" value="${productsPricesSum}" />
        <h3>Pay by:</h3>
        <form action="/WebShop/CheckoutServlet" method="post" style="display: inline-block;float:left;">
            <input type="submit" value="Cash-Delivery" name="Cash-Delivery" id="cash-btn" class="btn btn-secondary">
            <input type="submit" value="PayPal"   name="PayPal" id="paypal-btn" class="btn btn-secondary" style="display:none;">
        </form>
        <div id="paypal-button-container" style='width:70px; display: inline-block; margin-left:70px;'></div>
        </div>
        <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>
        <script>
            paypal.Buttons({
                createOrder: function (data, actions) {
                    var price = (document.getElementById("price").value);
                    return actions.order.create({
                        purchase_units: [{
                                amount: {
                                    value: price
                                }
                            }]
                    });
                },
                onApprove: function (data, actions) {
                    return actions.order.capture().then(function (details) {
                        document.getElementById("paypal-btn").click();
                    });
                }
            }).render('#paypal-button-container');
        </script>
        <%@include file="partials/footer.jsp" %>    
    </body>
</html>
