<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<jsp:useBean id="inputssn" class="com.njit.cs631.ks.customer.Customer"
scope="session">
<jsp:setProperty name="inputssn" property="*" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Validation</title>
</head>
<body bgcolor="#A9F5E1">

	<%
		String inputSSN = (request.getParameter("SSN")).trim();
	%>
	<jsp:setProperty name="inputssn" property="SSN" value="<%= inputSSN %>" />
	
	<%

	out.println("In validateCustomer.jsp from bean " + inputssn.getSSN());
	out.println("In validateCustomer.jsp from request " + inputSSN);
	
		Connection con = null;
		String url = "jdbc:mysql://sql2.njit.edu:3306/";
		String dbName = "ss984";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "ss984";
		String password = "xtlHyPSEC";

		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url + dbName, userName, password);
		
		String querySSN = "select * from Customer where SSN = '" + inputSSN + "'";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(querySSN);
		ResultSet result = stmt.executeQuery();
		if(!result.next()) {
             out.println("Sorry, we feel you are not an existing customer.. ");  
             %>
	<form action="customerDetails.jsp" method="POST">
		<button type="submit"> Cancel </button>
	</form>
	<%
			}
             else {
            	 out.println("Welcome Back!!");
             		
      %>


	
	<form action="insurance.jsp" method="POST">
		<button type="submit">Continue</button>
	</form>
	<br>
	<br>

	<form action="customerDetails.jsp" method="POST">
		<button type="submit">Cancel</button>
	</form>

	<%
             }
		stmt.close();
	%>
</body>
</html>