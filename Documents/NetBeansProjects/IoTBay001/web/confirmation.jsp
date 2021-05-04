[6:27 pm] My Duong
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> IoTBay | Order Confirmation </title>
        <link href="Style.css" rel="stylesheet" type="text/css"/>
    </head>
   
    <%
        String payment = request.getParameter("paymentmethod");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String shipping = request.getParameter("shipping");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postcode = request.getParameter("postcode");
    %>
   
    <body>
        <header style="padding-bottom: 20px">
        <div class="navbar">
            <ul>
                <li><a href="Main.jsp"> Home </a></li>
                <li><a href="Shopping.jsp"> Browse </a></li>
                <li><a href="#"> Account </a></li>
                <li><a href="Support.jsp"> Support </a></li>
                <li><a href="Logout.jsp"> Logout </a></li>
            </ul>
        </div>
        </header>
       
        <div style="height: 1000px; background-color: floralwhite;">
            <h1> Thank you for purchasing at IoTBay! </h1>
            <p style="font-size: 20px; text-align: center"> We are processing your order, here are the details: </p>
           
            <div style="margin-left: 350px; padding-top: 20px;">
                <table>
                <tr>
                    <td> Customer Name </td>
                    <td> <%=firstname%> <%=lastname%> </td>
                </tr>
               
                <tr>
                    <td> Email Address </td>
                    <td> <%=email%> </td>
                </tr>
               
                <tr>
                    <td> Delivery Method </td>
                    <td> <%=shipping%> </td>
                </tr>
               
                <tr>
                    <td> Delivery Address </td>
                    <td> <%=address%> <%=city%> <%=state%> <%=postcode%> </td>
                </tr>
                               
                <tr> <td> Paid with: <%=payment%> </td></tr>
                <tr>
                    <td> Products Summary </td>
                   
                </tr>
                </table>
            </div>
           
            </div>
    </body>
   
    <div class="footer">
            <p> @Copyright 2021 - ISD Group 16 </p>
            <p> George Hetrelezis, Misty Duong, Reagan Brasch, Catherine Pe Benito </p>
        </div>
</html>
