<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<title>KS Car Rental</title>
</head>

<body>
    <div id="page">
      <div id="pagetop">
		<h1>KS Car Rental</h1>
        <div class="links">    	
             <ul>
                <li><a href="http://localhost:8080/CarRental/Help.html">Help</a></li>
                <li><a href="http://localhost:8080/CarRental/ContactUs.html">Contact Us</a></li>
                <li><a href="http://localhost:8080/CarRental/AboutUs.html">About</a></li>
                <li><a href="http://localhost:8080/CarRental/ReturnCar.html">ReturnCar</a></li>
               	<li><a href="http://localhost:8080/CarRental/home.html">RentCar</a></li>
           	   	<li><a href="http://localhost:8080/CarRental/Welcome.html">Home</a></li>
                
            </ul>
		
        </div>
     </div>
        
        <div id="header">   Reach the Road to success     </div>
  
<div id="main">
	<div class="content">
        	<div class="main_top">
            	<h1>Rent a Car</h1>
            </div>
            
           	<div class="main_body">
<h1>Please enter the following details</h1>
<table>
<FORM action="insertFromCreditCardInsurance.jsp" method="post">
		
		<tr>
			<td>	
			<LABEL for="InsPolicyNo"> InsurancePolicyNo </LABEL> </td>
			<td>
			<INPUT type="text" name="CreditCardNo"> 
			</td>
		</tr>
		<tr>
		<td>
			<LABEL for="InsProviderName"> InsuranceProviderName </LABEL> 
			</td>
			<td>
			<INPUT type="text" name="InsProviderName"></td>
		</tr>
		<tr>
			<td>
			<LABEL for="ServicePhoneNo"> Service Phone No </LABEL></td>
			
			<td> 
			<INPUT type="text" name="ServicePhoneNo"> 
			</td>
		</tr>
		<tr>
			<td align="center">
			<INPUT type="submit" value="Submit">
		</td>
		</tr>
	</FORM>
</table>

		</div>


             	</div>
            <div class="clear">&nbsp;</div>
        </div>
<div id="footer">
        <p>copyright protected KS Car Rental</p>
        </div>        
        
        
        
        </div>
</body>
</html>
    