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
        <link rel="Stylesheet" href="css/style.css">
    </head>
    <body>

        <div class='my-auto' style='margin: 0 auto;'>
            <h1 style="text-align: center;"> Welcome!</h1>
            <h2 style="text-align: center;"> Bringing you to your dashboard now!</h2>
            <h4 style="text-align: center;" id="timer">Redirecting in 5</h4>
            <a style="display: block; text-align: center;" href="main.jsp">Click here if this page does not change.</a>        
        </div>
        
        <script>          
            function startTimer(duration, display) {
                var timer = duration, seconds;
                setInterval(function () {
                    seconds = parseInt(timer % 60, 10);

                    display.textContent = "Redirecting in " + seconds;

                    if (--timer < 0) {
                        window.location.href = "main.jsp";
                    }
                }, 1000);
            }

            window.onload = function () {
                var display = document.getElementById('timer');
                startTimer(5, display);
            };
        </script>
    </body>
</html>
