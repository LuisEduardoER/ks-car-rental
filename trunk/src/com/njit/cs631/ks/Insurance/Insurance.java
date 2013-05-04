package com.njit.cs631.ks.Insurance;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;

import com.njit.cs631.ks.car.Car;
import com.njit.cs631.ks.car.Class;
import com.njit.cs631.ks.customer.Customer;
import com.njit.cs631.ks.customer.CustomerAlreadyCreatedException;
import com.njit.cs631.ks.server.Util;

public class Insurance {

	private String InsProviderName;
	
	public enum InsType{
		RentalInsurance,
		CreditCardInsurance,
		PersonalInsurance
	}
	
	private InsType type;
	
	String ServicePhoneNo;
	
	public Insurance(){
	
		util = new Util();
	}
	
	public String getServicePhoneNo() {
		return ServicePhoneNo;
	}
	public void setServicePhoneNo(String servicePhoneNo) {
		ServicePhoneNo = servicePhoneNo;
	}
	public Util getUtil() {
		return util;
	}
	public void setUtil(Util util) {
		this.util = util;
	}
	Util util = null;
	
	
	public InsType getType() {
		return type;
	}
	public void setType(InsType insType) {
		this.type = insType;
	}
	private String PolicyNo;
	public String getInsProviderName() {
		return InsProviderName;
	}
	public void setInsProviderName(String insProviderName) {
		InsProviderName = insProviderName;
	}
	public String getPolicyNo() {
		return PolicyNo;
	}
	public void setPolicyNo(String policyNo) {
		PolicyNo = policyNo;
	}
	
	public void createInsurance() throws CustomerAlreadyCreatedException, SQLException, Exception{
					HashMap values = new HashMap<String, String>();
					values.put("InsuranceProviderName", this.getInsProviderName()  );
					values.put("Type", this.getType());
					if(this.getType() == InsType.CreditCardInsurance){
						values.put("ServicePhoneNo", this.getServicePhoneNo());
					this.getUtil().insertEntity("RentalAgreement", values);
					}
					
					
					
				}

	

}
