<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<jsp:useBean id="inputphonenum" class="com.njit.cs631.ks.customer.Customer"
scope="session">
<jsp:setProperty name="inputphonenum" property="*" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<title>KS Car Rental</title>
</head>

<body>
    <div id="page">
      <div id="pagetop">
		<h1>KS Car Rental</h1>
        <div class="links">    	
             <ul>
                <li><a href="http://localhost:8080/CarRental/Help.html">Help</a></li>
                <li><a href="http://localhost:8080/CarRental/ContactUs.html">Contact Us</a></li>
                <li><a href="http://localhost:8080/CarRental/AboutUs.html">About</a></li>
                <li><a href="http://localhost:8080/CarRental/ReturnCar.html">ReturnCar</a></li>
               	<li><a href="http://localhost:8080/CarRental/home.html">RentCar</a></li>
           	   	<li><a href="http://localhost:8080/CarRental/Welcome.html">Home</a></li>
                
            </ul>
		
        </div>
     </div>
        
        <div id="header">   Reach the Road to success     </div>
  
<div id="main">
	<div class="content">
        	<div class="main_top">
            	<h1></h1>
            </div>
            
           	<div class="main_body">
<%
		String inputPhoneNo = (request.getParameter("phoneNo")).trim();
	%>
	<jsp:setProperty name="inputphonenum" property="primaryPhoneNo" value='<%= inputPhoneNo %>' />
	
	<%

	//out.println("In validateCustomer.jsp from bean " + inputssn.getSSN());
	//out.println("In validateCustomer.jsp from request " + inputSSN);
	
		Connection con = null;
		String url = "jdbc:mysql://sql2.njit.edu:3306/";
		String dbName = "ss984";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "ss984";
		String password = "xtlHyPSEC";

		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url + dbName, userName, password);
		
		String querySSN = "select * from Customer where PrimaryPhoneNo = '" + inputPhoneNo + "'";
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(querySSN);
		ResultSet result = stmt.executeQuery();
		if(!result.next()) {
             out.println("Sorry, we feel you are not an existing customer.. ");  
             %>
	<form action="customerDetails.jsp" method="post">
		<button type="submit"> Cancel </button>
	</form>
	<%
			}
             else {
            	 out.println("Welcome Back!!");
             		
      %>
      
      <TABLE BORDER="1">
		<TR>
			<TH>SSN</TH>			
			<TH>FirstName</TH>
			<TH>LastName</TH>
			<TH>PrimaryPhoneNo</TH>
			<TH>AlternatePhoneNo</TH>
			<TH>Street</TH>
			<TH>City</TH>
			<TH>State</TH>
			<TH>Zip</TH>
			<TH>Discount</TH>
		</TR>
		<TR>
			<TD> <%= result.getString(1) %></TD>
			<TD> <%= result.getString(2) %></TD>
			<TD> <%= result.getString(3) %></TD>
			<TD> <%= result.getString(4) %></TD>
			<TD> <%= result.getString(5) %></TD>
			<TD> <%= result.getString(6) %></TD>
			<TD> <%= result.getString(7) %></TD>
			<TD> <%= result.getString(8) %></TD>
			<TD> <%= result.getString(9) %></TD>
			<TD> <%= result.getString(10) %></TD>			
		</TR>
	</TABLE>


	
	<br></br>
	<form action="insurance.jsp" method="post">
		<button type="submit">Continue</button>
	</form>
	<br>
	<br>

	<form action="customerDetails.jsp" method="post">
		<button type="submit">Cancel</button>
	</form>

	<%
             }
		stmt.close();
	%>
		</div>


             	</div>
            <div class="clear">&nbsp;</div>
        </div>
<div id="footer">
        <p>copyright protected KS Car Rental</p>
        </div>        
        
        
        
        </div>
</body>
</html>
