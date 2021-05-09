<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title> Home Page</title>
    </head>
    
    <style>
        body {
            background-image: url('images/background.png');
        }
    </style>
    
    <body>
        
        <h1> Welcome to IoTBay! </h1>
        <img src="images/logo.png" alt="IoTBay Logo" class="image" width="175" height="175">
        
        <div class="body">
            <form action="login.jsp" method="POST">
                <input class="button" type="submit" id="login" value="Login"/>
            </form>
            
            <form action="register.jsp" method="POST">
                <input class="button" type="submit" id="register" value="Register"/>
            </form>
            
            <form action="shopping.jsp" method="POST">
                <input class="button" type="submit" id="shopping" value="Continue as Anonymous"/>
            </form>
        </div>
        
        <div class="footer">
            <p> @Copyright 2021 - ISD Group 16 </p>
            <p> George, Misty, Reagan, Catherine </p>
        </div>
        
    </body>
    
</html>
