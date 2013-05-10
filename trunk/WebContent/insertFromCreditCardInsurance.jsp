<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<jsp:useBean id="ccInsPolicyNum" class="com.njit.cs631.ks.Insurance.CreditCardInsurance"
scope="session">
<jsp:setProperty name="ccInsPolicyNum" property="*" />
</jsp:useBean>

<jsp:useBean id="insurance" class="com.njit.cs631.ks.Insurance.Insurance"
scope="session">
<jsp:setProperty name="insurance" property="insuranceType" value = "CCInsurance" />
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserting into Insurance</title>
</head>
<body bgcolor="#A9F5E1">

	<%
		String insPolicyNumber = request.getParameter("CreditCardNo").trim();
	%>
	<jsp:setProperty name="ccInsPolicyNum" property="insPolicyNo" value="<%= insPolicyNumber %>" />
	<%
	//out.println("In insertFrom PI.jsp from bean" + ccInsPolicyNum.getInsPolicyNo());
	//out.println("In insertFrom PI.jsp from request" + insPolicyNumber);
		String insProviderName = request.getParameter("InsProviderName");
		String servicePhoneNo = request.getParameter("ServicePhoneNo");
		String creditCardInsurance = "CreditCardInsurance";

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
		stmt.setString(3, creditCardInsurance);
		stmt.setString(4, servicePhoneNo);
		int noOfRowsAffected = stmt.executeUpdate();

		if (noOfRowsAffected == 1)
			out.println("Thank you for the details.. Do you want to confirm the rental?? ");
		}
		catch(Exception ex)
		{
			out.println(ex.toString());
		}
	%>

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