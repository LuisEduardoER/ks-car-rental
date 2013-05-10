<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="rentalPeriod"
	class="com.njit.cs631.ks.car.RentalAgreement" scope="session">
</jsp:useBean>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Your Rental Agreement is almost ready.</h1>
	
	<%
	String creditCardExpiryDate = request.getParameter("creditCardExDate").trim();
	java.util.Date expDate = new SimpleDateFormat("MM/YY").parse(creditCardExpiryDate);
	//out.println(expDate);
	String creditCardNum = request.getParameter("creditCardNum").trim();
	rentalPeriod.setCreditCardExpDateStr(creditCardExpiryDate);
	rentalPeriod.setCreditCardNo(creditCardNum);
	rentalPeriod.signUpRentalAgreement();
	%>
	
</body>
</html>