package com.njit.cs631.ks.car;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import com.njit.cs631.ks.customer.Customer;
import com.njit.cs631.ks.customer.CustomerAlreadyCreatedException;
import com.njit.cs631.ks.server.Util;

// TODO: Auto-generated Javadoc
/**
 * Car.
 */
public class Car {
	/** The license plate. */
	private String licensePlate;

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
	public Car(String licensePlate, String licenseNo) {
		this.setLicenseState(licensePlate);
		this.setLicenseNo(licenseNo);
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
		return licensePlate;
	}

	public void setLicenseState(String licensePlate) {
		this.licensePlate = licensePlate;
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

	public void createCar(Car car) throws CarNotAvailableException,
	SQLException, Exception {
		if (!carExists(car.getLicenseNo(), car.getLicenseState())) {
			throw new CarNotAvailableException();
		} else {
			String[] colNames = { "LicensePlate", "LicenseNo", "ModelName",
					"Year", "EngineCapacity", "TransmissionType", "NoOfDoors",
					"HorsePower", "Image", "ClassType" };
			String[] conditionArgs = { "LicensePlate", "LicenseNo" };
			String[] conditions = { "LicenseNo = ?", "LicensePlate = ?" };
			util.selectEntity("Car", colNames, conditions, conditionArgs);

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
	}

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

	public boolean carExists(String licenseNo, String licenseState)
			throws SQLException {
		ResultSet result = null;
		result = getCarEntity(licenseNo, licenseState);
		if (result.next()) {
			return true;
		} else
			return false;
	}

	private ResultSet getCarEntity(String licenseNo, String licenseState)
			throws SQLException {
		// TODO Auto-generated method stub
		String[] values = { licenseNo, licenseState };
		String[] conditions = { "LicenseNo = ?", "LicensePlate = ?" };
		ResultSet result = null;
		result = util.selectEntity("Car", null, conditions, values);
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
		return car;
	}

}
