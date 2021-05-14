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
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%   
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
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
            
            .float-right {
                float: right;
            }
            
            .d-flex {
                display: flex;
            }
        </style>
    </head>
    <body>
        <ul>
            <li><a class="active" href="#">Home</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Account</a></li>
            <li><a href="#">Support</a></li>
            <li class="float-right"><a href="logout.jsp">Logout</a></li>
            <li class="float-right"><a href="profile.jsp?customer_id=${param.customer_id}">My Profile</a></li>
        </ul>

        <h1>Cancel Registration</h1>
        <div class='mx-5'>
            <h2>Please enter your password if you want to cancel your registration</h2>
            <form action="logoutDelete.jsp" method="POST">
                <div class="form-group">
                        <input class="form-control" type="password" name="registrationPasswordTf" placeholder="Password" required/>
                    </div>
                <h3>I'd like to cancel my registration</h4>
                <div class="form-group">
                    <input class="btn btn-default" type="submit" value="Yes" name="registrationBtn" />
                         <%
                             //int value = ${param.customer_id};
                             int value = Integer.valueOf(request.getParameter("customer_id"));
                             String sqlQuery = "delete from iotadmin.customer " + "where customer_id=" + value;
//                                            + "where customer_id = " + request.getParameter("customer_id");

                           st.executeUpdate(sqlQuery);
//                           ResultSet res = st.executeQuery();

                        %>
                </div>
                   
            </form>
            <div>
                <h5 class="float-left"><a class="btn btn-default" href="main.jsp"  type="submit">No</a></h5>
            </div>
        </div>
    </body>
</html>
