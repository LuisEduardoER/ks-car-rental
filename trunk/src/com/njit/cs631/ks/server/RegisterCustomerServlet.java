package com.njit.cs631.ks.server;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.njit.cs631.ks.customer.Customer;
import com.njit.cs631.ks.customer.CustomerAlreadyCreatedException;
import com.njit.cs631.ks.http.RegisterRegisterPayload;
import com.njit.cs631.ks.http.RequestHelper;
import com.njit.cs631.ks.http.Response;
/**
 * The Class Register_ServerServlet.
 */

public class RegisterCustomerServlet extends HttpServlet{
		
		/**
	 * 
	 */
	private static final long serialVersionUID = -5864205295941129600L;

		/* (non-Javadoc)
		 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
		 */
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {

			// This handlers will help us to read
			// the contents of body of the HTTP Request
			String httpRequestBody = null; // here we'll store the content

			// we'll store the parsed JSON string here
			JSONObject json;

			// this is the default response, we'll change it to OK
			// when we finish if everything goes fine
			Response.Status responseStatus = Response.Status.ERROR;
			String responseMessage = "Fatal Error";
			RegisterRegisterPayload responsePayload = null;

			// this variables will contain all the data
			// we want to collect in this request
			String firstName, lastName, SSN, street, city, state, zip, primaryPhoneNo, alternatePhoneNo, discount;

			try {

				// get the content of the body the HTTP Request as a String
				httpRequestBody = RequestHelper.getContentOfHttpBody(req);

				// convert the JSON string to an object and collect the data
				json = (JSONObject) new JSONParser().parse(httpRequestBody);
				firstName = (String) json.get("firstName");
				lastName = (String) json.get("lastName");
				SSN = (String) json.get("SSN");
				street = (String) json.get("street");
				city = (String) json.get("city");
				state = (String) json.get("state");
				zip = (String) json.get("zip");
				primaryPhoneNo = (String) json.get("primaryPhoneNo");
				alternatePhoneNo= (String) json.get("alternatePhoneNo");
				discount = (String) json.get("discount");
			
				
				if (SSN == null) {
					throw new IllegalArgumentException("SSN not provided");
				}			

				Customer customer = new Customer();
				customer.setFirstName(firstName);
				customer.setLastName(lastName);
				customer.setSSN(SSN);
				customer.setPrimaryPhoneNo(primaryPhoneNo);
				customer.setStreet(street);
				customer.setCity(city);
				customer.setState(state);
				customer.setZip(zip);
				
				// register user
				Customer.createCustomer(customer);

				// create response
				responsePayload = new RegisterRegisterPayload();
				responsePayload.setCustomerStatus(customer.getPrimaryPhoneNo());
				// create the response
				responseStatus = Response.Status.OK;
				responseMessage = "Registration was successfull";

			} catch (IllegalArgumentException e) {
				responseStatus = Response.Status.ERROR;
				responseMessage = "Sorry, at least one of the parameters you provided is illegal.";
				responseMessage += " Detail: " + e.getMessage() + ".";

			} catch (ParseException e) {
				// this may be thrown by the JSON parser
				responseStatus = Response.Status.ERROR;
				responseMessage = "Sorry, your JSON has invalid format.";

			} catch (CustomerAlreadyCreatedException e) {
				// this may be thrown by our User class
				responseStatus = Response.Status.ERROR;
				responseMessage = "Sorry, you cannot register an existing user!";

			} catch (Exception e) {
				responseStatus = Response.Status.ERROR;
				responseMessage = "Sorry, something went really wrong.";
				responseMessage += "\n ";
				responseMessage += e.toString();
				responseMessage += "\n ";
				responseMessage += e.getMessage();
				responseMessage += "\n ";
				responseMessage += e.getStackTrace().toString();

			} finally {
				// this will ALWAYS be executed, so we can be sure that
				// our client will get at least SOME decent answer
				// even if something goes wrong during the process
				resp.getWriter().print(
						new Response(responseStatus, responseMessage,
								responsePayload).toJson());
			}
		}
	}
