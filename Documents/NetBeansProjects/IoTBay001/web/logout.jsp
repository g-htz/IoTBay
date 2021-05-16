<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar;"%>
<%@page import="java.util.Date;"%>
<%@page import="java.time.LocalDate;"%>
<%@page import="java.text.DateFormat;"%>
<%@page import="java.time.format.DateTimeFormatter;"%>

<%
    //Date date = java.time.LocalDate.now();
    
    Date time = new java.util.Date(System.currentTimeMillis());
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    ResultSet idResults = st.executeQuery("select * from logtime");
    while (idResults.next()) {
        int logResults = st2.executeUpdate("UPDATE iotadmin.LOGTIME " 
                                                  + " SET DATE_LOGOUT='"+LocalDate.now()+"', TIME_LOGOUT='"+new SimpleDateFormat("HH:mm:ss").format(time)+"' "
                                                  + " WHERE date_logout IS NULL");
        
    }
    
    request.getSession().removeAttribute("logged_in");
    request.getSession().removeAttribute("customer_id");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="Stylesheet" href="css/Style.css">
        <title>Logout Page</title>
    </head>
    
    <style>
        body {
            background-image: url('images/background.png');
        }
    </style>
    
    <body class="body">
        <h1> Thank you for Visiting IotBay </h1>
        
        <h2> You have successfully logged out of IoTBay </h2>
        
        
        <form action="login.jsp" method="POST">
            <input class="button" type="submit" id="login" value="Login to IoTBay"/>
        </form>
        
        <div class="footer">
            <p> @Copyright 2021 - ISD Group 16 </p>
            <p> George, Misty, Reagan, Catherine </p>
        </div>
        
    </body>
</html>
