<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> IoTBay | Support </title>
        <link rel="Stylesheet" href="css/Style.css">
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <div>
            <ul>
                <li><a class="active" href="main.jsp">Home</a></li>
                <li><a href="customerProductList.jsp">Products</a></li>
                <li class="order-dropdown">
                    <a class="order-btn">Orders</a>
                    <div class="order-content">
                        <a href="cart.jsp">My Cart</a>
                        <a href="myOrders.jsp">Previous Orders</a>
                    </div>
                </li>
                <li><a href="support.jsp">Support</a></li>
                <li class="float-right"><a href="logout.jsp">Logout</a></li>
                <li class="float-right"><a href="profile.jsp">My Profile</a></li>
            </ul>
        </div>
        
        <div class="review">
            <h1> Contact Us - IoTBay </h1>
            <img src="images/logo.png" alt="IoTBay Logo" class="image" width="175" height="175">
            <p> IoTBay is a new online shopping business in hoping to provide our customer with the best shopping experience </p>
            <p> Feel free to ask us any question and let us know what you think after shopping on our website </p>
            <h4> Call us via 0123 456 789 or 02 321 765 </h4>
            <h4> Send us an email via onlineIoTBay@customerservice.com </h4>
        <div>
            <h4> How Can We Help? </h4>
            <select>
                <option> Customer Inquiry? </option>
                <option> Technical Support </option>
                <option> Payment Issues </option>
                <option> Shipment Issues </option>
                <option> Browsing Issues </option>
                <option> Customer Feedback </option>
                <option> Other </option>
            </select> <br> <br>
            <textarea rows="5" cols="50"> </textarea> <br>
            <input type="button" value="Submit"> </input>
        </div>
        
        </div>
        
    </body>
</html>


    