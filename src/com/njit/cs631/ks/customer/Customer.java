package com.njit.cs631.ks.customer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

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

		private Util util;
		/**
		 * Instantiates a new customer.
		 */
		public Customer() {
			util = new Util();
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
			return this.SSN;
		}

		public void setSSN(String SSN) {
			this.SSN = SSN;
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
		 * @throws SQLException 
		 */
		public  void createCustomer(Customer customer) throws CustomerAlreadyCreatedException, SQLException, Exception{
			if (customerExists(customer.getPrimaryPhoneNo())) {
				throw new CustomerAlreadyCreatedException();
			} else {
				HashMap values = new HashMap<String, String>();
				values.put("fName", customer.getFirstName());
				values.put("LName", customer.getLastName());
				values.put("SSN", customer.getSSN());
				values.put("PrimaryPhoneNo", customer.getPrimaryPhoneNo());
				values.put("AltPhoneNo", customer.getAlternatePhoneNo());
				values.put("Street", customer.getStreet());
				values.put("State", customer.getState());
				values.put("City", customer.getCity());
				values.put("Zip", customer.getZip());
					util.insertEntity("Customer", values );
				
			}
		}

		
		public Util getUtil() {
			return util;
		}

		/**
		 * Gets the customer.
		 * 
		 * @param primaryPhoneNo
		 *            the primaryPhoneNo
		 * @return the customer
		 * @throws SQLException 
		 */
		public Customer getCustomer(String primaryPhoneNo) throws SQLException {
			ResultSet customerEntity = getCustomerEntity(primaryPhoneNo);
			return toCustomer(customerEntity);
		}

		/**
		 * Customer exists.
		 * 
		 * @param primaryTelephoneNo
		 *            the primary Telephone No
		 * @return true, if successful
		 * @throws SQLException 
		 */
		public boolean customerExists(String primaryTelephoneNo) throws SQLException {
			ResultSet result = null;
			result = getCustomerEntity(primaryTelephoneNo);
			if(result.next()){	
			return true ;
			}
			else
			return false;
		}


		private ResultSet getCustomerEntity(String primaryTelephoneNo) throws SQLException{
			// TODO Auto-generated method stub
			String[] values = {primaryTelephoneNo};
			ResultSet result = null;
				result= util.selectEntity("Customer", null, "PrimaryPhoneNo = ?", values);
			return result;
		}

		/**
		 * To customer.
		 * 
		 * @param customerEntity
		 *            the customer entity
		 * @return the customer
		 * @throws SQLException 
		 */
		private Customer toCustomer(ResultSet customerEntity) throws SQLException {
			Customer customer = new Customer();
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
			return customer;
		}


}
