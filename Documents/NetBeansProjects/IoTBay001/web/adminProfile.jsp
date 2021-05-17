<%-- 
    Document   : main
    Created on : 3 Apr 2021, 1:36:20 pm
    Author     : Reagan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.sql.DriverManager"%>
<a href="adminProfile.jsp"></a>
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
        <link rel="Stylesheet" href="css/Style.css">
        <link rel="Stylesheet" href="css/navbar.css">
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
        <div>
            <ul>
                <li><a class="active" href="adminProductList.jsp">Home</a></li>
                <li><a href="adminProductList.jsp">Products</a></li>
                <li class="order-dropdown">
                    </div>
                </li>
                <li class="float-right"><a href="logout.jsp">Logout</a></li>
                <li class="float-right"><a href="adminProfile.jsp">My Profile</a></li>
            </ul>
        </div>

        <h1 class="ml-5">My Profile</h1>
        <div class='mx-5'>
            <div class='card-group'>
                <div class='card card-profile mx-1'>
                    <img src="https://images.unsplash.com/photo-1517596107285-5ce3dd0f61df?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" class='card-img-top'>
                    <h4 style='text-align: center;'><a href="adminDetails.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>"/>My Employee Registration</h4>
                </div>
                <!--<div class='card card-profile mx-1'>
                    <img src="https://images.unsplash.com/photo-1619169448145-eea99df06181?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" class='card-img-top'/>
                    <h4 style='text-align: center;'><a href="viewPayment.jsp"/>View my payment details</h4>
                </div>-->
                <div class='card card-profile mx-1'>
                    <img src="https://images.unsplash.com/photo-1616759197490-d2656036df6d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80" class='card-img-top'>
                    <h4 style='text-align: center;'><a href="adminActivity.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>">My Staff Logs</h4>
                </div>
            </div>
        </div>
        <div class="mb-5 pb-5">
            <div class='mb-5 mx-5 pt-5 pb-5'>
                <div class='mb-5 mx-5 pt-5 pb-5'>
                    <h4 class="float-left mb-5 pb-5"><a href="adminCancelRegistration.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>">Cancel My Registration</a></h4>
                </div>
            </div>
        </div>
    </body>
</html>
