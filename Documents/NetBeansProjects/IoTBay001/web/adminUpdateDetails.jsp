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
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    
    ResultSet userResults = st.executeQuery("select * from staff WHERE staff_id=" + request.getSession().getAttribute("staff_id"));
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="css/Style.css">
    </head>
    <body>
        <div class='col-md-3 my-auto' style='margin: 0 auto;'>
            <h1 class='align-middle' style='text-align: center;'>Update My Details</h1>
            <%
                while(userResults.next())
                {
            %>
                <form action="adminConfirmUpdate.jsp?staff_id=<%=request.getSession().getAttribute("staff_id")%>" method="POST">
                <div class="d-flex form-group">
                    <h6>First Name</h6>
                    <input class="ml-5 form-control" type="text" name="updateStaffFirstNameTf" placeholder="First Name" value="<%=userResults.getString("first_name")%>" required />
                </div>
                <div class="d-flex form-group">
                    <h6>Last Name</h6>
                    <input class="ml-5 form-control" type="text" name="updateStaffLastNameTf" placeholder="Last Name" value="<%=userResults.getString("last_name")%>" required/>
                </div>
                <div class="d-flex form-group">
                    <h6>Email Address</h6>
                    <input class="ml-5 form-control" type="email" name="updateStaffEmailTf" placeholder="Email Address" value="<%=userResults.getString("email_address")%>" required/>
                </div>
                <div class="d-flex form-group">
                    <h6>Password</h6>
                    <input class="ml-5 form-control" type="password" name="updateStaffPasswordTf" placeholder="Password" value="<%=userResults.getString("password")%>" required/>
                </div>
                <div class="d-flex form-group">
                    <h6>Address</h6>
                    <input class="ml-5 form-control" type="text" name="updateStaffAddressTf" placeholder="Address" value="<%=userResults.getString("address")%>" required/>
                </div>
                <div class="d-flex form-group">
                    <h6>Suburb</h6>
                    <input class="ml-5 form-control" type="text" name="updateStaffSuburbTf" placeholder="Suburb" value="<%=userResults.getString("suburb")%>" required/>
                </div>
                <div class="d-flex form-group">
                    <h6>State</h6>
                    <input class="ml-5 form-control" type="text" name="updateStaffStateTf" placeholder="State" value="<%=userResults.getString("state")%>" required/>
                </div>
                <div class="d-flex form-group">
                    <h6>Country</h6>
                    <input class="ml-5 form-control" type="text" name="updateStaffCountryTf" placeholder="Country" value="<%=userResults.getString("country")%>" required/>
                </div>
                
                <div class="form-group">
                    <input class="btn btn-default mx-auto" type="submit" value="Submit" name="adminUpdateDetailsBtn" />
                </div>
            </form>
            <%       
                }
            
            %>
            <!--<form action="main.jsp" method="POST">-->
            
        </div>
    </body>
</html>
