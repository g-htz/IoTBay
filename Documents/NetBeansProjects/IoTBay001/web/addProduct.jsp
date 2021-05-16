<%-- 
    Document   : main
    Created on : 3 Apr 2021, 1:36:20 pm
    Author     : Reagan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>

<%
    String input_productName=request.getParameter("add_product_name");
    String input_totalQuantity = request.getParameter("add_totalQuantity");
    String input_pricePerUnit = request.getParameter("add_pricePerUnit");
    String input_productType=request.getParameter("add_productType");
    String input_supplierID = request.getParameter("add_supplierID");
if(input_supplierID != null)
{
Connection connection = null;
Statement statement = null;
int inputSupplierID = Integer.parseInt(input_supplierID);
    try {
    connection=DriverManager.getConnection("jdbc:derby://localhost:1527/iotdb", "iotadmin", "iotbayadmin");
    statement = connection.createStatement();
    int i=statement.executeUpdate("Insert into product(product_name,"
                            + "total_quantity, price_per_unit, product_type, supplier_id)"
                            + "values ('"+input_productName+"', '"+input_totalQuantity+"',"
                             + "'"+input_pricePerUnit+"', '"+input_productType+"','"+inputSupplierID+"')");}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body {margin:0;}

            ul {
              list-style-type: none;
              margin: 0;
              padding: 0 15%;
              overflow: hidden;
              background-color: #f5f5f5;
              /* position: fixed; */
              top: 0;
              width: 100%;
            }

            li {
              float: left;
              
            }

            li a {
              display: block;
              color: #000;
              text-align: center;
              padding: 14px 16px;
              text-decoration: none;
              font-size: 2rem;
            }
            
            .alert.success {
                background-color: #ABEBC6;
            }
            
            .closebtn {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
              }

              .closebtn:hover {
                color: black;
              }

            li a:hover:not(.active) {
              background-color: #70eeff;
            }
            
            table {
                  width: 50%;
                  padding: 5px 5px;
              }
              .center {
                  margin-left: auto;
                  margin-right: auto;
              }

              .tableHeading {
                  background-color: #f2f2f2;
                  text-align: center;
              }
              
              .tableColor {
                  background-color: #ffffff;
              }

            .active {
              background-color: #70eeff;
              color: #fff;
              font-weight: bold;
            }
            
            .logout {
                float: right;
            }
            
            .sidenav {
                width: 130px;
                position: fixed;
                z-index: 1;
                top: 100px;
                left: 10px;
                background: #eee;
                overflow-x: hidden;
                padding: 8px 0;
              }

              .sidenav a {
                padding: 6px 8px 6px 16px;
                text-decoration: none;
                font-size: 25px;
                color: black;
                display: block;
              }

              .sidenav a:hover {
                color: #064579;
                font-weight: bold;
              }
        </style>
    </head>
    <body>
        <ul>
            <li><a href="main.jsp">Home</a></li>
            <li><a class="active" href="adminProductList.jsp">Products</a></li>
            <li><a href="#">Account</a></li>
            <li><a href="support.jsp">Support</a></li>
            <li class="float-right"><a href="logout.jsp">Logout</a></li>
            <li class="float-right"><a href="profile.jsp">My Profile</a></li>
        </ul>
        <div class="sidenav">
            <a href="javascript:history.back()">Go Back</a>
        </div>
        <center>
            <h1>Update Product</h1>
<br>
<div class="alert success">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>  
  <strong>Success!</strong> Added record <%=request.getParameter("product_id")%>
</div>
<table border="1" class="mb-5 pb-5">
<tr class="tableHeading">
<td>Product ID</td>
<td>Product Name</td>
<td>Total Quantity</td>
<td>Price Per Unit</td>
<td>Product Type</td>
<td>Supplier ID</td>
</tr>
<%
try{
Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
Statement statement=connection.createStatement();
String sql ="select * from product";
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr class="tableColor">
<td><%=resultSet.getString("product_id") %></td>
<td><%=resultSet.getString("product_name") %></td>
<td><%=resultSet.getString("total_quantity") %></td>
<td><%=resultSet.getString("price_per_unit") %></td>
<td><%=resultSet.getString("product_type") %></td>
<td><%=resultSet.getString("supplier_id") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
        </center>
</body>
</html>
