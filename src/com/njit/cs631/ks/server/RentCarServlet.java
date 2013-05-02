package com.njit.cs631.ks.server;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.njit.cs631.ks.http.RequestHelper;
import com.njit.cs631.ks.http.Response;

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

			String userName, primaryPhoneNo, AltPhoneNumer  ;
			
			}


}
