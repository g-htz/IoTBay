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
    String staffEmail = request.getParameter("staffEmail");
    //String customerEmail = "johnsmith123@123.com";
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    ResultSet loginResults = st.executeQuery("select * from staff");
    ResultSet loginResultsPage = st2.executeQuery("select * from staff");
    while(loginResults.next()) {
        if(loginResults.getString("email_address").equals(staffEmail))
        {
            int session_id = loginResults.getInt("staff_id");
            System.out.println(session_id);
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
    loginResults.next();
       
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
            while(loginResultsPage.next()) {
                if(loginResultsPage.getString("EMAIL_ADDRESS").equals(staffEmail))
                {
                    request.getSession().setAttribute("staff_id", loginResultsPage.getString("staff_id"));
            
        %>
                <div class='my-auto' style='margin: 0 auto;'>
                    <h1 style="text-align: center;"> Welcome!</h1>
                    <h2 style="text-align: center;"> Bringing you to your dashboard now!</h2>
                    <h4 style="text-align: center;" id="timer">Redirecting in 5</h4>
                    <a style="display: block; text-align: center;" href="main.jsp?staff_id=<%=loginResultsPage.getString("staff_id")%>">Click here if this page does not change.</a>        
                </div>

                <script>          
                    function startTimer(duration, display) {
                        var timer = duration, seconds;
                        setInterval(function () {
                            seconds = parseInt(timer % 60, 10);

                            display.textContent = "Redirecting in " + seconds;

                            if (--timer < 0) {
                                window.location.href = "main.jsp?staff_id=<%=loginResultsPage.getString("staff_id")%>";
                            }
                        }, 1000);
                    }

                    window.onload = function () {
                        var display = document.getElementById('timer');
                        startTimer(5, display);
                    };
                </script>
        <%
                }
                if(staffEmail == null)
                {
                    //System.out.println("try again?");
                    %>
                    
                      <script>          
                        window.location.href = "login.jsp";
                        alert("Sorry! Your username or password was incorrect");
                    
                    </script>
                    <%
                }
        }
        %>
    </body>
</html>
