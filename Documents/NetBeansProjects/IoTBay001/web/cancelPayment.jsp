<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>


<%
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    int d=st.executeUpdate("DELETE FROM IOTADMIN.PAYMENT WHERE PAYMENT_ID=(SELECT MAX(PAYMENT_ID) FROM PAYMENT)");
    int r=st.executeUpdate("DELETE FROM IOTADMIN.SHIPMENT WHERE SHIPMENT_ID=(SELECT MAX(SHIPMENT_ID) FROM SHIPMENT)");
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/Style.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <title> IoTBay | Payment Cancelled </title>
    </head>
    
    <style>
        body {​​​​​​​background-image: url('css/background.png'); }​​​​​​​
    </style>
    
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
            
            <h1> Your Purchase and Payment has been cancelled! </h1>
            <img src="images/logo.png" alt="IoTBay Logo" class="image" width="175" height="195">
            <h2 style="text-align: center"> Select one of the option below or simple close the browser to end your session: </h2>


            <form style="text-align: center" action="customerProductList.jsp" method="POST">
                <button class="button" type="submit"> Continue Shopping </button> <br>
            </form>
        
    </body>
</html>