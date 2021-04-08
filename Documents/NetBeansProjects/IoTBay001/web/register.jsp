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
                <input type="text" name="registrationFirstNameTf" placeholder="First Name" />
                <input type="text" name="registrationLastNameTf" placeholder="Last Name" />
                <input type="text" name="registrationEmailTf" placeholder="Email Address" />
                <input type="text" name="registrationPhoneTf" placeholder="Phone Number" />
                <input type="text" name="registrationAddressTf" placeholder="Address" />
                <input type="text" name="registrationSuburbTf" placeholder="Suburb" />
                <input type="text" name="registrationStateTf" place="State" />
                <input type="text" name="registrationCountryTf" placeholder="Country" />
                <select name="registrationFoundOut">
                    <option>How did you find us?</option>
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
