<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<jsp:useBean id="selectedClassType" class="com.njit.cs631.ks.Insurance.RentalInsurance"
scope="session">
<jsp:setProperty name="selectedClassType" property="selectedCarClass" value='<%= request.getParameter("carClassDrop")%>' />
</jsp:useBean>

<jsp:useBean id="rentalPeriod" class="com.njit.cs631.ks.car.RentalAgreement"
scope="session">
<jsp:setProperty name="rentalPeriod" property="rentalDateStr" value='<%= request.getParameter("startDateMonth") + request.getParameter("startDateInput")%>' />
<jsp:setProperty name="rentalPeriod" property="returnDateStr" value='<%= request.getParameter("endDateMonth") + request.getParameter("endDateInput")%>' />
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
            	<h1>ClassType Details</h1>
            </div>
            
           	<div class="main_body">

<h1>Displaying the details for the selected class type:</h1>
	<%
		String classSelected = request.getParameter("carClassDrop");

		Connection con = null;
		String url = "jdbc:mysql://sql2.njit.edu:3306/";
		String dbName = "ss984";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "ss984";
		String password = "xtlHyPSEC";

		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url + dbName, userName, password);
		
		String queryCar = "select * from Car where ClassType = '"
				+ classSelected + "'";
		PreparedStatement stmt = (PreparedStatement) con
				.prepareStatement(queryCar);
		ResultSet result = stmt.executeQuery();
		if(!result.next()) {
             out.println("Sorry, cars unavailable currently for this class type!!");
		}
             else {
            	 System.out.println("");
             

		
        String queryClass = "select * from Class where ClassType = '"
				+ classSelected + "'";
		PreparedStatement st = (PreparedStatement) con
				.prepareStatement(queryClass);
		ResultSet rs = st.executeQuery();		
		 if(!rs.next()) {
             out.println("Sorry, could not find the details!!");
             
         } else {
        	 //System.out.println( classSelected );
         
	%>

	<table border="1">
		<tr>
			<th>ClassType</th>			
			<th>RentalChargePerDay</th>
			<th>RentalChargePerWeek</th>
			<th>RentalChargePerMonth</th>
		</tr>
		<tr>
			<td> <%= rs.getString(1) %></td>
			<td> <%= rs.getString(2) %></td>
			<td> <%= rs.getString(3) %></td>
			<td> <%= rs.getString(4) %></td>			
		</tr>
	</table>
	
	<form action = "customerDetails.jsp" method = "post">	
		<button type="submit">Continue</button>		
	</form>
	<br>
	
	<form action = "home.html" method = "post">
		<button type="submit">Cancel</button>
	</form>
	<%
         }
		 st.close();
         }    
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
