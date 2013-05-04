package com.njit.cs631.ks.car;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;

import com.njit.cs631.ks.Insurance.Insurance;
import com.njit.cs631.ks.customer.Customer;
import com.njit.cs631.ks.customer.CustomerAlreadyCreatedException;
import com.njit.cs631.ks.server.Util;

public class RentalAgreement {
	
	String AgreementNo;
	Car car;
	Customer customer;
	Insurance ins;
	Class classType;
	
	Date RentalDate; 
	Date ReturnDate;
	int NoOfDays;
	String Returned;
	int MileageBeforeRental;
	
	Boolean PersonalAccidentCoverage;
	Boolean PersonalEffectCoverage;
	Boolean LiabilityCoverage;
    
	Double PricePerDay;
    Double RentalPrice;
    String CreditCardNo;
    Date CreditCardExpiryDate;
	
    Util util = null;
    public RentalAgreement(){
    	util = new Util();
    }
    public String getAgreementNo() {
		return AgreementNo;
	}
	
    public void setAgreementNo(String agreementNo) {
		AgreementNo = agreementNo;
	}
    
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Insurance getIns() {
		return ins;
	}
	public void setIns(Insurance ins) {
		this.ins = ins;
	}
	public Class getClassType() {
		return classType;
	}
	public void setClassType(Class classType) {
		this.classType = classType;
	}
	public Date getRentalDate() {
		return RentalDate;
	}
	public void setRentalDate(Date rentalDate) {
		RentalDate = rentalDate;
	}
	public Date getReturnDate() {
		return ReturnDate;
	}
	public void setReturnDate(Date returnDate) {
		ReturnDate = returnDate;
	}
	public int getNoOfDays() {
		return NoOfDays;
	}
	public void setNoOfDays(Date rentalDate, Date returnDate) {
		NoOfDays = returnDate.compareTo(rentalDate) ;
	}
	public String getReturned() {
		return Returned;
	}
	public void setReturned(String returned) {
		Returned = returned;
	}
	public int getMileageBeforeRental() {
		return MileageBeforeRental;
	}
	public void setMileageBeforeRental(int mileageBeforeRental) {
		MileageBeforeRental = mileageBeforeRental;
	}
	
	public Double getPricePerDay() {
		return PricePerDay;
	}
	public void setPricePerDay(Double pricePerDay) {
		PricePerDay = pricePerDay;
	}
	public Double getRentalPrice() {
		return RentalPrice;
	}
	public void setRentalPrice(Double rentalPrice) {
		RentalPrice = rentalPrice;
	}
	public String getCreditCardNo() {
		return CreditCardNo;
	}
	public void setCreditCardNo(String creditCardNo) {
		CreditCardNo = creditCardNo;
	}
		
	public Boolean getPersonalAccidentCoverage() {
		return PersonalAccidentCoverage;
	}
	public void setPersonalAccidentCoverage(Boolean personalAccidentCoverage) {
		PersonalAccidentCoverage = personalAccidentCoverage;
	}
	public Boolean getPersonalEffectCoverage() {
		return PersonalEffectCoverage;
	}
	public void setPersonalEffectCoverage(Boolean personalEffectCoverage) {
		PersonalEffectCoverage = personalEffectCoverage;
	}
	public Boolean getLiabilityCoverage() {
		return LiabilityCoverage;
	}
	public void setLiabilityCoverage(Boolean liabilityCoverage) {
		LiabilityCoverage = liabilityCoverage;
	}
	public Date getCreditCardExpiryDate() {
		return CreditCardExpiryDate;
	}
	public void setCreditCardExpiryDate(Date creditCardExpiryDate) {
		CreditCardExpiryDate = creditCardExpiryDate;
	}
	public Util getUtil() {
		return util;
	}
	public void setUtil(Util util) {
		this.util = util;
	}
	
	public void createRentalAgreement() throws CustomerAlreadyCreatedException, SQLException, Exception{
			HashMap values = new HashMap<String, String>();
			values.put("LicenseState", this.car.getLicenseState());
			values.put("LicenseNo", this.car.getLicenseNo());
			values.put("SSN", this.customer.getSSN());
			values.put("InsPolicyNo", this.ins.getPolicyNo());
			values.put("RentalDate", this.getRentalDate());
			values.put("ReturnDate", this.getReturnDate());
			values.put("NoOfDays", this.getNoOfDays());
			values.put("MileageBeforeRental", this.car.getMileage());
			values.put("Returned", false );
			values.put("PersonalAccidentCoverage", this.getPersonalAccidentCoverage());
			values.put("PersonalEffectCoverage", this.getPersonalEffectCoverage());
			values.put("LiabilityCoverage", this.getLiabilityCoverage());
			values.put("CreditCardNo", this.getCreditCardNo());
			values.put("Discount", this.customer.getDiscount());
			values.put("CreditCardExpiryDate", this.getCreditCardExpiryDate());
			util.insertEntity("RentalAgreement", values);		
			
		}
	
	}
