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
            <h1 class='align-middle' style='text-align: center;'>Register</h1>
            <!--<form action="main.jsp" method="POST">-->
            <form action="welcome-iot-register.jsp" method="POST">
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationFirstNameTf" placeholder="First Name" required />
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationLastNameTf" placeholder="Last Name" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="email" name="registrationEmailTf" placeholder="Email Address" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="password" name="registrationEmailTf" placeholder="Password" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationPhoneTf" placeholder="Phone Number" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationAddressTf" placeholder="Address" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationSuburbTf" placeholder="Suburb" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationStateTf" placeholder="State" required/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationCountryTf" placeholder="Country" required/>
                </div>
                <div class="form-group">
                    <select name="registrationFoundOut" required>
                        <option>How did you find us?</option>
                        <option>Friends/Coworkers</option>
                        <option>Search Engine</option>
                        <option>Social media</option>
                    </select>
                    
                </div>
                <div class="form-group">
                    <label for="toc">I have read the Terms and Conditions:</label>
                    <input type="checkbox" id="toc" name="toc" value="Credit Card" required/>
                </div>
                <div class="form-group">
                    <input class="btn btn-default" type="submit" value="Submit" name="registrationBtn" />
                </div>
            </form>
        </div>
    </body>
</html>
