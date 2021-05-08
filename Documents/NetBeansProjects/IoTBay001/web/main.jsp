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
<% 
    String FIRST_NAME = request.getParameter("registrationFirstNameTf");
    String LAST_NAME = request.getParameter("registrationLastNameTf");
    String EMAIL_ADDRESS = request.getParameter("registrationEmailTf");
    String PASSWORD = request.getParameter("registrationPhoneTf");
    String PHONENO = request.getParameter("registrationPhoneTf");
    String ADDRESS = request.getParameter("registrationAddressTf");
    String SUBURB = request.getParameter("registrationSuburbTf");
    String STATE = request.getParameter("registrationStateTf");
    String COUNTRY = request.getParameter("registrationCountryTf");
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    int i=st.executeUpdate("Insert into customer(FIRST_NAME, LAST_NAME,"
                            + "EMAIL_ADDRESS, PASSWORD, PHONENO, ADDRESS,"
                            + "SUBURB, STATE,COUNTRY) "
                            + "values ('"+FIRST_NAME+"', '"+LAST_NAME+"', '"+EMAIL_ADDRESS+"', '"+PASSWORD+"', "
                                        +" '"+PHONENO+"', '"+ADDRESS+"', '"+SUBURB+"',"
                                        + "'"+STATE+"', '"+COUNTRY+"')");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Dashboard</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="css/navbar.css">
    </head>
    <body>
        <ul>
            <li><a class="active" href="main.jsp">Home</a></li>
            <li><a href="#">Products</a></li>
            <li class="dropdown">
                <a class="dropbtn">Account </a>
                <div class="dropdown-content">
                    <a href="createOrder.jsp">Create Order</a>
                    <a href="viewOrders.jsp">Previous Orders</a>
                </div>
            </li>
            <li><a href="#">Support</a></li>
            <li class="float-right"><a href="profile.jsp">My Profile</a></li>
            <li class="float-right"><a href="logout.jsp">Logout</a></li>
        </ul>

        <h1>Dashboard</h1>
        <div class='mx-5'>
            <div class='card-group'>
                <div class='card mx-1'>
                    <img src="https://via.placeholder.com/150" class='card-img-top'>
                    <h4 style='text-align: center;'>Featured</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://via.placeholder.com/150" class='card-img-top'>
                    <h4 style='text-align: center;'>Browse</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://via.placeholder.com/150" class='card-img-top'>
                    <h4 style='text-align: center;'>FAQs</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://via.placeholder.com/150" class='card-img-top'>
                    <h4 style='text-align: center;'>Account</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://via.placeholder.com/150" class='card-img-top'>
                    <h4 style='text-align: center;'>Help</h4>
                </div>
            </div>
        </div>
    </body>
</html>

