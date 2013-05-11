<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
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
            	<h1>Home</h1>
            </div>
            
           	<div class="main_body">
		<br><br>
<%
String agreementNo, checkDate, checkTime, mileageAfterRental,gasolineLevel,faultDetails, costEstimate,comments = null;
Integer employeeNo = null;
agreementNo = request.getParameter("element_1");
checkDate=request.getParameter("element_2_3")+"_"+request.getParameter("element_2_1")+"_"+request.getParameter("element_2_2");
checkTime= request.getParameter("element_3_1")+":"+request.getParameter("element_3_2")+":"+request.getParameter("element_3_3");
mileageAfterRental= request.getParameter("element_4");
gasolineLevel = request.getParameter("element_10");
faultDetails = request.getParameter("element_6").trim();
costEstimate= request.getParameter("element_7_1")+"."+request.getParameter("element_7_2");
employeeNo = Integer.parseInt((String)request.getParameter("element_8"));
comments = request.getParameter("element_9").trim();
//declare a connection by using Connection interface 
Connection connection = null; 
ResultSet results = null;
int noOfRows = 0;
try {
/* Create string of connection url within specified format with machine name, 
port number and database name. Here machine name id localhost and database name 
is usermaster. */ 
String connectionURL = "jdbc:mysql://sql2.njit.edu:3306/ss984"; 
PreparedStatement statement = null;
// Load JBBC driver "com.mysql.jdbc.Driver". 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
/* Create a connection by using getConnection() method that takes parameters of 
string type connection url, user name and password to connect to database. */ 
connection = DriverManager.getConnection(connectionURL, "ss984", "xtlHyPSEC");
// check weather connection is established or not by isClosed() method 

if(!connection.isClosed()){
statement = (PreparedStatement)connection.prepareStatement("insert into FaultReport(AgreementNo,CheckDate,CheckTime,MileageAfterRental,GasolineLevel,FaultDetails,CostEstimate,EmpNo, Comments) values(?,?,?,?,?,?,?,?,?)");
statement.setString(1,agreementNo);
statement.setString(2,checkDate);
statement.setString(3,checkTime);
statement.setString(4,mileageAfterRental);
statement.setString(5,gasolineLevel);
statement.setString(6,faultDetails);
statement.setString(7,costEstimate);
statement.setInt(8,employeeNo);
statement.setString(9,comments);

noOfRows = statement.executeUpdate();
if(noOfRows== 1){%>
<span style="font-family:Georgia;font-size:20px;font-style:italic;font-weight:normal;text-decoration:none;text-transform:none;color:990000;">
Report generated successfully
</span>
<% statement = (PreparedStatement)connection.prepareStatement("select ReportID from FaultReport where AgreementNo = ?");
statement.setString(1,agreementNo);
results = statement.executeQuery();
if(results.next()){ 
 %>
<br><br>
<span style="font-family:Georgia;font-size:20px;font-style:italic;font-weight:normal;text-decoration:none;text-transform:none;color:990000;">
Generated Report ID for your reference is:
</span>
<span style="font-family:Georgia;font-size:20px;font-style:italic;font-weight:normal;text-decoration:none;text-transform:none;color:990000;">
<%out.println(results.getString("ReportID"));%>
</span> 
<br><br>
<input type="button" value="OK" onClick = "../home.html"/>
<% }
}
}}catch (ClassNotFoundException e) {
System.out.println("Oops I can't find the JDBC Driver!");
e.printStackTrace();
}
catch (SQLException e) {
System.out.println("There was a problem with the SQL!");
e.printStackTrace();
}
finally {
if (connection != null) {
try {
	connection.close();
}
catch(Exception e){
e.printStackTrace();
}
}
}%>
		
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
