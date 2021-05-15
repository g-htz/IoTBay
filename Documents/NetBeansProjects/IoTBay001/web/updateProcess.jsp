<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%
String product_id=request.getParameter("product_id");
String product_name=request.getParameter("product_name");
Integer total_quantity = Integer.valueOf(request.getParameter("total_quantity"));
Integer price_per_unit = Integer.valueOf(request.getParameter("price_per_unit"));
String product_type=request.getParameter("product_type");
Integer supplier_id = Integer.valueOf(request.getParameter("supplier_id"));
if(product_id != null)
{
Connection connection = null;
PreparedStatement ps = null;
int productID = Integer.parseInt(product_id);
try
{
connection=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
String sql="Update product set product_name=?,total_quantity=?,price_per_unit=?,product_type=? where product_id="+productID;
ps = connection.prepareStatement(sql);
ps.setString(1,product_name);
ps.setInt(2, total_quantity);
ps.setInt(3, price_per_unit);
ps.setString(4, product_type);
ps.setString(5, product_type);
int i = ps.executeUpdate();
if(i > 0)
{
System.out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="Stylesheet" href="style.css">
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

            li a:hover:not(.active) {
              background-color: #70eeff;
            }

            .active {
              background-color: #70eeff;
              color: #fff;
              font-weight: bold;
            }
            
            .logout {
                float: right;
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
              
              .updateBtn {
                  background-color: #fCfCfC;
                  font-weight: bold;
                  cursor: pointer;
              }
              
              .tableColor {
                  background-color: #ffffff;
                  
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
              
              table {
                  width: 50%;
                  padding: 5px;
              }
              .center {
                  margin-left: auto;
                  margin-right: auto;
              }

              .tableHeading {
                  background-color: #f2f2f2;
                  text-align: center;
              }

              .main {
                margin-left: 140px; /* Same width as the sidebar + left position in px */
                font-size: 28px; /* Increased text to enable scrolling */
                padding: 0px 10px;
              }

              @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
                .sidenav a {font-size: 18px;}
              }
        </style>
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
  <strong>Success!</strong> Updated record <%=request.getParameter("product_id")%>
</div>
<table border="1">
<tr class="tableHeading">
<td>Product ID</td>
<td>Product Name</td>
<td>Total Quantity</td>
<td>Price Per Unit</td>
<td>Product Type</td>
<td>Supplier ID</td>
<td>Update</td>
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
<td class="updateBtn"><a href="update.jsp?product_id=<%=resultSet.getString("product_id")%>">Update</a></td>
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
