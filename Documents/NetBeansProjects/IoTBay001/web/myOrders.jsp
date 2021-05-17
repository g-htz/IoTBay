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

    int customer_id = Integer.parseInt(request.getSession().getAttribute("customer_id") + "");
    System.out.println(request.getSession().getAttribute("customer_id") + "");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="css/Style.css">
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
        
        <h1>My Orders</h1>
        
        <form class="mt-4 mb-5 text-center" action="myOrders.jsp" method="POST">
            <input type="text" name="order_id" placeholder="Order Number"/>
            <input type="date" name="date_ordered"/>
            <input type="submit" value="Search"/>
        </form>
        
        <table>
            <tr>
                <th>Order</th>
                <th>Date</th>
                <th>Ship To</th>
                <th>Order Total</th>
                <th>Manage</th>
            </tr>
            <%              
                String searchCriteria = "";
                
                String order_id = request.getParameter("order_id");
                String date_ordered = request.getParameter("date_ordered");
                                
                if (order_id != null && !order_id.equals(""))
                    searchCriteria = "and orders.order_id = " + order_id;
                if (date_ordered != null && !date_ordered.equals(""))
                    searchCriteria = "and date_ordered = '" + date_ordered + "'";
                
                String sql = "select distinct orders.order_id, date_ordered, first_name, last_name, total_price from orders "
                        + "join outcome on outcome.order_id = orders.order_id "
                        + "join orderlineitem on orderlineitem.order_id = orders.order_id "
                        + "join product on product.product_id = orderlineitem.product_id "
                        + "join customer on customer.customer_id = orders.customer_id "
                        + "where customer.customer_id = " + customer_id + " " + searchCriteria + " order by orders.order_id";
                
                System.out.println(sql);
                
                ResultSet res = st.executeQuery(sql);
                
                while (res.next()) {
            %>
                    <tr>
                        <td><%=res.getString("order_id")%></td>
                        <td><%=res.getString("date_ordered")%></td>
                        <td><%=res.getString("first_name") + " " + res.getString("last_name")%></td>
                        <td>
                            <%="$" + new DecimalFormat("###,##0.00").format(Double.parseDouble(res.getString("total_price")))%>
                        </td>
                        <td><a href="viewOrder.jsp?order_id=<%=res.getString("order_id")%>">View Order</a></td>
                    </tr>
            <%
                }
            %>
        </table>
        
    </body>
</html>
