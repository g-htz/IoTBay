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
        
        <a href="myOrders.jsp?customer_id=<%=request.getParameter("order_id")%>">Back</a>
                
        <h1>Order <%=request.getParameter("order_id")%></h1>
        
        <table>
            <tr>
                <th>Qty.</th>
                <th>Product Name</th>
                <th>Price Per Unit</th>
                <th>Total Price</th>
            </tr>
            <%    
                String sqlQuery = "select quantity, product_name, price_per_unit, (quantity * price_per_unit) as total_price from orders " + 
                                  "join orderlineitem on orderlineitem.order_id = orders.order_id " +
                                  "join product on product.product_id = orderlineitem.product_id " +
                                  "where customer_id =" + request.getSession().getAttribute("customer_id") + " " +
                                  "and orders.order_id = " + request.getParameter("order_id");

                ResultSet res = st.executeQuery(sqlQuery);

                while (res.next()) {

            %>
            <tr>
                <td><%=res.getString("quantity")%></td>
                <td><%=res.getString("product_name")%></td>
                <td><%="$" + new DecimalFormat("###,##0.00").format(Double.parseDouble(res.getString("price_per_unit")))%></td>
                <td><%="$" + new DecimalFormat("###,##0.00").format(Double.parseDouble(res.getString("total_price")))%></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
