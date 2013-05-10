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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserting into Insurance</title>
</head>
<body bgcolor="#A9F5E1">

	<%
		String insPolicyNumber = (request.getParameter("InsPolicyNo")).trim();
	%>
	<jsp:setProperty name="insPolicyNum" property="insPolicyNo" value="<%= insPolicyNumber %>" />
	<%
		//out.println("In insertFrom PI.jsp from bean" + insPolicyNum.getInsPolicyNo());
		//out.println("In insertFrom PI.jsp from request" + insPolicyNumber);
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
		catch(Exception ex)
		{
			out.println(ex.toString());
		}
	%>
	
	<br>
	<form action="rentalagreement.jsp" method="POST">
		<button type="submit">Rent</button>
	</form>
	<br>
	<br>

	<form action="home.html" method="POST">
		<button type="submit">Cancel</button>
	</form>
</body>
</html>