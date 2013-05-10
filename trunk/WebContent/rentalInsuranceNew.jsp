<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<jsp:useBean id="selectedClassType" class="com.njit.cs631.ks.Insurance.RentalInsurance"
scope="session">
<jsp:getProperty name="selectedClassType" property="selectedCarClass" />
</jsp:useBean>

<jsp:useBean id="rentalInsPolicyNum" class="com.njit.cs631.ks.Insurance.RentalInsurance"
scope="session">
<jsp:setProperty name="rentalInsPolicyNum" property="insPolicyNo" value=
'<%= 
(rentalInsPolicyNum.GetInsPolicyNum(selectedClassType.getSelectedCarClass().trim())).trim()
%>' />
</jsp:useBean>

<jsp:useBean id="insurance" class="com.njit.cs631.ks.Insurance.Insurance"
scope="session">
<jsp:setProperty name="insurance" property="insuranceType" value = "RentalInsurance" />
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
            	<h1>Home</h1>
            </div>
            
           	<div class="main_body">
<% 
	String classType = selectedClassType.getSelectedCarClass();
	out.println ("You have selected " + classType );%>
		
	<br>
	<%
	String val = rentalInsPolicyNum.getInsPolicyNo();
	//out.println("Value set for ri ins policy num in the bean = " + rentalInsPolicyNum.getInsPolicyNo());
	out.println ("The details for the insurance associated with this class type is: ");
	
	Connection con = null;
	String url = "jdbc:mysql://sql2.njit.edu:3306/";
	String dbName = "ss984";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "ss984";
	String password = "xtlHyPSEC";

	Class.forName(driver).newInstance();
	con = DriverManager.getConnection(url + dbName, userName, password);
	 String queryClass = "select RIClassType, PECostPerDay, PECostPerWeek, PECostPerMonth, PACostPerDay, PACostPerWeek, PACostPerMonth, LICostPerDay, LICostPerWeek, LICostPerMonth from RentalInsurance" + 
	" where RIClassType = '" + classType.trim() + "'";
		PreparedStatement st = (PreparedStatement) con
				.prepareStatement(queryClass);
		ResultSet rs = st.executeQuery();		
		 if(!rs.next()) {
			%>
			<br>
			<br>
			<%
          out.println("Sorry, could not find the details!!");
          
      } else {
     	 
	%>

	<TABLE BORDER="1">
		<TR>
			<TD>ClassType</TD>
			<TD><%= rs.getString(1) %></TD>
		</TR>
		<TR>
			<TD>PersonalEffectCostPerDay</TD>
			<TD><%= rs.getString(2) %></TD>
		</TR>
		<TR>
			<TD>PersonalEffectCostPerWeek</TD>
			<TD><%= rs.getString(3) %></TD>
		</TR>
		<TR>
			<TD>PersonalEffectCostPerMonth</TD>
			<TD><%= rs.getString(4) %></TD>
		</TR>
		<TR>
			<TD>PersonalAccidentCostPerDay</TD>
			<TD><%= rs.getString(5) %></TD>
		</TR>
		<TR>
			<TD>PersonalAccidentCostPerWeek</TD>
			<TD><%= rs.getString(6) %></TD>
		</TR>
		<TR>
			<TD>PersonalAccidentCostPerMonth</TD>
			<TD><%= rs.getString(7) %></TD>
		</TR>
		<TR>
			<TD>LiabilityCostPerDay</TD>
			<TD><%= rs.getString(8) %></TD>
		</TR>
		<TR>
			<TD>LiabilityCostPerWeek</TD>
			<TD><%= rs.getString(9) %></TD>
		</TR>
		<TR>
			<TD>LiabilityCostPerMonth</TD>
			<TD><%= rs.getString(10) %></TD>
		</TR>
	</TABLE>

	<!-- <form action="rentalagreement.jsp" method="post">
		<div align="left">
			<br> 
			<input type="checkbox" name="RI" value="PE"> PersonalEffect
			<br> 
			<input type="checkbox" name="RI" value="PA"> PersonalAccident
			<br> 
			<input type="checkbox" name="RI" value="LI"> Liability
			<br>
			<button type="submit">Submit</button>
		</div>
	</form> -->
	
<form ACTION="rentalagreement.jsp">
<input type="checkbox" name="id" value="PE"> PersonalEffect <BR>
<input type="checkbox" name="id" value="PA"> PersonalAccident <BR>
<input type="checkbox" name="id" value="LI"> Liability <BR>
<input type="submit" value="Submit">
</form>
	<% 
			}
		 con.close();
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
