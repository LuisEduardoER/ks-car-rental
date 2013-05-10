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
<title>Insert Customer</title>
</head>
<body bgcolor="#A9F5E1">

	<%
		String selectedSSN = request.getParameter("SSN");
	%>
	<jsp:setProperty name="inputssn" property="SSN" value="<%= selectedSSN %>" />
	<%
		String FName = request.getParameter("FirstName");
		String LName = request.getParameter("LastName");		
		String PrimaryPhNo = request.getParameter("PrimaryPhoneNo");
		String AltPhNo = request.getParameter("AltPhoneNo");
		String Street = request.getParameter("Street");
		String City = request.getParameter("City");
		String State = request.getParameter("State");
		String Zip = request.getParameter("Zip");

		Connection con = null;
		String url = "jdbc:mysql://sql2.njit.edu:3306/";
		String dbName = "ss984";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "ss984";
		String password = "xtlHyPSEC";

		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url + dbName, userName, password);

		String queryCustomer = "insert into Customer values ('" + selectedSSN + "','"
				+ FName + "','" + LName + "','" + PrimaryPhNo + "','"
				+ AltPhNo + "','" + Street + "','" + City + "','" + State
				+ "','" + Zip + "')";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(queryCustomer);
		int noOfRowsAffected = stmt.executeUpdate(queryCustomer);
		
		if(noOfRowsAffected == 1)
		out.println("Registration was successful!! Welcome to CarRental .. ");
	%>

	<form action="insurance.jsp" method="POST">
		<button type="submit">Continue</button>
	</form>
</body>
</html>