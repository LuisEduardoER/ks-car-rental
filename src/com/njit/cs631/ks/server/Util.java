// Copyright 2011, Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
package com.njit.cs631.ks.server;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

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
  
  Connection dbConnection = null;
  Boolean isOpened = false;
  
  public void open(String sqlUrl, String dbName, String userName, String password) throws SQLException {
		String url = "jdbc:mysql://" + SQLURL;

		try {
			Class.forName(this.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new SQLException("My SQL Driver not found");
		}
		
		dbConnection = (Connection) DriverManager.getConnection(url + "/" + DBNAME, USERNAME, PASSWORD);
		isOpened = true;
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
			this.close();
			this.open(SQLURL, DBNAME, USERNAME, PASSWORD);
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
 }