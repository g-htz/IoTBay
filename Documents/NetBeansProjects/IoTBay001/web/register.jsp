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
    </head>
    <body>
        <div>
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
        </div>
    </body>
</html>
