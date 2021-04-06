<%-- 
    Document   : main
    Created on : 3 Apr 2021, 1:36:20 pm
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Welcome</title>
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
        </style>
    </head>
    <body>
        <ul>
            <li><a class="active" href="#">Home</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Account</a></li>
            <li><a href="#">Support</a></li>
            <li class="logout"><a href="#">Logout</a></li>
        </ul>

        <div class='mx-5'>
            <h1 style="align-items: center"> Welcome!</h1>
            <h2 style="align-items: center"> Bringing you to your dashboard now!</h2>
                
        </div>
        <a href="main.jsp">Click here if it no work</a>
    </body>
</html>
