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
            <li><a class="active" href="main.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>">Home</a></li>
            <li><a href="staffProductList.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>">Products</a></li>
            <li class="dropdown">
                <a class="dropbtn">Account </a>
                <div class="dropdown-content">
                    <a href="createOrder.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>">Create Order</a>
                    <a href="myOrders.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>">Previous Orders</a>
                </div>
            </li>
            <li><a href="support.jsp">Support</a></li>
            <li class="float-right"><a href="profile.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>">My Profile</a></li>
            <li class="float-right"><a href="logout.jsp">Logout</a></li>
        </ul>

        <h1 class="ml-5">Activity on the <%=request.getParameter("admin_find_log")%></h1>
        <div class='mx-5'>
            <table>
                <tr>
                    <th class="pr-3">Date Logged In</th>
                    <th class="pr-3">Time Logged In</th>
                    <th class="pr-3">Date Logged Out</th>
                    <th class="pr-3">Time Logged Out</th>
                </tr>
                <%

            String sql ="select * from logtime where (date_login='"+request.getParameter("admin_find_log")+"' AND user_id="+request.getSession().getAttribute("staff_id")+" )";
            ResultSet resultSet = st.executeQuery(sql);
            int i=0;
            while(resultSet.next()){
            %>
                <tr class="tableColor">
                <td><%=resultSet.getString("date_login") %></td>
                <td><%=resultSet.getString("time_login") %></td>
            <%
                if(resultSet.getString("date_logout") == null)
                {
            %>   
                <td></td>
                <td></td>
            <%    
                }
                else
                {
            %>
                <td><%=resultSet.getString("date_logout") %></td>
                <td><%=resultSet.getString("time_logout") %></td>
            <%
                }
            }

            %>
                </tr>
            </table>
        </div>
        <div class='mx-5 pt-5'>
            <h4 class="float-left"><a href="viewActivity.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>">Return to activity</a></h4>
        </div>
    </body>
</html>
