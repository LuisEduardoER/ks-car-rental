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


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rental Insurance</title>
</head>
<body bgcolor="#A9F5E1">	
	<% 
	String classType = selectedClassType.getSelectedCarClass();
	out.println ("You have selected " + classType );%>
	
	<!--<jsp:setProperty name="rentalInsPolicyNum" property="insPolicyNo" value=
	'<%= 
		rentalInsPolicyNum.GetInsPolicyNum(classType)
	%>' />-->
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

	<form name="myform" action="rentalagreement.jsp" method="POST">
		<div align="left">
			<br> 
			<input type="checkbox" name="RI" value="PE">PersonalEffect
			<br> 
			<input type="checkbox" name="RI" value="PA"> PersonalAccident
			<br> 
			<input type="checkbox" name="RI" value="LI"> Liability
			<br>
			<button type="submit">Rent</button>
		</div>
	</form>
	<% 
			}
		 con.close();
	%>
</body>
</html>