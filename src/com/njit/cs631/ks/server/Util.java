
package com.njit.cs631.ks.server;


import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.njit.cs631.ks.car.*;

import org.json.simple.*;

// TODO: Auto-generated Javadoc
/**
 * This is the utility class for all servlets. It provides method for inserting,
 * deleting, searching the entity from data store. Also contains method for
 * displaying the entity in JSON format.
 * 
 */
public class Util {

  /** The Constant logger. */
  private static final Logger logger = Logger.getLogger(Util.class.getCanonicalName());
  
  private static final String SQLURL = "jdbc:mysql://sql2.njit.edu:3306/";
  private static final String DBNAME = "ss984";
  private static final String DRIVER = "com.mysql.jdbc.Driver";
  private static final String USERNAME = "ss984";
  private static final String PASSWORD = "xtlHyPSEC";
  
  public static final int numOfDaysInMonth = 30;
  public static final int numOfDaysInWeek = 7;
  
  public static final double monthsRentDiscount = 0.15;
  public static final double weeksRentDiscount = 0.05;
  public static final double daysRentDiscount = 0.0;
  
  
  Connection dbConnection = null;
  Boolean isOpened = false;
  
  public void open() throws SQLException {
		String url = SQLURL;

		try {
			java.lang.Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new SQLException("My SQL Driver not found");
		}
		
		dbConnection = (Connection) DriverManager.getConnection(url + DBNAME, USERNAME, PASSWORD);
		isOpened = true;
	}
  
  public Connection getDBConnection() throws SQLException
  {
	  if(!isOpened)
		  this.open();
	  
	  return this.dbConnection;
  }
  
  public void close(){
	  try {
		dbConnection.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
/**
 * Persist entity.
 *
 * @param entity  : entity to be persisted
 */
    public void insertEntity(String tableName, HashMap<String, String> columns) throws SQLException
	{
		String []queryValues = new String[columns.size()];
		String sqlQuery = "INSERT INTO " + tableName + " (";
		Set attributes=columns.keySet();
		int cnt=0;
		for(Iterator i=attributes.iterator();i.hasNext();)
		{
			String key=(String)i.next();
		    sqlQuery = sqlQuery + key;

		    if(i.hasNext())
		    {
		    	sqlQuery = sqlQuery +",";
		    }
		}
        sqlQuery = sqlQuery + ") VALUES (";
        int count=0;
        for(Iterator i=attributes.iterator();i.hasNext();)
		{
			String key=(String)i.next();
            String value = columns.get(key);
            queryValues[count++] = value;
		    sqlQuery = sqlQuery + "?";

		    if(i.hasNext())
		    {
		    	sqlQuery = sqlQuery +",";
		    }
		}
        sqlQuery = sqlQuery + ")";
	    execute(sqlQuery, queryValues);
	} 
    
    public ResultSet execute(String query, String[] values) throws SQLException {
		PreparedStatement sqlStatement;		
		ResultSet resultSet = null;
		
		if(!isOpened) 
			{
			//TODO: throw exception
			//this.close();
			this.open();
			return execute(query, values);
			}
		
		sqlStatement = (PreparedStatement) dbConnection.prepareStatement(query);
		for(int i=0; values != null && i < values.length; i++)
		{
			sqlStatement.setString(i+1, values[i]);
		}
	
		query = query.toUpperCase();
		try {
			if(query.startsWith("INSERT") || query.startsWith("DELETE") ||
					query.startsWith("UPDATE"))
			{
				sqlStatement.executeUpdate();
			}
			else
			{
				resultSet = sqlStatement.executeQuery();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return resultSet;
    }
	
	/**
	 * Delete the entity from persistent store represented by the key.
	 *
	 * @param key : key to delete the entity from the persistent store
	 */
  public ResultSet deleteEntity(String tableName, String condition,	String[] conditionArgs) throws SQLException  {
    logger.log(Level.INFO, "Deleting entity");
		String sqlQuery = "DELETE  ";
		sqlQuery = sqlQuery + " from "+tableName+" WHERE " + condition;
		
	  return execute(sqlQuery, conditionArgs);
		
	}  	
  
  

	/**
	 * Search and return the few or all attributes of entities from datastore
	 * based on search condition or without a search condition 
	 * @param key : key to find the entity
	 * @return  entity
	 */
 
  public ResultSet selectEntity(String tableName, String[] columnNames,String condition, String[] conditionArgs) throws SQLException {
			//String []queryArgs = new String[columns.size()];
			//queryArgs[0] = tableName;
			
			String sqlQuery = "SELECT ";
	        if(columnNames != null)
	        {
	            for(int i=0;columnNames != null && i<columnNames.length;i++)
	            {
	                sqlQuery= sqlQuery+ columnNames[i];
	                if(i<columnNames.length-1)
	                {
	                    sqlQuery= sqlQuery+ ",";
	                }
	            }
	        }
	        else
	        {
	            sqlQuery = sqlQuery + "*";
	        }
	        sqlQuery = sqlQuery + " from "+tableName+ ((condition != null ) ? " WHERE " + condition : "");
			
		  return execute(sqlQuery, conditionArgs);
			
		}
  
  
	/**
	 * List the entities in JSON format.
	 *
	 * @param entities  entities to return as JSON strings
	 * @return the string
	 */
  public static String writeJSON(ResultSet entities) {
    logger.log(Level.INFO, "creating JSON format object");
    return "";
  }
  
  
 
  
	/**
	 * Utility method to send the error back to UI.
	 *
	 * @param ex the ex
	 * @return the error message
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
  public static String getErrorMessage(Exception ex) throws IOException{
    return "Error:"+ex.toString();
  }
  
  
  public static long calculateDays(String startDate, String endDate)
  {
	  startDate = getCalendarFormat(startDate);
	  endDate = getCalendarFormat(endDate);
      @SuppressWarnings("deprecation")
		Date sDate = new Date(startDate);
      @SuppressWarnings("deprecation")
		Date eDate = new Date(endDate);
      Calendar cal3 = Calendar.getInstance();
      cal3.setTime(sDate);
      Calendar cal4 = Calendar.getInstance();
      cal4.setTime(eDate);
      return daysBetween(cal3, cal4);
  }
  
  //Input to this method should be in "YYYYMMDD" format
  public static String getCalendarFormat(String input)
  {
	String stYr = input.substring(0, 4);
	String stM =  input.substring(4, 6);
	String stD =  input.substring(6);
		
	return stYr + "/" + stM + "/" + stD;
  }
  
  public static long daysBetween(Calendar startDate, Calendar endDate) {
      Calendar date = (Calendar) startDate.clone();
      long daysBetween = 0;
      while (date.before(endDate)) {
          date.add(Calendar.DAY_OF_MONTH, 1);
          daysBetween++;
      }
      return daysBetween;
  }
  
  
  public double getRentalPriceForRI(boolean pe, boolean pa, boolean li, String classType, long rentalDuration, double rentalPricePerDay)
  {
	  double rentalPx = 0.0;
	  double discount = 0;
	  
	  try
	  {
		  if(pe)
		  {
			  String[] peColumns = new String[] { "PECostPerDay", "PECostPerWeek", "PECostPerMonth" };
			  rentalPx += getPerInsCOntribsForRI(peColumns, classType, rentalDuration);
		  }
		  if(pa)
		  {
			  String[] paColumns  = new String[] { "PACostPerDay", "PACostPerWeek", "PACostPerMonth" };	
			  rentalPx += getPerInsCOntribsForRI(paColumns, classType, rentalDuration);
		  }
		  if(li)
		  {
			  String[] liColumns  = new String[] { "LICostPerDay", "LICostPerWeek", "LICostPerMonth" };
			  rentalPx += getPerInsCOntribsForRI(liColumns, classType, rentalDuration);
		  }	  
		  
		  rentalPx += (rentalPricePerDay * rentalDuration);
		  
		  if(rentalDuration > numOfDaysInMonth)
			  discount = monthsRentDiscount;
		  else if(rentalDuration > numOfDaysInWeek)
			  discount = weeksRentDiscount;
		  else
			  discount = daysRentDiscount;
		  
		  
		  rentalPx = (1 - discount) * rentalPx; 
		  
	  }
	  catch(Exception ex)
	  {
		  System.out.println(ex.getMessage());		  
	  }
	  
	  return rentalPx;
  }
  
  public double getPerInsCOntribsForRI(String[] columnNames, String classType, long rentalDuration) throws SQLException
  {
	  String condition = " RIClassType = " + "'" + classType + "'";
	  //String[] conditionArgs = new String[] {classType};
	  ResultSet rs = selectEntity("RentalInsurance", columnNames, condition, null);
	  double costPerMonth = 0, costPerDay = 0, costPerWeek = 0;
	  while(rs.next())
	  {
		  costPerDay = Double.parseDouble(rs.getString(1));
		  costPerWeek = Double.parseDouble(rs.getString(2));
		  costPerMonth = Double.parseDouble(rs.getString(3));
	  }
	  
	  int numOfMonths, numOfWeeks, numOfDays;
	  long remDays;
	  
	  
	  numOfMonths = (int)(rentalDuration / numOfDaysInMonth);
	  remDays = rentalDuration % numOfDaysInMonth;
		  
	  numOfWeeks = (int) (remDays / numOfDaysInWeek);
	  remDays = remDays % numOfDaysInWeek;
		  
	  numOfDays = (int)remDays;
	  
	  double totalCost = numOfMonths * costPerMonth + numOfWeeks * costPerWeek + numOfDays * costPerDay;
	  return totalCost;
  }
 }