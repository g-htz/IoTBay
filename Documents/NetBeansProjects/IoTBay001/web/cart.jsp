<%-- a
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
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>

<%   
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
    String order_id = request.getSession().getAttribute("order_id") + "";
    String customer_id = request.getSession().getAttribute("customer_id") + "";
    
    System.out.println("cid: " + customer_id);
    
    // check if a new order needs to be created
    ResultSet res = st.executeQuery("select * from orders where order_id not in (select order_id from payment) and customer_id = " + customer_id);

    if (res.next() && order_id != null) {
        System.out.println("oid: " + res.getString("order_id"));
        request.getSession().setAttribute("order_id", res.getString("order_id"));
    } else {
        System.out.println("need to create an oid");

        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
        String date_ordered = date.format(new Date());

        st.executeUpdate("insert into orders (date_ordered, customer_id) values ('" + date_ordered + "', " + customer_id + ")");
        
        res = st.executeQuery("select * from orders where order_id not in (select order_id from payment) and customer_id = " + customer_id);
        res.next();
        request.getSession().setAttribute("order_id", res.getString("order_id"));
        order_id = request.getSession().getAttribute("order_id") + "";
    }

    // check if item needs to be added
    String product_id = request.getParameter("p");
    String quantity = request.getParameter("q");

    if (!order_id.equals("")) {
        if (product_id != null && quantity != null) {
            System.out.println("item needs to be added, adding: " + order_id + ", " + product_id + ", " + quantity);
            st.executeUpdate("insert into orderlineitem (order_id, product_id, quantity) values (" + order_id + ", " + product_id + ", " + quantity + ")");       

            // refresh page
            %><script>location.replace("cart.jsp")</script><%
        }

        // check if item needs to be removed
        String removeProduct = request.getParameter("rp");
        String removeQuantity = request.getParameter("rq");

        if (removeProduct != null && removeQuantity != null) {
            System.out.println("item needs to be removed");
            st.executeUpdate("delete from orderlineitem where order_id = " + order_id + " and product_id = " + removeProduct + " and quantity = " + removeQuantity);
        }
    } else {
        %><script>location.replace("cart.jsp")</script><%
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="css/navbar.css">
    </head>
    <style>
        tr {
            border-top: 1px solid #ccc;
        }
        
        td {
            padding: 5px 10px;
        }
    </style>
    <body>
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
            <li class="float-right"><a href="profile.jsp">My Profile</a></li>
            <li class="float-right"><a href="logout.jsp">Logout</a></li>
        </ul>
        
        <div class='col-md-4 my-auto' style='margin: 0 auto;'>
            <h1 class='align-middle' style='text-align: center;'>Cart</h1>
            <table>
                <%
                    if (!order_id.equals("")) {
                        
                        res = st.executeQuery("select * from shoppingcart where order_id = " + order_id);

                        if (res.isBeforeFirst()) {
                    %>
                    <tr style="text-align: center">
                        <th>Quantity</th>
                        <th>Product Name</th>
                        <th></th>
                        <th>Price</th>
                        <th></th>
                    </tr>
                    <%
                        }

                        int rows = 0;   

                        while (res.next()) {
                            rows++;
                        %>
                        <tr>
                            <td style="width: 5%"><%=res.getString("quantity")%></td>
                            <td style="width: 90%"><%=res.getString("product_name")%></td>
                            <td>$</td>
                            <td style="text-align: right"><%=new DecimalFormat("###,##0.00").format(Double.parseDouble(res.getString("price_per_unit")) * 
                                                                                                    Double.parseDouble(res.getString("quantity")))%></td>
                            <td><a href="cart.jsp?rp=<%=res.getString("product_id")%>&rq=<%=res.getString("quantity")%>">Remove</a></td>
                        </tr>
                        <%
                        }

                        if (rows == 0) {
                        %>
                            <h5 style="text-align: center">Cart is empty...</h5>
                            <h5 style="text-align: center"><a href="customerProductList.jsp">Click here</a> to check our catalogue!</h5>
                        <%
                        }
                    }
                    %>
            </table>
            <form action="createOrder.jsp" method="POST">
                <div class="mt-2 mr-2" style="text-align: right">
                    <input type="submit" class="btn btn-default bg-primary text-white mr-2" value="Buy Now"/>
                    <a class="btn btn-default bg-light" style="color: #000" href="customerProductList.jsp">Continue Shopping</a>
                </div>                        
            </form>
        </div>
    </body>
</html>
