<%@page contentType="text/html" pageEncoding="UTF-8"%>

 

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>

 

<%
    String PRODUCT_NAME = request.getParameter("productName");
    String PRODUCT_TYPE = request.getParameter("productType");
    int TOTAL_QUANTITY = Integer.parseInt(request.getParameter("totalQuantity"));
    int PRICE_PER_UNIT = Integer.parseInt(request.getParameter("pricePerUnit"));
    int SUPPLIER_ID = Integer.parseInt(request.getParameter("supplierID")); 
    
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin");
    Statement st = con.createStatement();
    
    int i=st.executeUpdate("Insert into product(PRODUCT_NAME, PRODUCT_TYPE, TOTAL_QUANTITY, PRICE_PER_UNIT, SUPPLIER_ID)"
                            + "values ('"+PRODUCT_NAME+"', '"+PRODUCT_TYPE+"', "
                             + " "+TOTAL_QUANTITY+", "+PRICE_PER_UNIT+","+SUPPLIER_ID+")");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Dashboard</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/Style.css" rel="stylesheet" type="text/css"/>
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
        <div>
            <ul>
                <li><a class="active" href="adminProductList.jsp">Home</a></li>
                <li><a href="adminProductList.jsp">Products</a></li>
                <li class="order-dropdown">
                </li>
                <li class="float-right"><a href="logout.jsp">Logout</a></li>
                <li class="float-right"><a href="adminProfile.jsp">My Profile</a></li>
            </ul>
        </div>
        
        <div class="sidenav">
            <a href="javascript:history.back()">Go Back</a>
        </div>
        <center>
            <h1>Update Product</h1>
<br>
<div class="alert success">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>  
  <%
try{
String sql ="select * from product where product_id = (select max(product_id) FROM product)";
ResultSet resultSet = st.executeQuery(sql);
while(resultSet.next()){
%>
  <strong>Success!</strong> Added record <%=resultSet.getString("product_id") %>
  <%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
<table border="1">
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
String sql ="select * from product";
ResultSet resultSet = st.executeQuery(sql);
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
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
        </center>
    <footer style="width: 100%;background-color: #202020;color: whitesmoke;text-align: center; padding-bottom: 5px; margin-top: 10px">
            <p> @Copyright 2021 - ISD Group 16 </p>
            <p> George Hetrelezis, Misty Duong, Reagan Brasch, Catherine Pe Benito </p>
        </footer>
</body>

 

</html>