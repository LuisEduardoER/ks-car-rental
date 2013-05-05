<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<link rel="stylesheet" href="../CSS/main.css" />
<title>ReturnCar</title>
</head>
<body onLoad="javascript:init_navigation();" bgcolor="#A9F5E1">
	<div id="top">
		<a href="http://localhost:8080/CarRental/AboutUs.html" link="About-Us">About Us</a> <span>&nbsp;|&nbsp;</span>
		<a href="http://localhost:8080/CarRental/ContactUs.html" link="Contact-Us">Contact Us</a> <span>&nbsp;|&nbsp;</span>
		<a href="http://localhost:8080/CarRental/Help.html" link="Help">Help</a>
	</div>
	<div id="navigation">
		<ul id="nav">
			<li id="active">
				<div>
					<!-- based on the classtype chosen, display charges for that -->
					<a href="http://localhost:8080/CarRental/classtype.html" link="Rent-a-Car">Rent a Car</a>
				</div>
				<ul id="activeUL">
					<li><a href="" link="Vehicles">Vehicles</a></li>
					<li><a href="" link="Locations">Rental Locations</a></li>
					<li><a href="" link="Print-Your-Receipt">Print Your
							Receipt</a></li>
					<li><a href="" link="Cancel-Reservation">Cancel A
							Reservation</a></li>
				</ul>
			</li>
			<li class="secondary">
				<div>
					<a href="" link="Return-a-Car">Return a Car</a>
				</div>
				<ul id="activeUL">
					<li><a href="" link="Fault-Report">Fault Report</a></li>
					<li><a href="" link="View-Cost">View Cost</a></li>
				</ul>
			</li>
		</ul>
	</div>	<br><br>
	
<form action="FaultReport.jsp" method="post">	
<table border="1" bordercolor="#660000" style="background-color:#A4A2A2" width="500" cellpadding="3" cellspacing="3" >
<thead>
    <tr>
      <th>AgreementNumber</th>
      <th>RentalDate</th>
   	<th>ReturnDate</th>
   	<th>FirstName</th>
    <th>LastName</th>
   </tr>
<%

String phone = null;
//declare a connection by using Connection interface 
Connection connection = null; 
ResultSet results = null;
try {
phone = (String)request.getParameter("primaryPhoneNo");
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
statement = (PreparedStatement)connection.prepareStatement("select * from RentalAgreement R,Customer C where C.SSN= R.SSN and C.PrimaryPhoneNo =? and R.Returned = false" );
if(!connection.isClosed()){
statement.setString(1, phone);
results = statement.executeQuery();
}
while (results.next()) {%>
<TR>
<TD> <%=results.getInt("AgreementNo")%> </TD>
<TD> <%=results.getString("RentalDate")%></TD>
<TD> <%=results.getString("ReturnDate")%></TD>
<TD> <%=results.getString("FName")%></TD>
<TD> <%=results.getString("LName")%></TD>
<TD><input type="checkbox" name="Return" value="<%=results.getInt(1)%>"></TD></TR>
<%
}
}
catch (ClassNotFoundException e) {
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
}
%>
</table>
<input type="submit" value="Submit" class="submit50">
</form>
<br/><br/>
<div align="left" style="height:450px;width:500px;border:1px solid #ccc;font:14px/18px Georgia, Garamond, Serif; background-color:#CCCC99; overflow:auto;">
General Rental Information
The renter and the driver have to be in possession of a valid driving licence.
Driving licences from non-EU countries (except Switzerland) are accepted if:
a) no visa has been entered in the passport. 
b) the customer has a visa in his passport and at the time of hire has not been in Europe for longer than 6 months. If he has been in Europe for longer than 6 months, he must present a driving licence from an EU country.
Driving license printed with non Roman Alphabet (Arabic, Chinese, Japanese, Cyrillic etc) must be complemented by an International driving licence.
Please show your driver's license, a valid ID card or passport (ID card with a German address absolutely requried when renting using a German giro card) at time of pick up!
Special rental information by booking of Prepaid rates
Changing booking
A booking can be changed up to 48 hours before the start of the rental (on availability) in return for an alteration charge of EUR 20.00. Any payment already made towards the rental will not be refunded; nor shall any differential amount be refunded if this alteration leads to a lesser rental cost.
Cancellation
A booking can be cancelled before the start of the rental. In the event of cancellation, the payment already made towards the rental will be paid back subject to a cancellation charge. The cancellation charge shall be the amount of the rental charge ( including any extras and charges) for a maximum of 3 rental days. Cancellations can be made online (www.sixt.de/meinsixt/)or in writing and must be addressed to: Sixt GmbH & Co. Autovermietung KG, Trelleborger Straﬂe 9, D-18107 Rostock, Fax: +49(0)381/80 70 55 67, E-Mail: reservierung@sixt.de
No-show
In the event that the booked vehicle is not collected or not collected at the agreed time, the rental charge already paid shall be withheld in full.
Age Restrictions
In Germany, the following rules apply for the minimum age and possession of a driver's licence:
18 years/1 day for vehicles in groups MBMR to CWMR, MTMR, CCCC
21 years/2 years for vehicles in groups IDMR to LWAR, CTMR, ITMR, SSMR to LSMR, SFMR to FFMR
21 years/3 years for vehicles in groups M01 to M06
25 years/3 years for vehicles in groups XDAR, STMR, FTMR, PTMR, LTMR, XTMR, XTAR, XSMR, XSAR, PFMR, LFMR, XFAR, LSMN, LSAN, LTAN, XJAN, XSAN, XXAX,XTAX, LTAX, XDAN, XSAM, XNAM, XTAM, XEAM, XRAM, LPAN
25 years/5 years for vehicles in groups M07 and M08.
A Young Driver Surcharge of EUR 10.- per day, max. EUR 50.- per month started applies for drivers under 23 years.
Conditions of Payment
Flexi Tariff
We accept all credit cards from internationally recognised credit card companies - such as American Express, Diners Club, Eurocard/Mastercard, Visa, JCB.
We do not accept any prepaid cards or debit cards (Visa Electron).
Vehicles from the PDMR group and higher as well as Special Cars can only be hired with a credit card accepted by Sixt or a Sixt credit/identification means. All other vehicle groups as well as Convertibles from the MTMR, CTMR and ITMR groups and Offroaders from the SFMR and FFMR groups can also be hiredwith a German girocard. 
Girocards cannot be used to pay for long-term hiring.
Prepaid Tariff
The following credit cards are accepted: Eurocard/Mastercard, AmericanExpress Card, VISA Card, Diners Card and JCB.
We do not accept any prepaid cards or debit cards (Visa Electron).
The renter must be the owner of the indicated credit card. The authorised driver details and method of payment will be confirmed at reservation stage and cannot be amended. The confirmed credit card should be valid and available for presentation on collection of the vehicle. All extra costs that occur during the car rental will be charged to this credit card.
By booking a prepaid rate, the credit card will be charged before the start of rental, directly with the estimated total amount of rental. The amount that will be charged on your credit card comprises the price of the rental as well as all additional extra fees.
The rental charge (plus any other charges agreed, e.g. exemptions from liability, delivery charges, airport charges etc.) plus Value Added Tax in the statutory amount applicable from time to time must, as a matter of principle, be paid in full for the agreed rental period, i.e. if the vehicle is collected late or returned early there shall be no refund.
Generally
A deposit of up to three times the hire price is charged to the chosen means of payment as a security. The deposit for high-value vehicles may differ. The exact deposit is determined on collection since the amount is dependent on the vehicle.
General Insurance Conditions
Third Party Insurance (TI)
Insurance coverage for the vehicle rented includes Third Party Liability with a maximum cover of EUR 50 Mill for personal injuries and material damages. Maximum cover for personal injuries is EUR 8 Mill per injured person and is limited to Europe only.
Excluded from the insurance is the use of the vehicle for the transport of dangerous goods. All insurance cover as part of the rental contract will become void, in particular, if an unauthorized driver has used the vehicle or if the driver of the vehicle does not possess the required driver's licence at the time of the event giving rise to claim.
Loss Damage Waiver (LDW)
Loss Damage Waiver removes the drivers responsibility to a part of the vehicle in case of damage or theft.
If LDW is not accepted the customer will be held liable for the full value of the car.
If LDW is accepted, customer is only responsible for the following amounts: EUR 850.- (MBMR to SDMR, CWMR, IWMR,SWMR, CXMR, IXMR, SXMR, CYMR, IYMR, MTMR, CCCC) / EUR 1,050.- (FDMR to XDAR, IVMR, SVMR, FVMR, FWMR, PWMR, LWAR, FYMR, FXMR, CTMR to XTAR, SSMR to XSAR, SFMR to XFAR)/ EUR 1,500.- (LTAN, LSAN, XXAX, XTAX, LTAX, LSMN, XJAN, XSAN, XDAN, XSAM, XNAM, XTAM, XEAM, XRAM, LPAN and M01 to M08).
Personal Accident Insurance (PAI)
By taking out personal accident insurance coverage can also be extended to cover the consequences of an accident.
By taking out PAI the limit of liability is: 
EUR 50,000.- for invalidity,
EUR 25,000.- for decease,
EUR 1,000.- for medical costs. 
</div>
</body>
</html>