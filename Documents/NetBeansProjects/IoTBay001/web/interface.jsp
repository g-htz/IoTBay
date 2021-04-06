<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/Style.css">
        <title> Home Page</title>
    </head>
    
    <style>
        body {
            background-image: url('CSS/Background.png');
        }
    </style>
    
    <body>
        
        <h1> Welcome to IoTBay! </h1>
        <img src="CSS/Logo.jpg" alt="IoTBay Logo" class="image" width="175" height="175">
        
        <div class="body">
            <form action="login.jsp" method="POST">
                <input class="button" type="submit" id="login" value="Login"/>
            </form>
            
            <form action="register.jsp" method="POST">
                <input class="button" type="submit" id="register" value="Register"/>
            </form>
        </div>
        
        <div class="footer">
            <p> @Copyright 2021 - ISD Group # </p>
            <p> Name, Name, Name, Name </p>
        </div>
        
    </body>
    
</html>
