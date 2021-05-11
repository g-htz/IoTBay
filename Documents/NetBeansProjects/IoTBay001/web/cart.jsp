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
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>

<%   
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
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
                    //response.addCookie(new Cookie("products", "1 1, 2 4, 3 2, 4 5"));
                    
                    boolean needsRefresh = false;
                    
                    Cookie cookie = null;
                    for (Cookie c : request.getCookies()) {
                        if (c.getName().equals("products") && c.getValue().length() > 0) {
                            cookie = c;
                            break;
                        }
                    }

                    if (request.getParameter("r") != null && cookie != null) {
                        if (cookie.getValue().length() > 1) {
                            String[] s = cookie.getValue().split(",");
                            String newCookie = "";
                        
                            for (String sub : s) {
                                if (sub.trim().split("\\s+")[0].equals(request.getParameter("r")))
                                    continue;
                                else
                                    newCookie += sub + ", ";
                            }

                            newCookie = newCookie.trim();

                            cookie.setMaxAge(0);
                            cookie.setPath("/");
                            response.addCookie(cookie);

                            Cookie updatedCookie = new Cookie("products", newCookie);
                            response.addCookie(updatedCookie);

                            cookie = null;
                            for (Cookie c : request.getCookies()) {
                                if (c.getName().equals("products") && c.getValue().length() > 0) {
                                    cookie = c;
                                    break;
                                }
                            }
                            
                            needsRefresh = true;
                        }
                    }
                    
                    if (needsRefresh) {
                    %>
                        <script>
                            window.location.replace("cart.jsp");
                        </script>
                    <%
                    }

                    if (cookie != null) {
                        int i = 0;
                        String[] quantity = new String[cookie.getValue().split(",").length];
                        String products = "";
                        
                        double total = 0.0;
                        
                        for (String s : cookie.getValue().split(",")) {
                            String[] s2 = s.trim().split("\\s+");
                            
                            products += s2[0] + ", ";
                            quantity[i++] = s2[1];
                        }
                        
                        products = products.substring(0, products.length()-2);
                        
                        int quantityCounter = 0;
                        
                        ResultSet res = st.executeQuery("select * from product where product_id in (" + products + ")");
                        
                        while (res.next()) {
                            total += Double.parseDouble(res.getString("price_per_unit")) * Double.parseDouble(quantity[quantityCounter]);
                %>
                <tr>
                    <td style="width: 5%"><%=quantity[quantityCounter]%></td>
                    <td style="width: 90%"><%=res.getString("name")%></td>
                    <td>$</td>
                    <td style="text-align: right"><%=new DecimalFormat("###,##0.00").format(Double.parseDouble(res.getString("price_per_unit")) * 
                                                                                            Double.parseDouble(quantity[quantityCounter]))%></td>
                    <td><a href="cart.jsp?r=<%=res.getString("product_id")%>">Remove</a></td>
                </tr>
                <%
                            quantityCounter++;
                        }
                %>
                <tr>
                    <td></td>
                    <td style="text-align: right; padding: 0 15px 0 0;"><b>Total:</b></td>
                    <td><b>$</b></td>
                    <td><b><%=new DecimalFormat("###,##0.00").format(total)%></b></td>
                    <td></td>
                </tr>
            </table>
            <form action="createOrder.jsp" method="POST">
                <div class="mt-2 mr-2" style="text-align: right">
                    <input type="hidden" name="products" value="<%=products%>"/>
                    <!--Change the array tostring method to not include brackets-->
                    <input type="hidden" name="quantity" value="<%=Arrays.toString(quantity)%>"/>
                    <input type="submit" class="btn btn-default bg-primary text-white mr-2" value="Buy Now"/>
                    <a class="btn btn-default bg-light" style="color: #000" href="products.jsp">Continue Shopping</a>
                </div>                        
            </form>
            <%
                } else {
            %>
            <h5 style="text-align: center">Cart is empty...</h5>
            <h5 style="text-align: center"><a href="products.jsp">Click here</a> to check our catalogue!</h5>
            <%
                }
            %>
        </div>
    </body>
</html>
