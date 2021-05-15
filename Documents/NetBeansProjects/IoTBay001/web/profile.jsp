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
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Dashboard</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            body {margin:0;}

            ul {
              list-style-type: none;
              margin: 0;
              padding: 0 15%;
              overflow: hidden;
              background-color: #f5f5f5;
              /* position: fixed; */
              top: 0;
              width: 100%;
            }

            li {
              float: left;
              
            }

            li a {
              display: block;
              color: #000;
              text-align: center;
              padding: 14px 16px;
              text-decoration: none;
              font-size: 2rem;
            }

            li a:hover:not(.active) {
              background-color: #70eeff;
            }

            .active {
              background-color: #70eeff;
              color: #fff;
              font-weight: bold;
            }
            
            .float-left {
                float: right;
            }
            .float-right {
                float: right;
            }
            
            .card-profile {
                max-width: 25%;
            }
        </style>
    </head>
    <body>
        <ul>
            <li><a class="active" href="main.jsp?customer_id=<%=request.getParameter("customer_id")%>">Home</a></li>
            <li><a href="customerProductList.jsp?customer_id=<%=request.getParameter("customer_id")%>">Products</a></li>
            <li class="dropdown">
                <a class="dropbtn">Account </a>
                <div class="dropdown-content">
                    <a href="createOrder.jsp?customer_id=<%=request.getParameter("customer_id")%>">Create Order</a>
                    <a href="myOrders.jsp?customer_id=<%=request.getParameter("customer_id")%>">Previous Orders</a>
                </div>
            </li>
            <li><a href="support.jsp">Support</a></li>
            <li class="float-right"><a href="profile.jsp?customer_id=<%=request.getParameter("customer_id")%>">My Profile</a></li>
            <li class="float-right"><a href="logout.jsp">Logout</a></li>
        </ul>

        <h1 class="ml-5">My Profile</h1>
        <div class='mx-5'>
            <div class='card-group'>
                <div class='card card-profile mx-1'>
                    <img src="https://images.unsplash.com/photo-1517596107285-5ce3dd0f61df?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" class='card-img-top'>
                    <h4 style='text-align: center;'><a href="viewDetails.jsp"/>View my registration details</h4>
                </div>
                <div class='card card-profile mx-1'>
                    <img src="https://images.unsplash.com/photo-1616759197490-d2656036df6d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80" class='card-img-top'>
                    <h4 style='text-align: center;'><a href="viewActivity.jsp"/>View my activity</h4>
                </div>
                <div class='card card-profile mx-1'>
                    <img src="images/viewpayment.jpeg" class='card-img-top'/>
                    <h4 style='text-align: center;'><a href="viewPayment.jsp"/>View my payment details</h4>
                </div>
                <div class='card card-profile mx-1'>
                    <img src="https://images.unsplash.com/photo-1616759197490-d2656036df6d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80" class='card-img-top'>
                    <h4 style='text-align: center;'><a href="viewActivity.jsp?customer_id=<%=request.getParameter("customer_id")%>">View my activity</h4>
                </div>
            </div>
        </div>
        <div class='mx-5 pt-5'>
            <h4 class="float-left"><a href="cancelRegistration.jsp?customer_id=<%=request.getParameter("customer_id")%>">Cancel My Registration</a></h4>
        </div>
        <div class="footer">
            <p> @Copyright 2021 - ISD Group 16 </p>
            <p> George Hetrelezis, Misty Duong, Reagan Brasch, Catherine Pe Benito </p>
        </div>
    </body>
</html>
