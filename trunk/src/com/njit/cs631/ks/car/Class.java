package com.njit.cs631.ks.car;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.njit.cs631.ks.Insurance.RentalInsurance;
import com.njit.cs631.ks.server.Util;

public class Class {
	
	public enum ClassType {
		Compact,
		FullSize,
		Intermediate,
		MiniVan,
		Premium,
		SportUtility,
		Standard,
		Truck,
		CargoVan
	};
	private String type ;

	private Util util;
	private Double rentalPricePerDay;
	private Double rentalPricePerWeek;
	private Double rentalPricePerMonth;

	Class(){
		
	 util = new Util();
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	public Util getUtil() {
		return util;
	}
	public void setUtil(Util util) {
		this.util = util;
	}
	public Double getRentalPricePerDay() {
		return rentalPricePerDay;
	}
	public void setRentalPricePerDay(Double rentalPricePerDay) {
		this.rentalPricePerDay = rentalPricePerDay;
	}
	public Double getRentalPricePerWeek() {
		return rentalPricePerWeek;
	}
	public void setRentalPricePerWeek(Double rentalPricePerWeek) {
		this.rentalPricePerWeek = rentalPricePerWeek;
	}
	public Double getRentalPricePerMonth() {
		return rentalPricePerMonth;
	}
	public void setRentalPricePerMonth(Double rentalPricePerMonth) {
		this.rentalPricePerMonth = rentalPricePerMonth;
	}

	public Class getClassEntity()throws SQLException {
			// TODO Auto-generated method stub
			String[] values = {this.getType()};
			String condition =  "ClassType = ?" ;
			ResultSet result = null;
			result = util.selectEntity("Class", null, condition, values);
			Class carClass = new Class();
			if(result!=null)
			{
				carClass = carClass.toClass(result);
			}
			return carClass;
		}

	public Class toClass(ResultSet result) throws SQLException{
		Class carClass = new Class();
		carClass.setType(result.getString("ClassType"));
		carClass.setRentalPricePerDay(result.getDouble("RentalPricePerDay"));
		carClass.setRentalPricePerWeek(result.getDouble("RentalPricePerWeek"));
		carClass.setRentalPricePerMonth(result.getDouble("RentalPricePerMonth"));
		return carClass;
	}
}