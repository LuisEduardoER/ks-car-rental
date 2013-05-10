package com.njit.cs631.ks.car;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;

import com.mysql.jdbc.PreparedStatement;
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
	double MileageBeforeRental;
	
	Boolean PersonalAccidentCoverage;
	Boolean PersonalEffectCoverage;
	Boolean LiabilityCoverage;
    
	Double PricePerDay;
    Double RentalPrice;
    String CreditCardNo;
    Date CreditCardExpiryDate;
    
    String rentalDateStr; 
	String returnDateStr;
	Double discount;
	String SSN;
	
	String licenceState;
	String lincenceNum;
	
	String policyNum;
	String creditCardExpDateStr;
	
	
	
    public String getCreditCardExpDateStr() {
		return creditCardExpDateStr;
	}
	public void setCreditCardExpDateStr(String creditCardExpDateStr) {
		this.creditCardExpDateStr = creditCardExpDateStr;
	}
	public String getSSN() {
		return SSN;
	}
	public void setSSN(String ssn) {
		this.SSN = ssn;
	}
	
	
	public String getLicenceState() {
		return licenceState;
	}
	public void setLicenceState(String licenceState) {
		this.licenceState = licenceState;
	}
	public String getLincenceNum() {
		return lincenceNum;
	}
	public void setLincenceNum(String lincenceNum) {
		this.lincenceNum = lincenceNum;
	}
	
	
	public String getPolicyNum() {
		return policyNum;
	}
	public void setPolicyNum(String policyNum) {
		this.policyNum = policyNum;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
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
	public void setNoOfDays(int value) {
		NoOfDays = value ;
	}
	public String getReturned() {
		return Returned;
	}
	public void setReturned(String returned) {
		Returned = returned;
	}
	public double getMileageBeforeRental() {
		return MileageBeforeRental;
	}
	public void setMileageBeforeRental(double mileageBeforeRental) {
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
	
	
	
	public String getRentalDateStr() {
		return rentalDateStr;
	}
	public void setRentalDateStr(String rentalDateStr) {
		this.rentalDateStr = rentalDateStr;
	}
	public String getReturnDateStr() {
		return returnDateStr;
	}
	public void setReturnDateStr(String returnDateStr) {
		this.returnDateStr = returnDateStr;
	}
	public void createRentalAgreement() throws CustomerAlreadyCreatedException, SQLException, Exception{
			HashMap values = new HashMap<Object, Object>();
			values.put("LicenseState", this.getLicenceState());
			values.put("LicenseNo", this.getLincenceNum());
			values.put("SSN", this.getSSN());
			values.put("InsPolicyNo", this.getPolicyNum());
			values.put("RentalDate", this.getRentalDate());
			values.put("ReturnDate", this.getReturnDate());
			values.put("NoOfDays", this.getNoOfDays());
			values.put("MileageBeforeRental", this.getMileageBeforeRental());
			values.put("Returned", false);
			values.put("PersonalAccidentCoverage", this.getPersonalAccidentCoverage());
			values.put("PersonalEffectCoverage", this.getPersonalEffectCoverage());
			values.put("LiabilityCoverage", this.getLiabilityCoverage());
			values.put("PricePerDay", this.getPricePerDay());
			values.put("RentalPrice", this.getRentalPrice());
			values.put("CreditCardNo", this.getCreditCardNo());
			values.put("Discount", this.getDiscount());
			values.put("CreditCardExpiryDate", this.getCreditCardExpiryDate());
			util.insertEntity("RentalAgreement", values);		
			
		}
	
	public void signUpRentalAgreement() throws SQLException, Exception {
		String queryPersonalIns = "Insert into RentalAgreement(LicenseState,LicenseNo,SSN,InsPolicyNo,RentalDate,ReturnDate,MileageBeforeRental,NoOfDays,Returned,PersonalAccidentCoverage,PersonalEffectCoverage,LiabilityCoverage,PricePerDay,RentalPrice,CreditCardNo,Discount,CreditCardExpiryDate)values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement stmnt = (PreparedStatement) util.getDBConnection().prepareStatement(queryPersonalIns);
		stmnt.setString(1, this.getLicenceState());
		stmnt.setString(2, this.getLincenceNum());
		stmnt.setString(3, this.getSSN());
		stmnt.setString(4, this.getPolicyNum());
		stmnt.setString(5, this.getRentalDateStr());
		stmnt.setString(6, this.getReturnDateStr());
		stmnt.setDouble(7, this.getMileageBeforeRental());
		stmnt.setLong(8, this.getNoOfDays());
		stmnt.setBoolean(9, false);
		stmnt.setBoolean(10, this.getPersonalAccidentCoverage());
		stmnt.setBoolean(11, this.getPersonalEffectCoverage());
		stmnt.setBoolean(12, this.getLiabilityCoverage());
		stmnt.setDouble(13, this.getPricePerDay());
		stmnt.setDouble(14, this.getRentalPrice());
		stmnt.setString(15, this.getCreditCardNo());
		stmnt.setDouble(16, this.getDiscount());
		stmnt.setString(17, this.creditCardExpDateStr);
		int noOfRowsAffected = stmnt.executeUpdate();
		if(noOfRowsAffected == 1)
		{
			System.out.println("Success!!!");
		}
	}
	
	}
