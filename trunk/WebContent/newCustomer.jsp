<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Customer</title>
</head>
<body bgcolor="#A9F5E1">

	<h1>Please enter the following details</h1>

	<FORM action="insertCustomer.jsp" method="post">
		<P>
			<LABEL for="FName"> FirstName </LABEL> <INPUT type="text"
				name="FirstName"> <br> <BR> <LABEL for="LName">
				LastName </LABEL> <INPUT type="text" name="LastName"><BR>
			<br> <LABEL for="ssn"> SSN </LABEL> <INPUT type="text" name="SSN"><BR>
			<br> <LABEL for="PrimaryPhNo"> PrimaryPhoneNo </LABEL> <INPUT
				type="text" name="PrimaryPhoneNo"><BR>
			<br> <LABEL for="AltPhNo"> AltPhoneNo </LABEL> <INPUT
				type="text" name="AltPhoneNo"><BR>
			<br> <LABEL for="street"> Street </LABEL> <INPUT type="text"
				name="Street"><BR>
			<br> <LABEL for="city"> City </LABEL> <INPUT type="text"
				name="City"><BR>
			<br> <LABEL for="state"> State </LABEL> <INPUT type="text"
				name="State"><BR>
			<br> <LABEL for="zip"> Zip </LABEL> <INPUT type="text" name="Zip"><BR>
			<br> <INPUT type="submit" value="Submit">
		</P>
	</FORM>
</body>
</html>