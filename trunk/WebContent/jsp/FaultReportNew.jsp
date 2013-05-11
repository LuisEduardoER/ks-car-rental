<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.Calendar" %>
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
