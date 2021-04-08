<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <div class='col-md-3 my-auto' style='margin: 0 auto;'>
            <h1 class='align-middle' style='text-align: center;'>Register</h1>
            <form action="main.jsp" method="POST">
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationFirstNameTf" placeholder="First Name" />
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationLastNameTf" placeholder="Last Name" />
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationEmailTf" placeholder="Email Address" />
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationPhoneTf" placeholder="Phone Number" />
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationAddressTf" placeholder="Address" />
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationSuburbTf" placeholder="Suburb" />
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationStateTf" placeholder="State" />
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="registrationCountryTf" placeholder="Country" />
                </div>
                <div class="form-group">
                    <select name="registrationFoundOut">
                        <option>How did you find out?</option>
                        <option>Friends/Coworkers</option>
                        <option>Search Engine</option>
                        <option>Social media</option>
                    </select>
                    
                </div>
                <div class="form-group">
                    <label for="toc">I have read the Terms and Conditions:</label>
                    <input type="checkbox" name="toc" value="ON" />
                </div>
                <div class="form-group">
                    <input class="btn btn-default" type="submit" value="Submit" name="registrationBtn" />
                </div>
            </form>
            <!--
            <form action="main.jsp" method="POST">
                <input type="text" name="registrationFirstNameTf" value="First Name" />
                <input type="text" name="registrationLastNameTf" value="Last Name" />
                <input type="text" name="registrationEmailTf" value="Email Address" />
                <input type="text" name="registrationPhoneTf" value="Phone Number" />
                <input type="text" name="registrationAddressTf" value="Address" />
                <input type="text" name="registrationSuburbTf" value="Suburb" />
                <input type="text" name="registrationStateTf" value="State" />
                <input type="text" name="registrationCountryTf" value="Country" />
                <select name="registrationFoundOut">
                    <option>Friends/Coworkers</option>
                    <option>Search Engine</option>
                    <option>Social media</option>
                </select>
                <input type="checkbox" name="I have read the terms and conditions" value="ON" />
                <input type="submit" value="Submit" name="registrationBtn" />
            </form>
            -->
        </div>
    </body>
</html>
