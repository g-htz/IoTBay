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
         
        <h1 class="ml-5">My Activity</h1>
        <div class='mx-5'>
            <form class="form-inline" method="post" action="viewActivitySearch.jsp">
                <table class="center" border="0">
                    <tr class="d-flex"> 
                        <td><input class="form-control w-100" type="text" name="search_activity" placeholder="Filter by date (yyyy-mm-dd)">
                        <button class="mt-3 w-100 btn btn-primary" type="submit" name="btn_activity">Search</button></td>
                    </tr>
                </table>
            </form>
                <table>
                    <tr>
                        <th class="pr-3">Date Logged In</th>
                        <th class="pr-3">Time Logged In</th>
                        <th class="pr-3">Date Logged Out</th>
                        <th class="pr-3">Time Logged Out</th>
                    </tr>
                <%
                    String sqlQuery = "select * from logtime "
                                    + "where user_id = " + request.getSession().getAttribute("customer_id");
                                    //+ "where customer_id = " + request.getParameter("order_id");

                    ResultSet res = st.executeQuery(sqlQuery);

                    while (res.next()) {
                        %>
                            
                            <tr>
                                <td><%=res.getString("date_login")%></td>
                                <td><%=res.getString("time_login")%></td>
                        <%
                            if(res.getString("date_logout") == null)
                            {
                        %>        
                                <td></td>
                                <td></td>
                        <%    
                            }
                            else
                            {
                        %>
                                <td><%=res.getString("date_logout")%></td>
                                <td><%=res.getString("time_logout")%></td>
                        <%    
                            }
                        %>        
                                
                            </tr>
                        <%
                    }
                %>
            </table>
        </div>
        <div class='mx-5 pt-5'>
            <h4 class="float-left"><a href="profile.jsp?customer_id=<%=request.getSession().getAttribute("customer_id")%>">Return to profile</a></h4>
        </div>
    </body>
</html>
