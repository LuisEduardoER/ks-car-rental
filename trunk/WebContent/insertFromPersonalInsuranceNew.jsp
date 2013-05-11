<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<jsp:useBean id="insPolicyNum" class="com.njit.cs631.ks.Insurance.PersonalInsurance"
scope="session">
<jsp:setProperty name="insPolicyNum" property="*" />
</jsp:useBean>

<jsp:useBean id="insurance" class="com.njit.cs631.ks.Insurance.Insurance"
scope="session">
<jsp:setProperty name="insurance" property="insuranceType" value = "PersonalInsurance" />
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
            
           	<div class="main_body"><%
		String insPolicyNumber = (request.getParameter("InsPolicyNo")).trim();
	%>
	<jsp:setProperty name="insPolicyNum" property="insPolicyNo" value="<%= insPolicyNumber %>" />
	<%
		
		String insProviderName = (request.getParameter("InsProviderName")).trim();
		String personalInsurance = "PersonalInsurance";
		
		Connection con = null;
		String url = "jdbc:mysql://sql2.njit.edu:3306/";
		String dbName = "ss984";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "ss984";
		String password = "xtlHyPSEC";

		try
		{
		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url + dbName, userName, password);

		String queryPersonalIns = "Insert into Insurance values (?, ?, ?, ?)";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(queryPersonalIns);
		stmt.setString(1, insPolicyNumber);
		stmt.setString(2, insProviderName);
		stmt.setString(3, personalInsurance);
		stmt.setString(4, "");
		int noOfRowsAffected = stmt.executeUpdate();

		if (noOfRowsAffected == 1)
			out.println("Thank you for the details.. Do you want to confirm the rental?? ");
		}
		catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException mySqlEx){
			out.println("Thank you for the details.. Do you want to confirm the rental?? ");
		}
		catch(Exception ex)
		{
			out.println(ex.toString());
		}
	%>
	
	<br>
	<form action="rentalAgreementNew.jsp" method="post">
		<button type="submit">Rent</button>
	</form>
	<br>
	<br>

	<form action="home.html" method="post">
		<button type="submit">Cancel</button>
	</form>
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
