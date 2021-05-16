<%-- 
    Document   : main
    Created on : 3 Apr 2021, 1:36:20 pm
    Author     : Reagan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<% 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Dashboard</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="css/Style.css">
        <link rel="Stylesheet" href="css/navbar.css">
    </head>
    <body style="background-color:#f2c9c9;">
        
    <!--Copy below updated navbar to your pages as often as possible please!!-->
        <div>
                    <ul>
                        <li><a href="main.jsp?customer_id=<%=request.getSession().getAttribute("customer_id")%>">Home</a></li>
                        <li><a href="customerProductList.jsp?customer_id=<%=request.getSession().getAttribute("customer_id")%>">Products</a></li>
                        <li class="order-dropdown">
                            <a class="order-btn">Orders</a>
                            <div class="order-content">
                                <a href="cart.jsp">My Cart</a>
                                <a href="myOrders.jsp?customer_id=<%=request.getSession().getAttribute("customer_id")%>">Previous Orders</a>
                            </div>
                        </li>
                        <li><a href="Support.jsp?customer_id=<%=request.getSession().getAttribute("customer_id")%>">Support</a></li>
                        <li class="float-right"><a href="logout.jsp">Logout</a></li>
                        <li class="float-right"><a class="active" href="profile.jsp?customer_id=<%=request.getSession().getAttribute("customer_id")%>">My Profile</a></li>
                    </ul>
        </div>
        
    <!--Navbar ends here!!-->

        <h1>Dashboard</h1>
        <div class='mx-5'>
            <div class='card-group'>
                <div class='card mx-1'>
                    <img src="https://images.unsplash.com/photo-1504610926078-a1611febcad3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80" class='card-img-top'>
                    <h4 style='text-align: center;'>Featured</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://images.unsplash.com/photo-1525641964647-eccdf3c13af4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80" class='card-img-top'>
                    <h4 style='text-align: center;'>Browse</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://images.unsplash.com/photo-1557318041-1ce374d55ebf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" class='card-img-top'>
                    <h4 style='text-align: center;'>FAQs</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://images.unsplash.com/photo-1572017436980-94e258a8b72d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" class='card-img-top'>
                    <h4 style='text-align: center;'>Account</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://images.unsplash.com/photo-1558687660-082f33c1492a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=539&q=80" class='card-img-top'>
                    <h4 style='text-align: center;'>Help</h4>
                </div>
            </div>
        </div>
    </body>
</html>

