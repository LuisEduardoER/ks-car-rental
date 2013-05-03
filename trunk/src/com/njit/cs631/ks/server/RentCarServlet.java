package com.njit.cs631.ks.server;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.njit.cs631.ks.http.RequestHelper;
import com.njit.cs631.ks.http.Response;
import com.njit.cs631.ks.car.*;
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

			String licenseState, licenseNo, modelName, engineCapacity, transmissionType, image, classType  ;
			int year, noOfDoors, horsePower;
			Car car = new Car();
			
			
			try {

				// get the content of the body the HTTP Request as a String
				httpRequestBody = RequestHelper.getContentOfHttpBody(req);

				// convert the JSON string to an object and collect the data
				json = (JSONObject) new JSONParser().parse(httpRequestBody);
				licenseState = (String) json.get("licenseState");
				licenseNo = (String) json.get("licenseNo");
				modelName = (String) json.get("modelName");
				engineCapacity = (String) json.get("engineCapacity");
				transmissionType = (String) json.get("transmissionType");
				image = (String) json.get("image");
				year = (int) json.get("year");
				noOfDoors = (int) json.get("noOfDoors");
				horsePower = (int) json.get("horsePower");
				classType = (String) json.get("classType");
			
				
				if (licenseNo == null || licenseState == null) {
					throw new IllegalArgumentException("Car not selected");
				}			

				car.setLicenseState(licenseState);
				car.setLicenseNo(licenseNo);
				car.setModelName(modelName);
				car.setEngineCapacity(engineCapacity);
				car.setTransmissionType(transmissionType);
				car.setImage(image);
				car.setYear(year);
				car.setNoOfDoors(noOfDoors);
				car.setHorsePower(horsePower);
				car.setClassType(classType);
				
				car.getUtil().open();
				car.createCar(car);
				

			} catch (IllegalArgumentException e) {				
				responseMessage = "Sorry, at least one of the parameters you chose is illegal.";
				responseMessage += " Detail: " + e.getMessage() + ".";
				
			} catch (ParseException e) {
				// this may be thrown by the JSON parser				
				responseMessage = "Sorry, your JSON has invalid format.";
			} catch (SQLException e) {
				// this may be thrown by our User class				
				responseMessage = "Sorry, there was problem with DB operation!";
			} catch (CarNotAvailableException e) {
				// this may be thrown by our User class				
				responseMessage = "Sorry, this car is not available!"; 
			} catch (Exception e) {
				// this may be thrown by our User class				
				responseMessage = "Sorry, something really went wrong!";
			} 
			finally {
				// this will ALWAYS be executed, so we can be sure that
				// our client will get at least SOME decent answer
				// even if something goes wrong during the process
				car.getUtil().close();
			}	
		
}
}
