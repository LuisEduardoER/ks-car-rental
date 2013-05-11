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
<table>
<FORM action="insertFromCreditCardInsurance.jsp" method="post">
		
		<tr>
			<td>	
			<LABEL for="InsPolicyNo"> InsurancePolicyNo </LABEL> </td>
			<td>
			<INPUT type="text" name="CreditCardNo"> 
			</td>
		</tr>
		<tr>
		<td>
			<LABEL for="InsProviderName"> InsuranceProviderName </LABEL> 
			</td>
			<td>
			<INPUT type="text" name="InsProviderName"></td>
		</tr>
		<tr>
			<td>
			<LABEL for="ServicePhoneNo"> Service Phone No </LABEL></td>
			
			<td> 
			<INPUT type="text" name="ServicePhoneNo"> 
			</td>
		</tr>
		<tr>
			<td align="center">
			<INPUT type="submit" value="Submit">
		</td>
		</tr>
	</FORM>
</table>
</body>
</html>