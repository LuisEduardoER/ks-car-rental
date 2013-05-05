<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.Calendar" %>
<html>
<head>
<link rel="stylesheet" href="../CSS/main.css" />
<link rel="stylesheet" type="text/css" href="../CSS/view.css" media="all">
<script type="text/javascript" src="../Js/view.js"></script>
<script type="text/javascript" src="../Js/calendar.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FaultReport</title>
</head>
<body id="main_body" onLoad="javascript:init_navigation();" bgcolor="#A9F5E1">
	
		<div id="top">
		<a href="http://localhost:8080/CarRental/AboutUs.html" link="About-Us">About Us</a> <span>&nbsp;|&nbsp;</span>
		<a href="http://localhost:8080/CarRental/ContactUs.html" link="Contact-Us">Contact Us</a> <span>&nbsp;|&nbsp;</span>
		<a href="http://localhost:8080/CarRental/Help.html" link="Help">Help</a>
	</div>
	<div id="navigation">
		<ul id="nav">
			<li id="active">
				<div>
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
	</div><br><br>
	<%String[] selected= (String[])request.getParameterValues("Return");
	Integer checked = Integer.parseInt(selected[0]);
	Calendar now= Calendar.getInstance();
	%>
	<div id="form_container">
<form id="form_624877" class="appnitro"  method="post" action="GenerateFaultReport.jsp" color="A4A2A2">
			<ul >
			
					<li id="li_1" >
		<label class="description" for="element_1">Agreement Number
 </label>
		<div>
			<input id="element_1" name="element_1" class="element text medium" type="text" maxlength="255" value="<%=checked%>"/> 
		</div> 
		</li>		<li id="li_2" >
		<label class="description" for="element_2">Check Date </label>
		<span>
			<input id="element_2_1" name="element_2_1" class="element text" size="2" maxlength="2" value="<%=now.get(Calendar.MONTH)%>" type="text"/>
			<label>MM</label>
		</span>
		<span>
			<input id="element_2_2" name="element_2_2" class="element text" size="2" maxlength="2" value="<%=now.get(Calendar.DAY_OF_MONTH)%>" type="text"/> 
			<label>DD</label>
		</span>
		<span>
	 		<input id="element_2_3" name="element_2_3" class="element text" size="4" maxlength="4" value="<%=now.get(Calendar.YEAR)%>" type="text"/>
			<label>YYYY</label>
		</span>
	
	<!--  <span id="calendar_2">
			<img id="cal_img_2" class="datepicker" src="../Images/calendar.gif" alt="Pick a date.">	
		</span> -->	
	<!--  	<script type="text/javascript">
			Calendar.setup({
			inputField	 : "element_2_3",
			baseField    : "element_2",
			displayArea  : "calendar_2",
			button		 : "cal_img_2",
			ifFormat	 : "%B %e, %Y",
			onSelect	 : selectDate
			}); 
		</script>-->
		 
		</li>		<li id="li_3" >
		<label class="description" for="element_3">Check Time </label>
		<span>
			<input id="element_3_1" name="element_3_1" class="element text " size="2" type="text" maxlength="2" value="<%=now.get(Calendar.HOUR)%>"/> : 
			<label>HH</label>
		</span>
		<span>
			<input id="element_3_2" name="element_3_2" class="element text " size="2" type="text" maxlength="2" value="<%=now.get(Calendar.MINUTE)%>"/> : 
			<label>MM</label>
		</span>
		<span>
			<input id="element_3_3" name="element_3_3" class="element text " size="2" type="text" maxlength="2" value="<%=now.get(Calendar.SECOND)%>"/>
			<label>SS</label>
		</span>
		<!-- <span>
			<select class="element select" style="width:4em" id="element_3_4" name="element_3_4">
				<option value="AM" >AM</option>
				<option value="PM" >PM</option>
			</select>
			<label>AM/PM</label>
		</span>  -->
		</li>		<li id="li_4" >
		<label class="description" for="element_4">Mileage after return </label>
		<div>
			<input id="element_4" name="element_4" class="element text medium" type="text" maxlength="10" value=""/> 
		</div> 
		</li>		<li id="li_10" >
		<label class="description" for="element_10">Gasoline level </label>
		<div>
			<input id="element_10" name="element_10" class="element text medium" type="text" maxlength="3" value=""/> 
		</div> 
		</li>		<li id="li_6" >
		<label class="description" for="element_6">Fault Details </label>
		<div>
			<textarea id="element_6" name="element_6" class="element textarea medium" maxlength="50"></textarea> 
		</div> 
		</li>		<li id="li_7" >
		<label class="description" for="element_7">Cost Estimate </label>
		<span class="symbol">$</span>
		<span>
			<input id="element_7_1" name="element_7_1" class="element text currency" size="10" value="" type="text" /> .		
			<label for="element_7_1">Dollars</label>
		</span>
		<span>
			<input id="element_7_2" name="element_7_2" class="element text" size="2" maxlength="2" value="" type="text" />
			<label for="element_7_2">Cents</label>
		</span>
		 
		</li>		<li id="li_8" >
		<label class="description" for="element_8">Checked by Employee Number </label>
		<div>
			<input id="element_8" name="element_8" class="element text medium" type="text" maxlength="255" value=""/> 
		</div> 
		</li>		<li id="li_9" >
		<label class="description" for="element_9">Comments </label>
		<div>
			<textarea id="element_9" name="element_9" class="element textarea medium" maxlength="50"></textarea> 
		</div> 
		</li>
			</ul>
		<input type="submit" value="GenerateFaultReport"/>
		</form>	
	</body>
</html>
</body>
</html>