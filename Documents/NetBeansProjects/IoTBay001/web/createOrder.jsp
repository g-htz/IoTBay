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
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    
    String order_id = request.getSession().getAttribute("order_id") + "";
    String customer_id = request.getSession().getAttribute("customer_id") + "";
    
    String placedOrder = request.getSession().getAttribute("placedOrder") + "";
    
    if (placedOrder.equals("null")) {
        ResultSet res = st1.executeQuery("select distinct product_id from orderlineitem where order_id = " + order_id);
    
        while (res.next()) {
            String product_id = res.getString("product_id");
            System.out.println("pid: " + product_id);
            String updateQuantitySql = "update product "
                                      + "set total_quantity = total_quantity - (select count(*) as total "
                                                                              + "from orderlineitem "
                                                                              + "where order_id = " + order_id 
                                                                              + " and product_id = " + product_id + ") "
                                      + "where product_id = " + product_id;

            System.out.println(updateQuantitySql);
            st2.executeUpdate(updateQuantitySql);
        }
        
        request.getSession().setAttribute("placedOrder", "true");
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
        <link rel="Stylesheet" href="css/style.css">
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
            if (order_id != null) {
        %>
                <h1 class="mb-4">Order <%=order_id%> Has Been Placed!</h1>
                <h4 class="mb-4 w-25 mx-auto" style="text-align: center">Click the button below to pay for the order to get it shipped as soon as possible.</h4>
                
                <form action="payment.jsp" style="text-align: center">
                    <input class="btn btn-default bg-primary text-white" type="submit" value="Pay Now"/>
                    <a class="btn btn-default bg-light" href="cancelOrder.jsp">Cancel Order</a>
                </form>
                
                <h4 class="mt-5 text-center">Order Summary</h4>
                <table>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Product Type</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                <%
                    String sql = "select quantity, product.product_id, product_name, price_per_unit, product_type, (quantity * price_per_unit) as total_price from orders " + 
                                 "join orderlineitem on orderlineitem.order_id = orders.order_id " +
                                 "join product on product.product_id = orderlineitem.product_id " +
                                 "where customer_id =" + customer_id + " " +
                                 "and orders.order_id = " + order_id;
                    
                    ResultSet res = st1.executeQuery(sql);
                    
                    while (res.next()) {
                %>
                    <tr>
                        <td><%=res.getString("product_id")%></td>
                        <td><%=res.getString("product_name")%></td>
                        <td><%=res.getString("product_type")%></td>
                        <td><%=res.getString("quantity")%></td>
                        <td><%="$" + new DecimalFormat("###,##0.00").format(Double.parseDouble(res.getString("price_per_unit")))%></td>
                        <td><%="$" + new DecimalFormat("###,##0.00").format(Double.parseDouble(res.getString("total_price")))%></td>
                    </tr>
                <%
                    }

                    res = st1.executeQuery("select * from outcome where order_id = " + order_id);
                    res.next();
                %>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><b><%="$" + new DecimalFormat("###,##0.00").format(Double.parseDouble(res.getString("total_price")))%></b></td>
                    </tr>
                </table>
        <%
            } else {
        %>
                <h1>No orders are created</h1>
                
                <h4 class="text-center"><a href="customerProductList.jsp">Click here</a> to have a look at our catalogue!</h4>
        <%
            }
        %>
    </body>
</html>