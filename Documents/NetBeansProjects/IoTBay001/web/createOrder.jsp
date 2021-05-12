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
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    
    String order_id = "";
    for (Cookie c : request.getCookies()) {
        if (c.getName().equals("order_id") && c.getValue().length() > 0) {
            order_id = c.getValue();
            break;
        }
    }
    
    ResultSet res;
    
    if (!order_id.equals("")) {
        int i = st.executeUpdate("delete from orders where order_id not in (select distinct order_id from orderlineitem) "
                               + "and customer_id = " + request.getSession().getAttribute("customer_id"));
    
        String sql = "select orders.order_id, sum((quantity * price_per_unit)) as total from orders " +
                     "join orderlineitem on orderlineitem.order_id = orders.order_id " +
                     "join product on product.product_id = orderlineitem.product_id " +
                     "where customer_id = " + request.getSession().getAttribute("customer_id") + 
                     " and orders.order_id = " + order_id + " group by orders.order_id";
        res = st.executeQuery(sql);
    
        res.next();
    
        i = st.executeUpdate("insert into invoice (total_amount, order_id) values (" + res.getString("total") + ", " + order_id + ")");

        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("order_id")) {
                cookie.setMaxAge(0);
                cookie.setPath("/");

                response.addCookie(cookie);
                response.addCookie(new Cookie("order_id", ""));
            }

            if (cookie.getName().equals("cart")) {
                cookie.setMaxAge(0);
                cookie.setPath("/");

                response.addCookie(cookie);
                response.addCookie(new Cookie("cart", ""));
            }
        }
    }
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
            <li><a href="products.jsp">Products</a></li>
            <li class="order-dropdown">
                <a class="order-btn">Orders</a>
                <div class="order-content">
                    <a href="cart.jsp">My Cart</a>
                    <a href="myOrders.jsp">Previous Orders</a>
                </div>
            </li>
            <li><a href="support.jsp">Support</a></li>
            <li class="float-right"><a href="profile.jsp">My Profile</a></li>
            <li class="float-right"><a href="logout.jsp">Logout</a></li>
        </ul>
        <%
            if (!order_id.equals("")) {
        %>
            <h1>Order Has Been Placed</h1>    
            <h2>Invoice</h2>
            <%
                res = st.executeQuery("select * from invoice where order_id = " + order_id);

                if (res.next()) {
            %>
            <table>
                <tr>
                    <th>Invoice Number</th>
                    <th>Total Cost</th>
                    <th>Order Number</th>
                </tr>
                <tr>
                    <td><%=res.getString("invoice_id")%></td>
                    <td><%=res.getString("total_amount")%></td>
                    <td><%=res.getString("order_id")%></td>
                </tr>
            </table>
            <%
                }
            } else {
            %>
            <h1>No orders are created</h1>
            <%
            }
            %>
    </body>
</html>