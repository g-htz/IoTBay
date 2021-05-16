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
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
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
            <li><a class="active" href="main.jsp">Home</a></li>
            <li><a href="adminProductList.jsp?staff_id=<%=request.getParameter("staff_id")%>">Products</a></li>
            <li class="dropdown">
                <a class="dropbtn">Account </a>
                <div class="dropdown-content">
                    <a href="createOrder.jsp?staff_id=<%=request.getParameter("staff_id")%>">Create Order</a>
                    <a href="myOrders.jsp?staff_id=<%=request.getParameter("staff_id")%>">Previous Orders</a>
                </div>
            </li>
            <li><a href="support.jsp">Support</a></li>
            <li class="float-right"><a href="profile.jsp?staff_id=<%=request.getParameter("staff_id")%>">My Profile</a></li>
            <li class="float-right"><a href="logout.jsp">Logout</a></li>
        </ul>

        <h1 class="ml-5">My Details</h1>
        <div class='mx-5'>
        <!--<h4>Order <%=request.getParameter("staff_id")%></h4>-->
        <table>
            <tr>
                <th class="pr-4">First Name</th>
                <th class="pr-4">Last Name</th>
                <th class="pr-4">Email Address</th>
                <th class="pr-4">Password</th>
                <th class="pr-4">Address</th>
                <th class="pr-4">Suburb</th>
                <th class="pr-4">State</th>
                <th class="pr-4">Country</th>
                <th class="pr-4">Date of Employment</th>
            </tr>
            <%
                String sqlQuery = "select * from staff "
                                + "where staff_id = " + request.getSession().getAttribute("staff_id");
                                //+ "where customer_id = " + request.getParameter("order_id");

                ResultSet res = st.executeQuery(sqlQuery);

                while (res.next()) {
                    %>
                        <tr>
                            <td><%=res.getString("first_name")%></td>
                            <td><%=res.getString("last_name")%></td>
                            <td><%=res.getString("email_address")%></td>
                            <td>********</td>
                            <td><%=res.getString("address")%></td>
                            <td><%=res.getString("suburb")%></td>
                            <td><%=res.getString("state")%></td>
                            <td><%=res.getString("country")%></td>
                            <td><%=res.getString("date_employment")%></td>
                        </tr>
                    <%
                }
            %>
        </table>
            
            </div>
        </div>
        <div class='mx-5 pt-5'>
            <h4 class="float-left pr-4"><a href="adminUpdateDetails.jsp?admin_id=<%=request.getSession().getAttribute("staff_id")%>">Update My Registration</a></h4>
            <h4 class="float-left"><a href="adminProfile.jsp?admin_id=<%=request.getSession().getAttribute("staff_id")%>">Return to profile</a></h4>
        </div>
    </body>
</html>
