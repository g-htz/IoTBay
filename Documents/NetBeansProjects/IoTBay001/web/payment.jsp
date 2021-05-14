<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.Connection"%> 
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%> 
<% 
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/IoTDB", "iotadmin", "iotbayadmin"); 
    Statement st = con.createStatement(); 
%> 
  
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title> IoTBay | Checkout </title> 
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
        <link href="CSS/Style.css" rel="stylesheet" type="text/css"/> 
    </head> 
     
    <style> 
        .two { width : 61%; } 
        .two td { text-align: center; padding: 2%;} 
        .two th { text-align: center; border-bottom: 1px solid black; background-color: gainsboro; padding: 2%;} 
        .two tr:hover {background-color: #f5f5f5;} 
        .active { background-color: #70eeff; color: #fff; font-weight: bold; } 
    </style> 
     
    <body style="background-color: floralwhite"> 
        <div class="navbar" style="padding-bottom: 60px"> 
            <ul> 
                <li><a href="Main.jsp"> Home </a></li> 
                <li><a href="Shopping.jsp"> Browse </a></li> 
                <li><a href="#"> Account </a></li> 
                <li><a href="Support.jsp"> Support </a></li> 
                <li class="float-right"><a href="Logout.jsp">Logout</a></li> 
                <li class="float-right"><a href="Profile.jsp">My Profile</a></li> 
            </ul> 
        </div> 
         
<!--        <ul> 
            <li><a class="active" href="main.jsp">Home</a></li> 
            <li><a href="products.jsp">Products</a></li> 
            <li class="order-dropdown"> 
                <a class="order-btn">Orders</a> 
                <div class="order-content"> 
                    <a href="cart.jsp">My Cart</a> 
                    <a href="myOrders.jsp">Previous Orders</a> 
                </div> 
            </li> 
            <li><a href="support.jsp">Support</a></li> 
            <li class="float-right"><a href="profile.jsp">My Profile</a></li> 
            <li class="float-right"><a href="logout.jsp">Logout</a></li> 
        </ul>--> 
  
        <h1 style="text-align:center"> Customer Checkout </h1> 
        <div style="height: 2500px; "> 
        <form center action="Confirmation.jsp" method="POST"> 
             
        <div style="padding-bottom: 10px; margin-left: 400px">             
            <h2> Summary </h2> 
            <Table class="two">  
                <tr>  
                    <th> Product Description </th> 
                    <th> Quantity </th>  
                    <th> Unit Price </th> 
                </tr> 
                 
                <% 
                    try{ 
                    String sql = "SELECT * FROM IOTADMIN.SHOPPINGCART"; 
                    ResultSet resultSet = st.executeQuery(sql); 
                    while(resultSet.next()){ 
                %> 
                <tr> 
                    <td> <%=resultSet.getString("PRODUCT_NAME") %> </td> 
                    <td> <%=resultSet.getString("QUANTITY") %> </td> 
                    <td> $ <%=resultSet.getString("PRICE_PER_UNIT")%> </td> 
                </tr> <% }} catch (Exception e) { e.printStackTrace(); } %> 
                 
                <% 
                    try{ 
                    String sql ="SELECT * FROM IOTADMIN.OUTCOME WHERE ORDER_ID = (SELECT MAX(ORDER_ID) FROM OUTCOME)"; 
                    ResultSet resultSet = st.executeQuery(sql); 
                    while(resultSet.next()){ 
                %> 
                <tr> <td/> 
                    <th> Total Price </th> 
                    <td> $ <%=resultSet.getString("TOTAL_PRICE") %> </td>  
                </tr> <% } con.close();} catch (Exception e) { e.printStackTrace(); } %> 
            </table> 
        </div>      
             
        <div style="padding-bottom: 10px; margin-left: 400px"> 
            <h2> Payment Method </h2> 
                <table> 
                    <tr> 
                        <td><input type="radio" id="credit" name="paymentmethod" value="Credit Card" required/></td> 
                        <td> Credit Card </td>  
                        <td><img src="Images/CC.png" alt="Credit Card" width="70" height="70"></td> 
                        <td> </td> 
                        <td><input type="radio" id="vc" name="paymentmethod" value="Visa Card"/></td> 
                        <td> VISA </td> 
                        <td><img src="Images/VC.png" alt="PayPal" width="80" height="50"></td> 
                        <td><input type="radio" id="mc" name="paymentmethod"value="Master Card"/></td> 
                        <td> MasterCard </td> 
                        <td><img src="Images/MC.png" alt="PayPal" width="100" height="50"></td> 
                    </tr> 
                </table> 
             
                <table> 
                    <tr><td> First Name <input type="textfield" placeholder="Cardholder First Name" name="cardfname" style="width:200%; padding:10px; margin:8px 0px" required> </td></tr> 
                    <tr><td> Last Name <input type="textfield" placeholder="Cardholder Last Name" name="cardlname" style="width:200%; padding:10px; margin:8px 0px" required> </td></tr> 
                    <tr><td> Card Number <input type="textfield" placeholder="Card Number" name="cardno"  style="width:200%; padding:10px; margin:8px 0px" maxlength="19" required> </td></tr> 
                    <tr><td> Security Code <input type="password" placeholder="Number at the back of the card" name="scode" style="width:200%; padding:10px; margin:8px 0px" maxlength="4" required> </td></tr> 
                    <tr><td> Expiration Month  
                            <select name="expmonth" required style="width:55%; padding:10px; margin:8px 0px" required> 
                            <option> Select a Month </option> 
                            <option> January </option> 
                            <option> February </option> 
                            <option> March </option> 
                            <option> April </option> 
                            <option> May </option> 
                            <option> June </option> 
                            <option> July </option> 
                            <option> August </option> 
                            <option> September </option> 
                            <option> October </option> 
                            <option> November </option> 
                            <option> December </option> 
                        </select> </td></tr> 
                    <tr><td> Expiration Year  
                        <select name="expyear" required style="width:50%; padding:10px; margin:8px 0px" required> 
                            <option> Select a Year </option>     
                            <option> 2021 </option> 
                            <option> 2022 </option> 
                            <option> 2023 </option> 
                            <option> 2024 </option> 
                            <option> 2025 </option> 
                            <option> 2026 </option> 
                            <option> 2027 </option> 
                            <option> 2028 </option> 
                            <option> 2029 </option> 
                            <option> 2030 </option> 
                        </select> </td> </tr> 
                </table> 
            </div> 
             
            <div style="padding-bottom: 10px; margin-left: 400px">  
                <h2> Shipping Address </h2> 
                <table> 
                    <tr> 
                        <td><input type="radio" id="normal" name="shipping" value="standard" required/></td> 
                        <td> Standard Shipping </td>  
                        <td><img src="Images/normal.jpeg" alt="Credit Card" width="90" height="60"></td> 
                        <td> </td> 
                        <td><input type="radio" id="express" name="shipping" value="express"/></td> 
                        <td> Express Shipping </td> 
                        <td><img src="Images/express.png" alt="PayPal" width="80" height="50"></td> 
                    </tr> 
                </table> 
  
                <table> 
                    <tr><td> First Name <input type="text" placeholder="E.g. John" name="firstname" style="width:200%; padding:10px; margin:8px 0px" required></td></tr> 
                    <tr><td> Last Name <input type="text" placeholder="E.g. Smith" name="lastname" style="width: 200%; padding: 10px; margin:8px 0px" required><br></td></tr> 
                    <tr><td> Email <input type="email" placeholder="E.g. name@example.com" name="email" style="width:200%; padding:10px; margin:8px 0px" required></td></tr> 
                    <tr><td> Address <input type="text" placeholder="Street Address" name="address" style="width:200%; padding:10px; margin:8px 0px" required></td></tr> 
                    <tr><td> Suburb <input type="text" placeholder="City" name="suburb" style="width:200%; padding:10px; margin:8px 0px" required></td></tr> 
                    <tr><td> State <input type="text" placeholder="State" name="state" style="width:200%; padding:10px; margin:8px 0px;" required></td></tr> 
                    <tr><td> Country <input type="text" placeholder="Country" name="country" style="width:200%; padding:10px; margin:8px 0px" required></td></tr> 
                </table> 
            </div> 
             
            <div style="text-align: center"> 
                <input class="button" type="submit" name="paymentsent" value="Pay"/> 
            </div>   
        </form> 
        </div> 
         
        <div class="footer"> 
            <p> @Copyright 2021 - ISD Group 16 </p> 
            <p> George Hetrelezis, Misty Duong, Reagan Brasch, Catherine Pe Benito </p> 
        </div> 
    </body> 
</html> 
