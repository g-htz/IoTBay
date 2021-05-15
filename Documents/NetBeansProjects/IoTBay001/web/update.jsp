<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%
String product_id = request.getParameter("product_id");
try{
Connection connection=DriverManager.getConnection("jdbc:derby://localhost:1527/iotdb", "iotadmin", "iotbayadmin");
    Statement statement = connection.createStatement();
String sql ="select * from product where product_id="+product_id;
ResultSet resultSet = statement.executeQuery(sql);

while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Product</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                background-color: #04AA6D;
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
<h1>Update Product</h1>
<form method="post" action="updateProcess.jsp">
    <center>
<input type="hidden" name="product_id" value="<%=resultSet.getString("product_id") %>">
<br>
Product Name:<br>
<input type="text" name="product_name" value="<%=resultSet.getString("product_name") %>">
<br>
Total Quantity:<br>
<input type="text" name="total_quantity" value="<%=resultSet.getString("total_quantity") %>">
<br>
Price Per Unit:<br>
<input type="text" name="price_per_unit" value="<%=resultSet.getString("price_per_unit") %>">
<br>
Product Type:<br>
<input type="text" name="product_type" value="<%=resultSet.getString("product_type") %>">
<br>
<input type="hidden" name="supplier_id" value="<%=resultSet.getString("supplier_id") %>">
<br>
<br><br>
<input type="submit" value="Submit">
    </center>
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
