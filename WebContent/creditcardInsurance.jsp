<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Credit Card Insurance</title>
</head>
<body bgcolor="#A9F5E1">


	
<h1>Please enter the following details</h1>
<FORM action="insertFromCreditCardInsurance.jsp" method="post">
		<P>
			
			<LABEL for="InsPolicyNo"> InsurancePolicyNo </LABEL> 
			<INPUT type="text" name="CreditCardNo"> <br> <BR> 
			<LABEL for="InsProviderName"> InsuranceProviderName </LABEL> 
			<INPUT type="text" name="InsProviderName"><BR>
			<LABEL for="ServicePhoneNo"> Service Phone No </LABEL> 
			<INPUT type="text" name="ServicePhoneNo"> <br> <BR>
			<br> <INPUT type="submit" value="Submit">
		</P>
	</FORM>

</body>
</html>