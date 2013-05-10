package com.njit.cs631.ks.Insurance;

import java.sql.ResultSet;

import java.sql.SQLException;

import com.njit.cs631.ks.car.Car;
import com.njit.cs631.ks.car.Class.ClassType;
import com.njit.cs631.ks.server.Util;
import java.sql.*;
import com.mysql.jdbc.PreparedStatement;

public class RentalInsurance extends Insurance{
	
	String insPolicyNo;
	ClassType carClass;
	Double PICostPerDay;
	Double PACostPerDay;
	Double LICostPerDay;
	Double PICostPerWeek;
	Double PACostPerWeek;
	Double LICostPerWeek;
	Double PICostPerMonth;
	Double PACostPerMonth;
	Double LICostPerMonth;
	Util util;
	
	/* Shilpa Here */
	String selectedCarClass;
	/* Shilpa Here */
	 
	
	public RentalInsurance(){
		
		util= new Util();
		super.setInsProviderName("CarRental");
		super.setType(InsType.RentalInsurance);
	}
	
	
	public Double getPICostPerDay() {
		return PICostPerDay;
	}
	public void setPICostPerDay(Double pICostPerDay) {
		PICostPerDay = pICostPerDay;
	}
	public Double getPACostPerDay() {
		return PACostPerDay;
	}
	public void setPACostPerDay(Double pACostPerDay) {
		PACostPerDay = pACostPerDay;
	}
	public Double getLICostPerDay() {
		return LICostPerDay;
	}
	public void setLICostPerDay(Double lICostPerDay) {
		LICostPerDay = lICostPerDay;
	}
	public Double getPICostPerWeek() {
		return PICostPerWeek;
	}
	public void setPICostPerWeek() {
		PICostPerWeek = this.PICostPerDay * 7;
	}
	public Double getPACostPerWeek() {
		return PACostPerWeek;
	}
	public void setPACostPerWeek() {
		PACostPerWeek = this.PACostPerDay * 7;
	}
	public Double getLICostPerWeek() {
		return LICostPerWeek;
	}
	public void setLICostPerWeek() {
		LICostPerWeek = this.LICostPerDay * 7;
	}
	public Double getPICostPerMonth() {
		return PICostPerMonth;
	}
	public void setPICostPerMonth() {
		PICostPerMonth = this.PICostPerDay * 30;
	}
	public Double getPACostPerMonth() {
		return PACostPerMonth;
	}
	public void setPACostPerMonth() {
		PACostPerMonth = this.PACostPerDay * 30;
	}
	public Double getLICostPerMonth() {
		return LICostPerMonth;
	}
	public void setLICostPerMonth() {
		LICostPerMonth = this.LICostPerDay * 30;
	}


	public RentalInsurance getInsurance(ClassType classType) throws SQLException {
		// TODO Auto-generated method stub
		String[] values = { classType.toString() };
		String condition =  "ClassType = ?" ;
		ResultSet result = null;
		result = util.selectEntity("RentalInsurance", null, condition, values);
		RentalInsurance rentalIns= null;
		if(result!=null)
		{
			rentalIns = toRentalIns(result);
			rentalIns.setCarClass(classType);
		}
		return rentalIns;
		
	}


	private RentalInsurance toRentalIns(ResultSet result) throws SQLException {
		// TODO Auto-generated method stub
		RentalInsurance rentalIns = new RentalInsurance();
		rentalIns.setInsPolicyNo((String)result.getString("InsPolicyNo"));
		rentalIns.setInsProviderName((String)result.getString("InsProviderName"));
		return rentalIns;
	
	}


	public String getInsPolicyNo() {
		return insPolicyNo;
	}


	public void setInsPolicyNo(String insPolicyNo) {
		this.insPolicyNo = insPolicyNo;
	}


	public ClassType getCarClass() {
		return carClass;
	}


	public void setCarClass(ClassType carClass) {
		this.carClass = carClass;
	}
	
	/* Shilpa Here */
	public void setSelectedCarClass(String strCarClass) {
		this.selectedCarClass = strCarClass;
	}
	
	public String getSelectedCarClass() {
		return selectedCarClass;
	}
	/* Shilpa Here */

	public Util getUtil() {
		return util;
	}


	public void setUtil(Util util) {
		this.util = util;
	}
	
	public String GetInsPolicyNum(String classType)
	{
		Connection con = null;
		String url = "jdbc:mysql://sql2.njit.edu:3306/";
		String dbName = "ss984";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "ss984";
		String password = "xtlHyPSEC";
		String rVal = "";
		try
		{
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url + dbName, userName, password);
			 String queryClass = "select InsPolicyNo from RentalInsurance" + 
			" where RIClassType = '" + classType.trim() + "'";
				PreparedStatement st = (PreparedStatement) con
						.prepareStatement(queryClass);
				ResultSet rs = st.executeQuery();
				while(rs.next())
				{
					rVal = rs.getString(1);
				}
									
			
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());			
		}
		finally
		{
			return rVal;
		}
			 
	}
	
}
