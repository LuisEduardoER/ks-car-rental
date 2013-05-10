package com.njit.cs631.ks.server;

import java.io.IOException;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.njit.cs631.ks.http.RequestHelper;
import com.njit.cs631.ks.http.Response;
import com.njit.cs631.ks.Insurance.Insurance;
import com.njit.cs631.ks.Insurance.Insurance.InsType;
import com.njit.cs631.ks.Insurance.RentalInsurance;
import com.njit.cs631.ks.car.*;
import com.njit.cs631.ks.car.Class;
import com.njit.cs631.ks.car.Class.ClassType;
import com.njit.cs631.ks.customer.Customer;
import com.njit.cs631.ks.*;

// TODO: Auto-generated Javadoc
/**
 * created by Krithika
 * 
 * The Class RentCarServlet is used to Rent A Car by a given user.
 * 
 * 
 */

@SuppressWarnings("serial")
public class RentCarServlet extends HttpServlet {

	
		/* (non-Javadoc)
		 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
		 */
		public void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {

			// this is the default response, we'll change it to OK
			// when we finish if everything goes fine
			Response.Status status = Response.Status.ERROR;
			String responseMessage = "Fatal Error";

			// we'll store the parsed JSON string here
			JSONObject json;

			// This handler will help us to read
			// the contents of body of the HTTP Request
			String httpRequestBody = null; // here we'll store the content

			ClassType classType;
			String customerPhoneNo, creditCardNo, insPolicyNo, insProviderName, servicePhoneNo;
			InsType insType;
			Date startRental, endRental, creditCardExpiry;
			Boolean peCoverage, paCoverage, liCoverage;
			
			Car car = null;
			Insurance ins = null;
			RentalInsurance rentalIns = null;
			Customer customer = null;
			Class carClass = null;
			RentalAgreement rentalAgreement = null;
			peCoverage=paCoverage=liCoverage=null;
			insPolicyNo = insProviderName = servicePhoneNo = null;
			
			try {

				// get the content of the body the HTTP Request as a String
				httpRequestBody = RequestHelper.getContentOfHttpBody(req);

				// convert the JSON string to an object and collect the data
				json = (JSONObject) new JSONParser().parse(httpRequestBody);
				String tempClassType = (String) json.get("classType");
				classType = null;
				switch(tempClassType){
				case "Compact":
					classType = ClassType.Compact;
					break;
				case "Intermediate":
					classType = ClassType.Intermediate;
					break;
				case "FullSize":
					classType = ClassType.FullSize;
					break;
				case "CargoVan":
					classType = ClassType.CargoVan;
					break;
				case "Standard":
					classType = ClassType.Standard;
					break;
				case "SportUtility":
					classType = ClassType.SportUtility;
					break;
				case "MiniVan":
					classType = ClassType.MiniVan;
					break;
				case "Truck":
					classType = ClassType.Truck;
					break;
				case "Premium":
					classType = ClassType.Premium;
				}
				customerPhoneNo = (String)json.get("customerPhoneNo");
				String startRentalString = (String)json.get("startRental");
				startRental = new SimpleDateFormat("MM/DD/YYYY").parse(startRentalString);
				//String rentalDate = formatter.format(startRental);
				String endRentalString = (String)json.get("endRental");
				endRental =  new SimpleDateFormat("MM/DD/YYYY").parse(endRentalString);
				//String returnDate = formatter.format(endRental);
				if(json.containsKey("personalAccidentCoverage"))
					paCoverage = (Boolean)json.get("personalAccidentCoverage");
				if(json.containsKey("personalAccidentCoverage"))
					peCoverage = (Boolean)json.get("personalEffectCoverage");
				if(json.containsKey("liCoverage"))
					liCoverage = (Boolean)json.get("liCoverage");
				creditCardNo = (String)json.get("creditCardNo");
				String creditCardExpiryString = (String)json.get("creditCardExpiry");
				creditCardExpiry = new SimpleDateFormat("MM/YYYY").parse(creditCardExpiryString);
				//String Expiry = formatter.format(creditCardExpiry);
				String tempInsType = (String)json.get("insuranceType");
				insType = null;
				switch(tempInsType){
				case "RentalInsurance":
					insType = InsType.RentalInsurance;
					break;
				case "PersonalInsurance":
					insType= InsType.PersonalInsurance;
					break;
				case "CreditCardInsurance":
					insType = InsType.CreditCardInsurance;
				}
				
				if(!insType.equals(InsType.RentalInsurance)){
					insPolicyNo = (String)json.get("insurancePolicyNo");
					insProviderName = (String)json.get("insuranceProviderName");
				}
				if(insType.equals(InsType.CreditCardInsurance))
					servicePhoneNo = (String)json.get("servicePhoneNo");
				
				if (classType == null) {
					throw new IllegalArgumentException("Class not selected");
				}	
				if(!insType.equals(InsType.RentalInsurance) && insPolicyNo.equals(null)){
					throw new IllegalArgumentException("Policy No is null");
				}
				if(!insPolicyNo.equals(null)){
					if(insProviderName.equals(null))
						throw new IllegalArgumentException("Insurance Provider Name is not given");
					if(insType.equals(InsType.CreditCardInsurance) && servicePhoneNo.equals(null))
						throw new IllegalArgumentException("Credit Card Service Phone No is null");
				}
				if(customerPhoneNo == null){
					 new IllegalArgumentException("Phone No is null");
				}
					
				customer = new Customer();
				customer.getUtil().open();
				customer = customer.getCustomer(customerPhoneNo);
				car = new Car();
				car.getUtil().open();
				car = car.getOneCar(classType);
				carClass.getUtil().open();
				carClass = carClass.getClassEntity();
				if(!insType.equals(InsType.RentalInsurance)){
				ins = new Insurance();
				ins.setPolicyNo(insPolicyNo);
				ins.setInsProviderName(insProviderName);
				ins.setType(insType);
				ins.setServicePhoneNo(servicePhoneNo);
				ins.getUtil().open();
				ins.createInsurance();
				}
				else{
				rentalIns = new RentalInsurance();	
				rentalIns.getUtil().open();
				rentalIns = rentalIns.getInsurance(classType);
				ins = new Insurance();
				ins.setPolicyNo(rentalIns.getInsPolicyNo());
				ins.setInsProviderName(rentalIns.getInsProviderName());
				ins.setType(InsType.RentalInsurance);
				}
				if(customer.equals(null)|| car.equals(null) || carClass.equals(null) || rentalIns.equals(null)|| ins.equals(null))
					throw new SQLException();
				//car.createCar(car);
				else{
					rentalAgreement = new RentalAgreement();
					rentalAgreement.setCar(car);
					rentalAgreement.setClassType(carClass);
					rentalAgreement.setCustomer(customer);
					rentalAgreement.setIns(ins);
					if(ins.getType().equals(InsType.RentalInsurance)){
						rentalAgreement.setPersonalAccidentCoverage(paCoverage);
						rentalAgreement.setPersonalEffectCoverage(peCoverage);
						rentalAgreement.setLiabilityCoverage(liCoverage);
					}
					rentalAgreement.setCreditCardNo(creditCardNo);
					rentalAgreement.setCreditCardExpiryDate(creditCardExpiry);
					rentalAgreement.setRentalDate(startRental);
					rentalAgreement.setReturnDate(endRental);
					//rentalAgreement.setNoOfDays(startRental, endRental);
					rentalAgreement.getUtil().open();
					rentalAgreement.createRentalAgreement();
				}
				
				
			} catch (IllegalArgumentException e) {				
				responseMessage = "Sorry, at least one of the parameters you chose is illegal.";
				responseMessage += " Detail: " + e.getMessage() + ".";
				
			} catch (ParseException e) {
				// this may be thrown by the JSON parser				
				responseMessage = "Sorry, your JSON has invalid format.";
			} catch (SQLException e) {
				// this may be thrown by our User class				
				responseMessage = "Sorry, there was problem with DB operation!";
			} catch (Exception e) {
				// this may be thrown by our User class				
				responseMessage = "Sorry, something really went wrong!";
			} 
			finally {
				// this will ALWAYS be executed, so we can be sure that
				// our client will get at least SOME decent answer
				// even if something goes wrong during the process
				car.getUtil().close();
				customer.getUtil().close();
				rentalIns.getUtil().close();
				ins.getUtil().close();
				carClass.getUtil().close();
				rentalAgreement.getUtil().close();
			}	
		
}
}
