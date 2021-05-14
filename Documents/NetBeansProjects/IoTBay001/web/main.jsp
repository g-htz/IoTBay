<%-- 
    Document   : main
    Created on : 3 Apr 2021, 1:36:20 pm
    Author     : Reagan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<% 
    String FIRST_NAME = request.getParameter("registrationFirstNameTf");
    String LAST_NAME = request.getParameter("registrationLastNameTf");
    String EMAIL_ADDRESS = request.getParameter("registrationEmailTf");
    String PASSWORD = request.getParameter("registrationPhoneTf");
    String PHONENO = request.getParameter("registrationPhoneTf");
    String ADDRESS = request.getParameter("registrationAddressTf");
    String SUBURB = request.getParameter("registrationSuburbTf");
    String STATE = request.getParameter("registrationStateTf");
    String COUNTRY = request.getParameter("registrationCountryTf");
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    Statement st4 = con.createStatement();
    Statement st5 = con.createStatement();
    ResultSet customers = st.executeQuery("select * from customer");  
    int emailCounter = 0;
    LocalTime time = LocalTime.now();
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss"); 
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
    
    ResultSet customerResults = st3.executeQuery("select * from customer WHERE email_address=" + "EMAIL_ADDRESS");
    ResultSet idResults = st4.executeQuery("select * from customer WHERE email_address=" + "EMAIL_ADDRESS");
    while (idResults.next()) {
        //System.out.println(customerResults.getString("EMAIL_ADDRESS"));
        //System.out.println(EMAIL_ADDRESS);
        if(idResults.getString("EMAIL_ADDRESS").equals(EMAIL_ADDRESS))
        {
            int logResults = st5.executeUpdate("Insert into logtime(CUSTOMER_ID)"
                                                  + "values ("+idResults.getString("customer_id")+")");
        }
    }
    customers.next();
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Dashboard</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="css/Style.css">
    </head>
    <body>
        <ul>
            <li><a class="active" href="main.jsp">Home</a></li>
            <li><a href="#">Products</a></li>
            <li class="dropdown">
                <a class="dropbtn">Account </a>
                <div class="dropdown-content">
            <%  int addv = 0;
                while (customerResults.next()) {
                    if(customerResults.getString("EMAIL_ADDRESS").equals(EMAIL_ADDRESS))
                    {
                        
            %>
                    <a href="createOrder.jsp?customer_id=<%=customerResults.getString("customer_id")%>">Create Order</a>
                    <a href="myOrders.jsp?customer_id=<%=customerResults.getString("customer_id")%>">Previous Orders</a>
                </div>
            </li>
            <li><a href="#">Support</a></li>
            
                
                        <h2><%=customerResults.getString("customer_id")%></h2>
                        <li class="float-right"><a href="profile.jsp?customer_id=<%=customerResults.getString("customer_id")%>">My Profile</a></li>
                        <li class="float-right"><a href="logout.jsp">Logout</a></li>
            <%
                }
             }
            %>
        </ul>

        <h1>Dashboard</h1>
        <div class='mx-5'>
            <div class='card-group'>
                <div class='card mx-1'>
                    <img src="https://via.placeholder.com/150" class='card-img-top'>
                    <h4 style='text-align: center;'>Featured</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://via.placeholder.com/150" class='card-img-top'>
                    <h4 style='text-align: center;'>Browse</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://via.placeholder.com/150" class='card-img-top'>
                    <h4 style='text-align: center;'>FAQs</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://via.placeholder.com/150" class='card-img-top'>
                    <h4 style='text-align: center;'>Account</h4>
                </div>
                <div class='card mx-1'>
                    <img src="https://via.placeholder.com/150" class='card-img-top'>
                    <h4 style='text-align: center;'>Help</h4>
                </div>
            </div>
        </div>
    </body>
</html>

