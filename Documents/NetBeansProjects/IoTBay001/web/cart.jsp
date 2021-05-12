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
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>

<%   
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    
    int customerLoggedIn = 2;
    
    String order_id = "";
    for (Cookie c : request.getCookies()) {
        if (c.getName().equals("order_id") && c.getValue().length() > 0) {
            order_id = c.getValue();
            break;
        }
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
        
        <div class='col-md-4 my-auto' style='margin: 0 auto;'>
            <h1 class='align-middle' style='text-align: center;'>Cart</h1>
            <table>
                
                <%
                    if (request.getParameter("ro") != null && request.getParameter("rp") != null && request.getParameter("rq") != null) {
                        int i = st.executeUpdate("delete from orderlineitem where order_id = " + request.getParameter("ro") + 
                                                 " and product_id = " + request.getParameter("rp") + 
                                                 " and quantity = " + request.getParameter("rq"));
                    }
                    
                    if (request.getParameter("p") != null && request.getParameter("q") != null) {
                        Cookie cookie = null;
                        for (Cookie c : request.getCookies()) {
                            if (c.getName().equals("cart") && c.getValue().length() > 0) {
                                cookie = c;
                                break;
                            }
                        }
                        
                        if (cookie != null) {
                            String newCookie = cookie.getValue();
                            
                            cookie.setMaxAge(0);
                            cookie.setPath("/");
                            response.addCookie(cookie);

                            response.addCookie(new Cookie("cart", cookie.getValue() + " " + request.getParameter("p")));
                            
                        } else {
                            response.addCookie(new Cookie("cart", request.getParameter("p")));
                            
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                            String formattedDate = df.format(new Date());
                            
                            int i = st.executeUpdate("insert into orders (date_ordered, customer_id) " +
                                                     "values ('" + formattedDate + "', " + request.getSession().getAttribute("customer_id") + ")");
                            
                            ResultSet res = st.executeQuery("select * from orders where customer_id = " + request.getSession().getAttribute("customer_id")
                                                          + " order by date_ordered DESC fetch first 1 rows only");
                            res.next();
                            response.addCookie(new Cookie("order_id", res.getString("order_id")));
                        }
                        
                        ResultSet res = st.executeQuery("select * from product where product_id = " + request.getParameter("p"));
                        res.next();
                        
                        int i = st.executeUpdate("insert into orderlineitem (order_id, product_id, quantity) " +
                                                 "values (" + order_id + ", " + request.getParameter("p") + ", " + request.getParameter("q") + ")");
                    }

                    ResultSet res = st.executeQuery("SELECT * FROM ORDERLINEITEM join product on product.product_id = orderlineitem.product_id where order_id = " + order_id);

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
                        <td><a href="cart.jsp?ro=<%=res.getString("order_id")%>&rp=<%=res.getString("product_id")%>&rq=<%=res.getString("quantity")%>">Remove</a></td>
                    </tr>
                    <%
                    }

                    if (rows == 0) {
                    %>
                        <h5 style="text-align: center">Cart is empty...</h5>
                        <h5 style="text-align: center"><a href="products.jsp">Click here</a> to check our catalogue!</h5>
                    <%
                    }
                    %>
            </table>
            <form action="createOrder.jsp" method="POST">
                <div class="mt-2 mr-2" style="text-align: right">
                    <input type="submit" class="btn btn-default bg-primary text-white mr-2" value="Buy Now"/>
                    <a class="btn btn-default bg-light" style="color: #000" href="products.jsp">Continue Shopping</a>
                </div>                        
            </form>
        </div>
    </body>
</html>
