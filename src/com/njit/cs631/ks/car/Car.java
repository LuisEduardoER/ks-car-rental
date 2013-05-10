package com.njit.cs631.ks.car;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import com.njit.cs631.ks.car.Class.ClassType;
import com.njit.cs631.ks.customer.Customer;
import com.njit.cs631.ks.customer.CustomerAlreadyCreatedException;
import com.njit.cs631.ks.server.Util;

// TODO: Auto-generated Javadoc
/**
 * Car.
 */
public class Car {
	/** The license state. */
	private String licenseState;

	/** The license number. */
	private String licenseNo;
	
	/** The model name. */
	private String modelName;

	/** The year. */
	private int year;

	/** The engine capacity. */
	private String engineCapacity;

	/** The transmission type. */
	private String transmissionType;

	/** The no of doors. */
	private int noOfDoors;

	/** The horse power. */
	private int horsePower;

	/** The image. */
	private String image;

	/** The class type. */
	private String classType;

	private Util util;

	private String licensePlate;
	
	private int mileage;
	
	
	
	private boolean available;
	
	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}	

	

	public void setUtil(Util util) {
		this.util = util;
	}

	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}

	public String getLicensePlate() {
		return licensePlate;
	}

	public void setLicensePlate(String licenseState, String licenseNo) {
		this.licensePlate = licenseState + licenseNo;
	}

	
	/**
	 * Instantiates a new car.
	 */
	public Car() {
		util = new Util();
	}

	/**
	 * Instantiates a new car.
	 * 
	 * 
	 */
	public Car(String licenseState, String licenseNo) {
		this.setLicenseState(licenseState);
		this.setLicenseNo(licenseNo);
		this.setLicensePlate(licenseState, licenseNo);
		this.setModelName(modelName);
		this.setYear(year);
		this.setEngineCapacity(engineCapacity);
		this.setTransmissionType(transmissionType);
		this.setNoOfDoors(noOfDoors);
		this.setHorsePower(horsePower);
		this.setImage(image);
		this.setClassType(classType);
	}

	public String getLicenseState() {
		return licenseState;
	}

	public void setLicenseState(String licenseState) {
		this.licenseState = licenseState;
	}

	public String getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getEngineCapacity() {
		return engineCapacity;
	}

	public void setEngineCapacity(String engineCapacity) {
		this.engineCapacity = engineCapacity;
	}

	public String getTransmissionType() {
		return transmissionType;
	}

	public void setTransmissionType(String transmissionType) {
		this.transmissionType = transmissionType;
	}

	public int getNoOfDoors() {
		return noOfDoors;
	}

	public void setNoOfDoors(int noOfDoors) {
		this.noOfDoors = noOfDoors;
	}

	public int getHorsePower() {
		return horsePower;
	}

	public void setHorsePower(int horsePower) {
		this.horsePower = horsePower;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	/**
	 * Creates car.
	 */

	/*public void createCar(Car car) throws CarNotAvailableException,
	SQLException, Exception {
		if (!carExists(car.getLicenseNo(), car.getLicenseState())) {
			throw new CarNotAvailableException();
		} else {
			String[] colNames = { "LicenseState", "LicenseNo", "ModelName",
					"Year", "EngineCapacity", "TransmissionType", "NoOfDoors",
					"HorsePower", "Image", "ClassType" };
			String[] conditionArgs = { "LicenseState", "LicenseNo" };
			String condition =  "LicenseNo = ? and LicenseState = ?" ;
			util.selectEntity("Car", colNames, condition, conditionArgs);

			HashMap values = new HashMap<String, String>();
			values.put("licenseNo", car.getLicenseNo());
			values.put("licenseState", car.getLicenseState());
			values.put("modelNo", car.getModelName());
			values.put("year", car.getYear());
			values.put("engineCapacity", car.getEngineCapacity());
			values.put("transmissionType", car.getTransmissionType());
			values.put("noOfDoors", car.getNoOfDoors());
			values.put("horsePower", car.getHorsePower());
			values.put("image", car.getImage());
			values.put("classType", car.getClassType());
		}
	}*/

	public Util getUtil() {
		return util;
	}

	/**
	 * Gets the car.
	 * 
	 * 
	 * @return the car
	 * @throws SQLException
	 */
	public Car getCar(String licenseNo, String licenseState)
			throws SQLException {
		ResultSet carEntity = getCarEntity(licenseNo, licenseState);
		return toCar(carEntity);
	}
	

	/**
	 * Car exists.
	 * 
	 * @param licenseNo
	 * @param licenseState
	 * 
	 * @return true, if successful
	 * @throws SQLException
	 */

	/*public boolean carExists(String licenseNo, String licenseState)
			throws SQLException {
		ResultSet result = null;
		result = getOneCarEntity(licenseNo, licenseState);
		if (result.next()) {
			return true;
		} else
			return false;
	}*/

	public Car getOneCar(ClassType classType2)throws SQLException {
		// TODO Auto-generated method stub
		String[] values = { classType2.toString() };
		String condition =  "ClassType = ? and " ;
		ResultSet result = null;
		result = util.selectEntity("Car", null, condition, values);
		Car car= null;
		if(result!=null)
		{
			car = toCar(result);
		}
		return car;
	}
	
	private ResultSet getCarEntity(String licenseNo, String licenseState)throws SQLException {
		// TODO Auto-generated method stub
		String[] values = { licenseNo , licenseState };
		String condition =  "LicenseNo = ? and LicenseState = ?";
		ResultSet result = null;
		result = util.selectEntity("Car", null, condition, values);
		return result;
	}

	/**
	 * To Car.
	 * 
	 * @param carEntity
	 *            the car entity
	 * @return the car
	 * @throws SQLException
	 */
	private Car toCar(ResultSet carEntity) throws SQLException {
		Car car = new Car();
		car.setLicenseState((String) carEntity.getString("LicenseState"));
		car.setLicenseNo((String) carEntity.getString("LicenseNo"));
		car.setModelName((String) carEntity.getString("ModelName"));
		car.setYear((int) carEntity.getInt("Year"));
		car.setEngineCapacity((String) carEntity.getString("EngineCapacity"));
		car.setTransmissionType((String) carEntity
				.getString("TransmissionType"));
		car.setNoOfDoors((int) carEntity.getInt("NoOfDoors"));
		car.setHorsePower((int) carEntity.getInt("HorsePower"));
		car.setImage((String) carEntity.getString("Image"));
		car.setClassType((String) carEntity.getString("ClassType"));
		car.setAvailable((Boolean) carEntity.getBoolean("Available"));
		car.setMileage((int) carEntity.getInt("Available"));
		return car;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

}
