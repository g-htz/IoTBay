<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>

 

<%    
    String PAYMENT_TYPE = request.getParameter("paymentmethod");
    String CARD_F_NAME = request.getParameter("cardfname");
    String CARD_L_NAME = request.getParameter("cardlname");
    String CARD_NO = request.getParameter("cardno");
    String SECURITY_CODE = request.getParameter("scode");
    String EXP_MONTH = request.getParameter("expmonth");
    String EXP_YEAR = request.getParameter("expyear");
    
    String SHIPMENT_TYPE = request.getParameter("shipping");
    String BUYER_F_NAME = request.getParameter("firstname");
    String BUYER_L_NAME = request.getParameter("lastname");
    String EMAIL_ADDRESS = request.getParameter("email");
    String DESTINATION_ADDRESS = request.getParameter("address");
    String DESTINATION_SUBURB = request.getParameter("suburb");
    String DESTINATION_STATE = request.getParameter("state");
    String DESTINATION_COUNTRY = request.getParameter("country");
    
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
%>

 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> IoTBay | Order Confirmation </title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/Style.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <style>
        .two { width : 61%; }
        .two td { text-align: center; padding: 2%;}
        .two th { text-align: center; border-bottom: 1px solid black; background-color: gainsboro; padding: 2%;}
        .two tr:hover {background-color: #f5f5f5;}
        .active { background-color: #70eeff; color: #fff; font-weight: bold; }
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
       
        <%  if (request.getParameter("paymentsent") != null) {
//            String sql1 = "select order_id from orders where order_id = (select max(order_id) from orders);";
            //int orderid = 1;  // retrieve the latest orderid from orders table
            //int customerid = 1; // session -- request.getSession().getAttribute("customer_id");
            
            int orderid = Integer.parseInt(request.getSession().getAttribute("order_id") + "");
            int customerid = Integer.parseInt(request.getSession().getAttribute("customer_id") + "");
            
           
            int p=st.executeUpdate("Insert into payment(PAYMENT_TYPE, CARD_F_NAME, CARD_L_NAME,"
                            + "CARD_NO, SECURITY_CODE, EXP_MONTH, EXP_YEAR, CUSTOMER_ID, ORDER_ID)"
                            + "values ('"+PAYMENT_TYPE+"', '"+CARD_F_NAME+"', '"+CARD_L_NAME+"', '"+CARD_NO+"', '"+SECURITY_CODE+"', "
                                        +" '"+EXP_MONTH+"', '"+EXP_YEAR+"', "+customerid+", "+orderid+")");
   
            int s=st.executeUpdate("Insert into shipment(SHIPMENT_TYPE, BUYER_F_NAME, BUYER_L_NAME, EMAIL_ADDRESS,"
                            + "DESTINATION_ADDRESS, DESTINATION_SUBURB, DESTINATION_STATE, DESTINATION_COUNTRY)"
                            + "values ('"+SHIPMENT_TYPE+"', '"+BUYER_F_NAME+"', '"+BUYER_L_NAME+"', '"+EMAIL_ADDRESS+"', '"+DESTINATION_ADDRESS+"', '"+DESTINATION_SUBURB+"', "
                                        +" '"+DESTINATION_STATE+"', '"+DESTINATION_COUNTRY+"')"); }
            else {
                String sql="Update IOTADMIN.PAYMENT set PAYMENT_TYPE=?,CARD_F_NAME=?,CARD_L_NAME=?,CARD_NO=?,SECURITY_CODE=?, EXP_MONTH=?, EXP_YEAR=? "
                    + "WHERE PAYMENT_ID=(SELECT max(PAYMENT_ID) from IOTADMIN.PAYMENT)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, PAYMENT_TYPE);
                ps.setString(2, CARD_F_NAME);
                ps.setString(3, CARD_L_NAME);
                ps.setString(4, CARD_NO);
                ps.setString(5, SECURITY_CODE);
                ps.setString(6, EXP_MONTH);
                ps.setString(7, EXP_YEAR);
                int pu = ps.executeUpdate(); } %>
       
        <div class="mb-5 pb-5" style"background-color: floralwhite;">
            <h1> Thank you for purchasing at IoTBay! </h1>
            <p style="font-size: 20px; text-align: center"> We are processing your order, here are the details: </p>
            <p style="font-size: 20px; text-align: center"> Please select the option below to finalize your payment </p>
           
            <form method="POST">
            <div style="margin-left: 400px; padding-top: 20px;">
                <table>
                    <tr> <th> Date Ordered:  </th> <td> <%=(new java.util.Date())%> </td></tr>
                   
                    <tr>
                        <th> Customer Details: </th>
                        <td> <%=BUYER_F_NAME%> <%=BUYER_L_NAME%> </td>
                        <td> <button type="submit" name="customer" formaction="updatePayment.jsp"> Update </button> </td>
                    </tr>
                   
                    <tr> <th> Email: </th> <td> <%=EMAIL_ADDRESS%> </td> </tr>
                   
                    <tr> <th> Delivery Address: </th> <td> <%=DESTINATION_ADDRESS%> <%=DESTINATION_SUBURB%> <%=DESTINATION_STATE%> <%=DESTINATION_COUNTRY%> </td> </tr>
                   
                    <tr> <th> Delivery Method: </th> <td> <%=SHIPMENT_TYPE%> </td> </tr>
                   
                    <tr>
                        <th> Payment Details:  </th>
                        <td> <%=CARD_F_NAME%> <%=CARD_L_NAME%> </td>
                        <td> <button type="submit" name="paydetails" formaction="updatePayment.jsp"> Update </button> </td>
                    </tr>
                   
                    <tr> <th> Paid with: </th> <td> <%=PAYMENT_TYPE%> </td> </tr>
                </table>
            </div>
               
                <div style="margin-left: 300px; padding-top: 10px;">
                <table class="two" style="table-layout: auto; width: 70%; ">
                <tr> <td></td> </tr>
                <tr style="text-align: center">
                    <th> Product Name </th>
                    <th> Quantity </th>
                    <th> Price_per_unit </th>
                </tr>
                <%
                    try{
                    String sql ="SELECT * FROM IOTADMIN.SHOPPINGCART";
                    ResultSet resultSet = st.executeQuery(sql);
                    while(resultSet.next()){
                %>
                <tr style="text-align: center">
                    <td> <%=resultSet.getString("PRODUCT_NAME") %> </td>
                    <td> <%=resultSet.getString("QUANTITY") %> </td>
                    <td> $ <%=resultSet.getString("PRICE_PER_UNIT") %> </td>
                </tr> <% } } catch (Exception e) { e.printStackTrace(); } %>
               
                <%
                    try{
                    String sql ="SELECT * FROM IOTADMIN.OUTCOME WHERE ORDER_ID = (SELECT MAX(ORDER_ID) FROM OUTCOME)";
                    ResultSet resultSet = st.executeQuery(sql);
                    while(resultSet.next()){
                %>
                <tr> <td/>
                    <td> Total Amount </td>
                    <td> $ <%=resultSet.getString("TOTAL_PRICE")%> </td>
                </tr> <% } con.close();} catch (Exception e) { e.printStackTrace(); } %>
               
                </table>
            </div>
           
            <div style="text-align: center">
                <button class="button" type="submit" name="delete" formaction="cancelPayment.jsp" title="Customer's purchase and payment details will be discard"> Cancel </button>
                <button class="button" type="submit" name="confirm" formaction="paid.jsp" title="Confirmed payment details cannot be further undone or update"> Confirm </button>
            </div>   
            </form>
        </div>   
    </body>
</html>