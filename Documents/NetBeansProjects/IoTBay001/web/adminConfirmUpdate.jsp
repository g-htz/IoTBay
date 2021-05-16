<%-- 
    Document   : main
    Created on : 3 Apr 2021, 1:36:20 pm
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.text.DecimalFormat"%>

<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%
    String FIRST_NAME = request.getParameter("updateStaffFirstNameTf");
    String LAST_NAME = request.getParameter("updateStaffLastNameTf");
    String EMAIL_ADDRESS = request.getParameter("updateStaffEmailTf");
    String PASSWORD = request.getParameter("updateStaffPasswordTf");
    String ADDRESS = request.getParameter("updateStaffAddressTf");
    String SUBURB = request.getParameter("updateStaffSuburbTf");
    String STATE = request.getParameter("updateStaffStateTf");
    String COUNTRY = request.getParameter("updateStaffCountryTf");
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    ResultSet getList = st.executeQuery("select * from staff");  
    ResultSet getPageList = st2.executeQuery("select * from staff");  
    
    while(getList.next()) {
//        int i=st2.executeUpdate("UPDATE iotadmin.customer(FIRST_NAME, LAST_NAME,"
//                                + "EMAIL_ADDRESS, PASSWORD, ADDRESS,"
//                                + "SUBURB, STATE,COUNTRY) "
//                                + " where customer_id=" + request.getParameter("customer_id")
//                                + " values ('"+FIRST_NAME+"', '"+LAST_NAME+"', '"+EMAIL_ADDRESS+"', '"+PASSWORD+"', "
//                                            +" '"+ADDRESS+"', '"+SUBURB+"',"
//                                            + "'"+STATE+"', '"+COUNTRY+"') ");
        int i=st3.executeUpdate("UPDATE iotadmin.staff "
                                + "SET FIRST_NAME='"+FIRST_NAME+"', LAST_NAME='"+LAST_NAME+"',"
                                + "EMAIL_ADDRESS='"+EMAIL_ADDRESS+"', PASSWORD='"+PASSWORD+"', "
                                + "ADDRESS='"+ADDRESS+"', "
                                + "SUBURB='"+SUBURB+"', STATE='"+STATE+"',COUNTRY='"+COUNTRY+"' "
                                + " WHERE staff_id=" + request.getSession().getAttribute("staff_id"));
    }
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Welcome</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="css/style.css">
    </head>
    <body>
        <% 
            while(getPageList.next()) {
                if(getPageList.getString("staff_id").equals(request.getSession().getAttribute("staff_id")))
                {
            
        %>
                <div class='my-auto' style='margin: 0 auto;'>
                    <h1 style="text-align: center;"> Update Completed!</h1>
                    <h2 style="text-align: center;"> </h2>
                    <h4 style="text-align: center;" id="timer">Redirecting in 2</h4>
                    <a style="display: block; text-align: center;" href="adminDetails.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>">Click here if this page does not change.</a>        
                </div>

                <script>          
                    function startTimer(duration, display) {
                        var timer = duration, seconds;
                        setInterval(function () {
                            seconds = parseInt(timer % 60, 10);

                            display.textContent = "Redirecting in " + seconds;

                            if (--timer < 0) {
                                window.location.href = "adminDetails.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>";
                            }
                        }, 1000);
                    }

                    window.onload = function () {
                        var display = document.getElementById('timer');
                        startTimer(1, display);
                    };
                </script>
        <%
                }
                else
                {
                    System.out.println("try again?");
                }
        }
        %>
    </body>
</html>
