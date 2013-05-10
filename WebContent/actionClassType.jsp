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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Class Type Details</title>
</head>
<body  bgcolor="#A9F5E1">


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

	<TABLE BORDER="1">
		<TR>
			<TH>ClassType</TH>			
			<TH>RentalChargePerDay</TH>
			<TH>RentalChargePerWeek</TH>
			<TH>RentalChargePerMonth</TH>
		</TR>
		<TR>
			<TD> <%= rs.getString(1) %></TD>
			<TD> <%= rs.getString(2) %></TD>
			<TD> <%= rs.getString(3) %></TD>
			<TD> <%= rs.getString(4) %></TD>			
		</TR>
	</TABLE>
	
	<form action = "customerDetails.jsp" method = "POST">	
		<button type="submit">Continue</button>
		
	</form>
	<br>
	
	<form action = "home.html" method = "POST">
		<button type="submit">Cancel</button>
	</form>
	<%
         }
		 st.close();
         }    
	%>

</body>
</html>