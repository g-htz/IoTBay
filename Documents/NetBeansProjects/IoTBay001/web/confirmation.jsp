<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
    int p=st.executeUpdate("Insert into payment(PAYMENT_TYPE, CARD_F_NAME, CARD_L_NAME,"
                            + "CARD_NO, SECURITY_CODE, EXP_MONTH, EXP_YEAR)"
                            + "values ('"+PAYMENT_TYPE+"', '"+CARD_F_NAME+"', '"+CARD_L_NAME+"', '"+CARD_NO+"', '"+SECURITY_CODE+"', "
                                        +" '"+EXP_MONTH+"', '"+EXP_YEAR+"')");
    
    int s=st.executeUpdate("Insert into shipment(SHIPMENT_TYPE, BUYER_F_NAME, BUYER_L_NAME, EMAIL_ADDRESS,"
                            + "DESTINATION_ADDRESS, DESTINATION_SUBURB, DESTINATION_STATE, DESTINATION_COUNTRY)"
                            + "values ('"+SHIPMENT_TYPE+"', '"+BUYER_F_NAME+"', '"+BUYER_L_NAME+"', '"+EMAIL_ADDRESS+"', '"+DESTINATION_ADDRESS+"', '"+DESTINATION_SUBURB+"', "
                                        +" '"+DESTINATION_STATE+"', '"+DESTINATION_COUNTRY+"')");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> IoTBay | Order Confirmation </title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet"/>
    </head>
    
    <body>
        <div class="navbar" style="padding-bottom: 60px">
            <ul>
                <li><a href="main.jsp"> Home </a></li>
                <li><a href="shopping.jsp"> Browse </a></li>
                <li><a href="#"> Account </a></li>
                <li><a href="support.jsp"> Support </a></li>
                <li class="float-right"><a href="logout.jsp">Logout</a></li>
                <li class="float-right"><a href="profile.jsp">My Profile</a></li>
            </ul>
        </div>
        
        <div style="height: 1000px; background-color: floralwhite;">
            <h1> Thank you for purchasing at IoTBay! </h1> 
            
            <p style="font-size: 20px; text-align: center"> We are processing your order, here are the details: </p>
            <p style="font-size: 20px; text-align: center"> Please select the option below to finalize your payment </p>
            
            <form method="POST">
            <div style="margin-left: 350px; padding-top: 20px;">
                <table>                
                
                <tr>
                    <td> Date Ordered </td>
                    <td>  <%= (new java.util.Date())%> </td>
                </tr>
                
                <tr>
                    <td> Customer Name </td>
                    <td> <%=BUYER_F_NAME%> <%=BUYER_L_NAME%> </td>
                </tr>
                
                <tr>
                    <td> Email Address </td>
                    <td> <%=EMAIL_ADDRESS%> </td>
                </tr>
                
                <tr>
                    <td> Delivery Method </td>
                    <td> <%=SHIPMENT_TYPE%> </td>
                </tr>
                
                <tr>
                    <td> Delivery Address </td>
                    <td> <%=DESTINATION_ADDRESS%> <%=DESTINATION_SUBURB%> <%=DESTINATION_STATE%> <%=DESTINATION_COUNTRY%> </td>
                </tr>
                                
                <tr> <td> Paid with: <%=PAYMENT_TYPE%> </td></tr>
                
                <tr>
                    <td> Products Summary: </td>
                    
                </tr>
                </table>
                
                <button class="button" type="submit" formaction="updatePayment.jsp" title="Customer enable to update their payment details"> Update </button>
                <button class="button" type="submit" formaction="cancelPayment.jsp" title="Customer's purchase and payment details will be discard"> Cancel </button>
                <button class="button" type="submit" formaction="paid.jsp" title="Confirmed payment details cannot be further undone or update"> Confirm </button>
            </div>       
            </form>
            </div>    
    </body>
    
    <div class="footer">
            <p> @Copyright 2021 - ISD Group 16 </p>
            <p> George Hetrelezis, Misty Duong, Reagan Brasch, Catherine Pe Benito </p>
        </div>
</html>

confirmation page