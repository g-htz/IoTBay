<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Product</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="CSS/Style.css" rel="stylesheet" type="text/css"/>
        <% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
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
        <div>
            <ul>
                <li><a class="active" href="adminProductList.jsp">Home</a></li>
                <li><a href="adminProductList.jsp">Products</a></li>
                <li class="order-dropdown">
                    </div>
                </li>
                <li class="float-right"><a href="logout.jsp">Logout</a></li>
                <li class="float-right"><a href="adminProfile.jsp">My Profile</a></li>
            </ul>
        </div>
        
        <div class="sidenav">
            <a href="javascript:history.back()">Go Back</a>
        </div>
    <center>
        <div class='col-md-3 my-auto' style='margin: 0 auto;'>
            <h1 class='align-middle' style='text-align: center;'>Add Product</h1>
            <form action="addProduct.jsp" method="POST">
                <div class="form-group">
                    <input class="form-control" type="textfield" name="productName" placeholder="Product Name" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="textfield" name="totalQuantity" placeholder="Total Quantity" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="textfield" name="pricePerUnit" placeholder="Price Per Unit" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="textfield" name="productType" placeholder="Product Type" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="textfield" name="supplierID" placeholder="Supplier ID" required/>
                </div>
                <div class="form-group">
                    <input class="btn btn-default" type="submit" value="Submit" name="addButton" />
                </div>
            </form>
        </div>
    </center>
    
    </body>
</html>