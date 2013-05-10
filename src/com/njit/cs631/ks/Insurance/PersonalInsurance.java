package com.njit.cs631.ks.Insurance;

import java.sql.ResultSet;

import java.sql.SQLException;

import com.njit.cs631.ks.car.Car;
import com.njit.cs631.ks.car.Class.ClassType;
import com.njit.cs631.ks.server.Util;
import java.sql.*;
import com.mysql.jdbc.PreparedStatement;

public class PersonalInsurance extends Insurance{
	
	String insPolicyNo;
	String insProviderName;
	
	 
	
	public PersonalInsurance(){		
		
	}	

	public String getInsProviderName() {
		return insProviderName;
	}

	public void setInsProviderName(String insProviderName) {
		this.insProviderName = insProviderName;
	}


	public String getInsPolicyNo() {
		return insPolicyNo;
	}


	public void setInsPolicyNo(String insPolicyNo) {
		this.insPolicyNo = insPolicyNo;
	}	
	
}
