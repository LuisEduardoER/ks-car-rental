<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.SimpleDateFormat"%>
    <%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<jsp:useBean id="rentalPeriod"
	class="com.njit.cs631.ks.car.RentalAgreement" scope="session">
</jsp:useBean>
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
<h1>Your Rental Agreement is ready.</h1>
	
	<%
	int agreementNum;
	String creditCardExpiryDate = request.getParameter("creditCardExDate").trim();
	java.util.Date expDate = new SimpleDateFormat("MM/YY").parse(creditCardExpiryDate);
	//out.println(expDate);
	String creditCardNum = request.getParameter("creditCardNum").trim();
	rentalPeriod.setCreditCardExpDateStr(creditCardExpiryDate);
	rentalPeriod.setCreditCardNo(creditCardNum);
	rentalPeriod.signUpRentalAgreement();
	%>
	
	
	<%
	Connection connection = null;
	String URL = "jdbc:mysql://sql2.njit.edu:3306/";
	String dbName = "ss984";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "ss984";
	String password = "xtlHyPSEC";

	Class.forName(driver).newInstance();
	connection = DriverManager.getConnection(URL + dbName, userName, password);
	
	
	//String queryRentalRetrieval = "select AgreementNo, LicenseState, LicenseNo, InsPolicyNo, RentalDate, ReturnDate, MileageBeforeRental, NoOfDays, PersonalAccidentCoverage, PersonalEffectCoverage, LiabilityCoverage, PricePerDay, RentalPrice, Discount from RentalAgreement where AgreementNo >= ALL (Select AgreementNo from RentalAgreement)";
	String queryRentalRetrieval = "Select * from RentalAgreement where AgreementNo >= ALL (Select AgreementNo from RentalAgreement)";
	PreparedStatement statement = (PreparedStatement) connection.prepareStatement(queryRentalRetrieval);
		ResultSet resultset = statement.executeQuery();		
		 if(resultset.next()) {
			
	%>

	<table BORDER="1">
		<tr>
			<td>AgreementNumber</td>
			<td><%= resultset.getString(1) %></td>
		</tr>
		<tr>
			<TD>License State</TD>
			<TD><%= resultset.getString(2) %></TD>
		</TR>
		<TR>
			<TD>License Number</TD>
			<TD><%= resultset.getString(3) %></TD>
		</TR>
		<TR>
			<TD>Insurance Policy Number</TD>
			<TD><%= resultset.getString(5) %></TD>
		</TR>
		<TR>
			<TD>Rental Date</TD>
			<TD><%= resultset.getString(6) %></TD>
		</TR>
		<TR>
			<TD>Return Date</TD>
			<TD><%= resultset.getString(7) %></TD>
		</TR>
		<TR>
			<TD>Mileage Before Rental</TD>
			<TD><%= resultset.getString(8) %></TD>
		</TR>
		<TR>
			<TD>Number of Days</TD>
			<TD><%= resultset.getString(9) %></TD>
		</TR>
		<TR>
			<TD>Personal Accident Coverage</TD>
			<TD><%=(resultset.getString(11).equals("1")? "YES" : "NO") %></TD>
		</TR>
		<TR>
			<TD>Personal Effect Coverage</TD>
			<TD><%= (resultset.getString(12).equals("1")? "YES" : "NO")%></TD>
		</TR>
		<TR>
			<TD>Liability Coverage</TD>
			<TD><%= (resultset.getString(13).equals("1")? "YES" : "NO") %></TD>
		</TR>
		<TR>
			<TD>Price Per Day</TD>
			<TD><%= resultset.getString(14) %></TD>
		</TR>
		<TR>
			<TD>Rental Price</TD>
			<TD><%= resultset.getString(15) %></TD>
		</TR>
		<TR>
			<td>Discount</td>
			<td><%= resultset.getString(17) %></td>
		</TR>		
	</TABLE>
	<br></br>
	<h1> Have a safe and happy drive!!</h1>
	
		<%
		agreementNum = resultset.getInt(1);
		PreparedStatement statement1 = (PreparedStatement)connection.prepareStatement("Update RentalAgreement set Returned=0 where AgreementNo = '" + agreementNum + "'");
		//statement1.setString(1,agreementNum);
		int rowsAffected1 = statement1.executeUpdate();
		 }
			connection.close();
		%>
	
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
