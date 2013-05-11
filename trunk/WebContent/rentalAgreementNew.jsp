<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<%@ page import="java.lang.Object"%>
<%@ page import="com.njit.cs631.ks.server.*"%>
<%@ page import="com.njit.cs631.ks.car.*"%>

<jsp:useBean id="selectedClassType"
	class="com.njit.cs631.ks.Insurance.RentalInsurance" scope="session">
	<jsp:getProperty name="selectedClassType" property="selectedCarClass" />
</jsp:useBean>

<jsp:useBean id="inputphonenum"
	class="com.njit.cs631.ks.customer.Customer" scope="session">
</jsp:useBean>

<jsp:useBean id="rentalPeriod"
	class="com.njit.cs631.ks.car.RentalAgreement" scope="session">
	<jsp:getProperty name="rentalPeriod" property="rentalDateStr" />
	<jsp:getProperty name="rentalPeriod" property="returnDateStr" />
	<jsp:setProperty name="rentalPeriod" property="*" />
</jsp:useBean>

<jsp:useBean id="insurance"
	class="com.njit.cs631.ks.Insurance.Insurance" scope="session">
	<jsp:getProperty name="insurance" property="insuranceType" />
</jsp:useBean>

<jsp:useBean id="insPolicyNum"
	class="com.njit.cs631.ks.Insurance.PersonalInsurance" scope="session">
	<jsp:getProperty name="insPolicyNum" property="insPolicyNo" />
</jsp:useBean>

<jsp:useBean id="rentalInsPolicyNum"
	class="com.njit.cs631.ks.Insurance.RentalInsurance" scope="session">
	<jsp:getProperty name="rentalInsPolicyNum" property="insPolicyNo" />
</jsp:useBean>

<jsp:useBean id="ccInsPolicyNum"
	class="com.njit.cs631.ks.Insurance.CreditCardInsurance" scope="session">
	<jsp:getProperty name="ccInsPolicyNum" property="insPolicyNo" />
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
            	<h1>Rent a Car</h1>
            </div>
            
           	<div class="main_body">
		<form action="finalPage.jsp">
		<label for="ccno"> Enter your Credit Card# </label> <input type="text"
			name="creditCardNum"><BR> <br></br> <label for="cced">
			Expiry Date </label> <input type="text" name="creditCardExDate"><BR>
		<input type="submit" value="Submit">
	</form>

	<%
				Connection con = null;
				String url = "jdbc:mysql://sql2.njit.edu:3306/";
				String dbName = "ss984";
				String driver = "com.mysql.jdbc.Driver";
				String userName = "ss984";
				String password = "xtlHyPSEC";

				java.lang.Class.forName(driver).newInstance();
				con = DriverManager.getConnection(url + dbName, userName, password);				
					
					String classType = selectedClassType.getSelectedCarClass();
					
					if(insurance.getInsuranceType() == "PersonalInsurance")						
						%>
	
	<%
						if(insurance.getInsuranceType() == "RentalInsurance")							
							%>
	
	<%
						if(insurance.getInsuranceType() == "CCInsurance")							
							%>
	
	<%
		String policyNum = "";
		java.util.Date startRental = null;
		java.util.Date endRental = null;
		double discount = 0;
		boolean pa = false, pe = false, li = false;
		long rentalDuration = 0;
		double pricePerDay = 0;
		double rentalPrice = 0;
		boolean returned = false;
		String select[] = new String[]{};
		rentalDuration =
				Util.calculateDays(rentalPeriod.getRentalDateStr(),
				rentalPeriod.getReturnDateStr()) + 1;
				pricePerDay = 0;
				String queryPricePerDay = "select RentalChargePerDay from Class where ClassType = '" + classType + "'";
				PreparedStatement stt = (PreparedStatement) con
				.prepareStatement(queryPricePerDay);
				ResultSet rst = stt.executeQuery();
				while (rst.next())
				{
				pricePerDay = rst.getDouble(1);
				}
				if(rentalDuration > Util.numOfDaysInMonth)
				discount = Util.monthsRentDiscount;
				else if(rentalDuration > Util.numOfDaysInWeek)
				discount = Util.weeksRentDiscount;
				else
				discount = Util.daysRentDiscount;
		if(insurance.getInsuranceType() == "PersonalInsurance")								
		{
			policyNum = insPolicyNum.getInsPolicyNo();
			rentalPrice =
			inputphonenum.getUtil().getRentalPrice(pe, pa, li, classType,
			rentalDuration, pricePerDay);

		}
		else if (insurance.getInsuranceType() == "RentalInsurance") 
		{
			policyNum = rentalInsPolicyNum.getInsPolicyNo();
			select = request.getParameterValues("id");
			if (select != null && select.length != 0) 
			{
				for (int i = 0; i < select.length; i++) 
				{
					String rVal = select[i].trim();

					if (rVal.equalsIgnoreCase("PE"))
						pe = true;
					else if (rVal.equalsIgnoreCase("PA"))
						pa = true;
					else if (rVal.equalsIgnoreCase("LI"))
						li = true;
				}
			}
		
			startRental = new SimpleDateFormat("YYYYMMDD").parse(rentalPeriod.getRentalDateStr());
			endRental = new SimpleDateFormat("YYYYMMDD").parse(rentalPeriod.getReturnDateStr());
			
		 	/*rentalDuration = Util.calculateDays(rentalPeriod.getRentalDateStr(), rentalPeriod.getReturnDateStr()) + 1; //including the day the car is rented.
		
		
			pricePerDay = 0;
			String queryPricePerDay = "select RentalChargePerDay from Class where ClassType = '"
				+ classType + "'";
			PreparedStatement stt = (PreparedStatement) con
				.prepareStatement(queryPricePerDay);
			ResultSet rst = stt.executeQuery();
			while (rst.next()) 
			{
				pricePerDay = rst.getDouble(1);			
			}*/
				
			rentalPrice = inputphonenum.getUtil().getRentalPrice(pe, pa, li, classType, rentalDuration, pricePerDay);
		
			/*if(rentalDuration > Util.numOfDaysInMonth)
			  discount = Util.monthsRentDiscount;
		  	else if(rentalDuration > Util.numOfDaysInWeek)
			  discount = Util.weeksRentDiscount;
		  	else
			  discount = Util.daysRentDiscount;*/
		}
		else if (insurance.getInsuranceType() == "CCInsurance")
		{
			policyNum = ccInsPolicyNum.getInsPolicyNo();
			pe = false;
			pa = false;
			li = false;
			rentalPrice =
			inputphonenum.getUtil().getRentalPrice(pe, pa, li, classType,
			rentalDuration, pricePerDay);
		}
			
		String custPhoneNo = inputphonenum.getPrimaryPhoneNo();
			
		String custSSN = "";		
		Double milesBeforeRental = 0.0;
		String licState = "", licNum = "";		

		String querySSN = "select SSN from Customer where PrimaryPhoneNo = '"
			+ custPhoneNo + "'";
		PreparedStatement st = (PreparedStatement) con
			.prepareStatement(querySSN);
		ResultSet rs = st.executeQuery();
		while (rs.next()) 
		{
			custSSN = rs.getString(1);
		
		}

			String queryCar = "select LicenseState, LicenseNo from Car where ClassType = '"
			+ classType + "'";
			PreparedStatement stmt = (PreparedStatement) con.prepareStatement(queryCar);
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				licState = result.getString(1);
				licNum = result.getString(2);
			}

			String queryMiles = "select milesBeforeRental from Car where LicenseState = '"
			+ licState + "' and LicenseNo = '" + licNum + "'";
			PreparedStatement stm = (PreparedStatement) con.prepareStatement(queryMiles);
			ResultSet results = stm.executeQuery();
			while (results.next()) {
				milesBeforeRental = results.getDouble(1);
			}
			
		
		
		
		try
		{
					
		rentalPeriod.setLicenceState(licState);
		rentalPeriod.setLincenceNum(licNum);
		rentalPeriod.setSSN(custSSN);
		rentalPeriod.setDiscount(discount);
		rentalPeriod.setPolicyNum(policyNum);
		
		rentalPeriod.setRentalDate(startRental);
		rentalPeriod.setRentalDate(endRental);
		rentalPeriod.setNoOfDays((int)rentalDuration);
		rentalPeriod.setMileageBeforeRental(milesBeforeRental);
		
		rentalPeriod.setLiabilityCoverage(li);
		rentalPeriod.setPersonalAccidentCoverage(pa);
		rentalPeriod.setPersonalEffectCoverage(pe);
		rentalPeriod.setRentalPrice(rentalPrice);
		rentalPeriod.setPricePerDay(pricePerDay);
		
		
			
		} catch (Exception exp) {
			//out.println(exp.toString());
		}
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

