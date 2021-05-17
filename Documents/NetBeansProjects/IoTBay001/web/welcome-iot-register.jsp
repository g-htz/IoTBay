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
    String FIRST_NAME = request.getParameter("registrationFirstNameTf");
    String LAST_NAME = request.getParameter("registrationLastNameTf");
    String EMAIL_ADDRESS = request.getParameter("registrationEmailTf");
    String PASSWORD = request.getParameter("registrationPasswordTf");
    String PHONENO = request.getParameter("registrationPhoneTf");
    String ADDRESS = request.getParameter("registrationAddressTf");
    String SUBURB = request.getParameter("registrationSuburbTf");
    String STATE = request.getParameter("registrationStateTf");
    String COUNTRY = request.getParameter("registrationCountryTf");
    //String customerEmail = "johnsmith123@123.com";
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    Statement st4 = con.createStatement();
    Statement st5 = con.createStatement();
    ResultSet customers = st.executeQuery("select * from customer");  
    
    int emailCounter = 0;
    while(customers.next()) {
        String email = customers.getString("EMAIL_ADDRESS");
        if(EMAIL_ADDRESS.equals(email)) {
            emailCounter = emailCounter + 1;
        }
     }
    if(emailCounter == 0){
        int i=st2.executeUpdate("Insert into customer(FIRST_NAME, LAST_NAME,"
                                + "EMAIL_ADDRESS, PASSWORD, PHONENO, ADDRESS,"
                                + "SUBURB, STATE,COUNTRY) "
                                + "values ('"+FIRST_NAME+"', '"+LAST_NAME+"', '"+EMAIL_ADDRESS+"', '"+PASSWORD+"', "
                                            +" '"+PHONENO+"', '"+ADDRESS+"', '"+SUBURB+"',"
                                            + "'"+STATE+"', '"+COUNTRY+"')");
    }
    
    ResultSet customerResults = st3.executeQuery("select * from customer WHERE email_address='" + EMAIL_ADDRESS+"'");
    ResultSet idResults = st4.executeQuery("select * from customer WHERE email_address='" + EMAIL_ADDRESS+"'");
    while (idResults.next()) {
        //System.out.println(customerResults.getString("EMAIL_ADDRESS"));
        //System.out.println(EMAIL_ADDRESS);
        if(idResults.getString("EMAIL_ADDRESS").equals(EMAIL_ADDRESS))
        {
            int logResults = st5.executeUpdate("Insert into logtime(user_ID)"
                                                  + "values ("+idResults.getString("customer_id")+")");
        }
        else
        {
        %>
            <script>          
                window.location.href = "login.jsp";
                alert("Sorry! Your username or password was incorrect");

            </script>
        <%
        }
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
        <link rel="Stylesheet" href="css/Style.css">
    </head>
    <body>
        <% 
            while(customerResults.next()) {
                if(customerResults.getString("EMAIL_ADDRESS").equals(EMAIL_ADDRESS))
                {
                    request.getSession().setAttribute("customer_id", customerResults.getString("customer_id"));
        %>
                <div class='my-auto' style='margin: 0 auto;'>
                    <h1 style="text-align: center;"> Welcome!</h1>
                    <h2 style="text-align: center;"> Bringing you to your dashboard now!</h2>
                    <h4 style="text-align: center;" id="timer">Redirecting in 3</h4>
                    <a style="display: block; text-align: center;" href="main.jsp?customer_id=<%=customerResults.getString("customer_id")%>">Click here if this page does not change.</a>        
                </div>

                <script>          
                    function startTimer(duration, display) {
                        var timer = duration, seconds;
                        setInterval(function () {
                            seconds = parseInt(timer % 60, 10);

                            display.textContent = "Redirecting in " + seconds;

                            if (--timer < 0) {
                                window.location.href = "main.jsp?customer_id=<%=customerResults.getString("customer_id")%>";
                            }
                        }, 1000);
                    }

                    window.onload = function () {
                        var display = document.getElementById('timer');
                        startTimer(2, display);
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
