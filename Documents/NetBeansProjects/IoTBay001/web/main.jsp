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
    String input_FName = request.getParameter("registrationFirstNameTf");
    String input_LName = request.getParameter("registrationLastNameTf");
    String input_Email = request.getParameter("registrationEmailTf");
    String input_Phone = request.getParameter("registrationPhoneTf");
    String input_Address = request.getParameter("registrationAddressTf");
    String input_Suburb = request.getParameter("registrationSuburbTf");
    String input_State = request.getParameter("registrationStateTf");
    String input_Country = request.getParameter("registrationCountryTf");
    String input_Password = request.getParameter("registrationPasswordTf");
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
    Statement st = con.createStatement();
    int i=st.executeUpdate("Insert into customer3(registrationFirstNameTf, registrationLastNameTf,"
                            + "registrationEmailTf, registrationPhoneTf, registrationAddressTf,"
                            + "registrationSuburbTf, registrationStateTf,registrationCountryTf, "
                            + "registrationPasswordTf) "
                            + "values ('"+input_FName+"', '"+input_LName+"', '"+input_Email+"',"
                                        +" '"+input_Phone+"', '"+input_Address+"', '"+input_Suburb+"',"
                                        + "'"+input_State+"', '"+input_Country+"', '"+input_Password+"')");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Dashboard</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
            
            .logout {
                float: right;
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
            <li class="float-right"><a href="profile.jsp">My Profile</a></li>
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
