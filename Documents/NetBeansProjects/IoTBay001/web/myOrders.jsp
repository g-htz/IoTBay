<%-- 
    Document   : createOrder
    Created on : 8 May 2021, 10:23:29 pm
    Author     : reaga
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
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    //int i = st.executeUpdate("Insert into orders(DATE_ORDERED, CUSTOMER_ID, ITEM_ID) values ('2008-11-11', 3, 69)");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="css/navbar.css">
    </head>
    
    <style>
        table {
            margin: 0 auto;
        }
        table, th, td {
            border: 1px solid black;
            padding: 5px 10px;
        }
    </style>
    
    <body>
        <ul>
            <li><a class="active" href="main.jsp">Home</a></li>
            <li><a href="#">Products</a></li>
            <li class="order-dropdown">
                <a class="order-btn">Orders</a>
                <div class="order-content">
                    <a href="createOrder.jsp">Create Order</a>
                    <a href="myOrders.jsp">Previous Orders</a>
                </div>
            </li>
            <li><a href="support.jsp">Support</a></li>
            <li class="float-right"><a href="profile.jsp">My Profile</a></li>
            <li class="float-right"><a href="logout.jsp">Logout</a></li>
        </ul>
        
        <h1>My Orders</h1>
        
        <table>
            <tr>
                <th>Order</th>
                <th>Date</th>
                <th>Ship To</th>
                <th>Order Total</th>
                <th>Manage</th>
            </tr>
            <%
                int customerLoggedIn = 1;
                ResultSet ordersResults = st.executeQuery("select * from orders");
                ResultSet customerResults = st2.executeQuery("select * from customer where customer_id=" + customerLoggedIn);
                
                customerResults.next();
                String customerName = customerResults.getString("first_name") + " " + customerResults.getString("last_name");
                
                while (ordersResults.next()) {
            %>
                    <tr>
                        <td><%=ordersResults.getString("order_id")%></td>
                        <td><%=ordersResults.getString("date_ordered")%></td>
                        <td>
                            <%=customerName%>
                        </td>
                        <td>
                            <%
                                String sql = "select quantity from orderlineitem where orderlineitem.item_id=" + ordersResults.getString("item_id");
                                ResultSet orderLineItemResults = st3.executeQuery(sql);
                                while (orderLineItemResults.next()) {
                            %>
                            <%="$" + new DecimalFormat("###,##0.00").format(Double.parseDouble(orderLineItemResults.getString("quantity")))%>
                            <%
                                }
                            %>
                        </td>
                        <td><a href="viewOrder.jsp?order_id=<%=ordersResults.getString("order_id")%>">View Order</a></td>
                    </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
