<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/Style.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <title> IoTBay | Payment History </title>
    </head>
    
    <style>
        .two {​​​​​​​
            width : 70%;
        }​
        .two td {​​​
            text-align: center; padding: 2%;
        }​
        .two tr:hover {​​​​​​​background-color: #f5f5f5;}​​​​​​​
        .active {​​​​​​​
              background-color: #70eeff;
              color: #fff;
              font-weight: bold; }​​​​​​​
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
        
        <h1> View your history payment </h1>
        
        <form style="text-align: center" action="viewPayment.jsp" method="POST">
            <p style="text-align: center"> Please enter the date and payment id to find your payment! </p>
            <input type="textfield" placeholder="Payment ID" name="requestedid" style="padding:10px; margin:8px 0px" required>
            <input type="textfield" placeholder="Date (MM/DD/YYYY)" name="requesteddate" style="padding:10px; margin:8px 0px" required>
            <button class="button" type="submit"> Search </button>
        </form>
        
        <div style="margin-left: 150px; padding-top: 20px;">
            <table class="two" style="table-layout: auto; width: 90%; ">
                <tr style="border-bottom: 1px solid black; background-color: gainsboro; padding: 2%;">
                    <td> Customer ID </td>
                    <td> First Name </td> 
                    <td> Last Name </td>
                    <td> Email Address </td> 
                    <td> Total Amount </td> 
                    <td> Payment ID </td> 
                    <td> Payment Type </td> 
                    <td> Date Paid </td> 
                </tr>
                <%
                    try {
                    String payid = request.getParameter("requestedid");
                    String paydate = request.getParameter("requesteddate");
                    String sql ="SELECT c.CUSTOMER_ID, c.FIRST_NAME, c.LAST_NAME, c.EMAIL_ADDRESS, i.TOTAL_AMOUNT, p.PAYMENT_ID, p.PAYMENT_TYPE, p.DATE_RECEIVED"
                    + "          FROM IOTADMIN.PAYMENT p INNER JOIN IOTADMIN.CUSTOMER c on p.CUSTOMER_ID = c.CUSTOMER_ID "
                    + "                                  INNER JOIN IOTADMIN.INVOICE i on p.INVOICE_ID = i.INVOICE_ID"
                    + "          WHERE PAYMENT_ID=" +payid+ " OR DATE_RECEIVED='" +paydate+ "'";
                    ResultSet resultSet = st.executeQuery(sql);
                    while(resultSet.next()) {
                %>
                <tr>
                    <td><%=resultSet.getString("CUSTOMER_ID") %> </td>
                    <td><%=resultSet.getString("FIRST_NAME") %></td>
                    <td><%=resultSet.getString("LAST_NAME") %></td>
                    <td><%=resultSet.getString("EMAIL_ADDRESS") %></td>
                    <td><%=resultSet.getString("TOTAL_AMOUNT") %></td>
                    <td><%=resultSet.getString("PAYMENT_ID") %></td> 
                    <td><%=resultSet.getString("PAYMENT_TYPE") %></td> 
                    <td><%=resultSet.getString("DATE_RECEIVED") %></td>
                </tr>
                <% } con.close(); } catch (Exception e) { e.printStackTrace(); }%>
            </table>
        </div> 
                
    </body>
</html>