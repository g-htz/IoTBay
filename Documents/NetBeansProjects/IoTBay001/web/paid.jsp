<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.getSession().removeAttribute("order_id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> IoTBay | Product Purchased </title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="css/Style.css">
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div>
            <ul>
                <li><a class="active" href="main.jsp">Home</a></li>
                <li><a href="customerProductList.jsp">Products</a></li>
                <li class="order-dropdown">
                    <a class="order-btn">Orders</a>
                    <div class="order-content">
                        <a href="cart.jsp">My Cart</a>
                        <a href="myOrders.jsp">Previous Orders</a>
                    </div>
                </li>
                <li><a href="support.jsp">Support</a></li>
                <li class="float-right"><a href="logout.jsp">Logout</a></li>
                <li class="float-right"><a href="profile.jsp">My Profile</a></li>
            </ul>
        </div>
        
        <div>
            <h1> Thank you for shopping with us! </h1>
            <img src="images/logo.png" alt="IoTBay Logo" class="image" width="180" height="200">
            <h2 style="text-align: center"> Your order has been submitted, an email will be sent when the package has started shipping </h2>
        
            <h2 style="text-align: center"> Continue shopping or simple logout/close the browser to end your session: </h2>
            <form style="text-align: center" action="customerProductList.jsp" method="POST">
                <button class="button" type="submit"> Continue Shopping </button> <br>
            </form>
        </div>
        
    </body>
</html>