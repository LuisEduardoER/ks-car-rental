package com.njit.cs631.ks.customer;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.njit.cs631.ks.server.Util;


// TODO: Auto-generated Javadoc
/**
 * The Class User.
 */
public class Customer {
		/** The first name. */
		private String firstName;

		/** The last name. */
		private String lastName;

		/** The SSN. */
		private String SSN;

		/** The street. */
		private String street;

		/** The city. */
		private String city;

		/** The state. */
		private String state;

		/** The zip. */
		private String zip;

		/** The primary phone no. */
		private String primaryPhoneNo;

		/** The alternate phone no. */
		private String alternatePhoneNo;
		
		/** The discount. */
		private Double discount;

		private static Util util;
		/**
		 * Instantiates a new customer.
		 */
		public Customer() {
		
			new Util();
		}

		/**
		 * Instantiates a new customer.
		 * 
		 * @param username
		 *            the username
		 * @param firstname
		 *            the firstname
		 * @param lastname
		 *            the lastname
		 * 
		 */
		public Customer(String firstName, String lastName, String SSN,
				String primaryPhoneNo) {
			this.setSSN(SSN);
			this.setFirstName(firstName);
			this.setLastName(lastName);
			this.setPrimaryPhoneNo(primaryPhoneNo);
		}

		public String getFirstName() {
			return firstName;
		}

		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}

		public String getLastName() {
			return lastName;
		}

		public void setLastName(String lastName) {
			this.lastName = lastName;
		}

		public String getSSN() {
			return SSN;
		}

		public void setSSN(String SSN) {
			SSN = SSN;
		}

		public String getPrimaryPhoneNo() {
			return primaryPhoneNo;
		}

		public void setPrimaryPhoneNo(String primaryPhoneNo) {
			this.primaryPhoneNo = primaryPhoneNo;
		}

		public String getStreet() {
			return street;
		}

		public void setStreet(String street) {
			this.street = street;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getZip() {
			return zip;
		}

		public void setZip(String zip) {
			this.zip = zip;
		}

		public String getAlternatePhoneNo() {
			return alternatePhoneNo;
		}

		public void setAlternatePhoneNo(String alternatePhoneNo) {
			this.alternatePhoneNo = alternatePhoneNo;
		}

		public Double getDiscount() {
			return discount;
		}

		public void setDiscount(Double discount) {
			this.discount = discount;
		}

		
		/**
		 * Creates the customer.
		 * 
		 * @param customer
		 *            the customer
		 */
		public static void createCustomer(Customer customer) throws CustomerAlreadyCreatedException {
			if (customerExists(customer.getPrimaryPhoneNo())) {
				throw new CustomerAlreadyCreatedException();
			} else {
				
			}
		}

		
		/**
		 * Gets the customer.
		 * 
		 * @param primaryPhoneNo
		 *            the primaryPhoneNo
		 * @return the customer
		 */
		public Customer getCustomer(String primaryPhoneNo) {
			ResultSet customerEntity = getCustomerEntity(primaryPhoneNo);
			return toCustomer(customerEntity);
		}

		/**
		 * Customer exists.
		 * 
		 * @param primaryTelephoneNo
		 *            the primary Telephone No
		 * @return true, if successful
		 */
		public static boolean customerExists(String primaryTelephoneNo) {
			return getCustomerEntity(primaryTelephoneNo) != null;
		}


		private static ResultSet getCustomerEntity(String primaryTelephoneNo) {
			// TODO Auto-generated method stub
			String[] values = {primaryTelephoneNo};
			ResultSet result = null;
			try {
				result= util.selectEntity("customer", null, "primaryPhoneNo = ?", values);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}

		/**
		 * To customer.
		 * 
		 * @param customerEntity
		 *            the customer entity
		 * @return the customer
		 */
		private Customer toCustomer(ResultSet customerEntity) {
			Customer customer = new Customer();
			try{
			customer.setSSN((String) customerEntity.getString("SSN"));
			customer.setFirstName((String) customerEntity.getString("FName"));
			customer.setLastName((String) customerEntity.getString("LName"));
			customer.setPrimaryPhoneNo((String) customerEntity.getString("PrimaryPhoneNo"));
			customer.setAlternatePhoneNo((String) customerEntity.getString("AltPhoneNo"));
			customer.setStreet((String)customerEntity.getString("Street"));
			customer.setCity((String)customerEntity.getString("City"));
			customer.setState((String)customerEntity.getString("State"));
			customer.setZip((String)customerEntity.getString("Zip"));
			customer.setDiscount((Double)customerEntity.getDouble("Discount"));
			
			}
			catch(SQLException sqlException){
				sqlException.printStackTrace();
			}
			return customer;
		}


}
