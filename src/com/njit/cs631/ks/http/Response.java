package com.njit.cs631.ks.http;

import com.google.gson.Gson;

// TODO: Auto-generated Javadoc
/**
 * The Class Response.
 */

public class Response {
			/** The status. */
		@SuppressWarnings("unused")
		private Status status;
		
		/** The message. */
		@SuppressWarnings("unused")
		private String message;
		
		/** The payload. */
		@SuppressWarnings("unused")
		private Object payload;

		/**
		 * The Enum Status.
		 */
		public enum Status {
			
			/** The ERROR. */
			ERROR, 
	 /** The OK. */
	 OK, 
	 /** The WARNING. */
	 WARNING
		}

		/**
		 * Instantiates a new response.
		 *
		 * @param status the status
		 * @param message the message
		 */
		public Response(Status status, String message) {
			this.status = status;
			this.message = message;
		}

		/**
		 * Instantiates a new response.
		 *
		 * @param status the status
		 * @param message the message
		 * @param payload the payload
		 */
		public Response(Status status, String message, Object payload) {
			this.status = status;
			this.message = message;
			this.payload = payload;
		}

		/**
		 * Instantiates a new response.
		 *
		 * @param status the status
		 * @param message the message
		 * @param payload the payload
		 */
		public Response(Status status, String message, Object[] payload) {
			this.status = status;
			this.message = message;
			this.payload = payload;
		}

		/**
		 * To json.
		 *
		 * @return the string
		 */
		public String toJson() {
			Gson gson = new Gson();
			String json = gson.toJson(this);
			return json;
		}

		/**
		 * Construct from json.
		 *
		 * @param json the json
		 * @return the response
		 */
		public static Response constructFromJson(String json) {
			Gson gson = new Gson();
			return gson.fromJson(json, Response.class);
		}
	}
