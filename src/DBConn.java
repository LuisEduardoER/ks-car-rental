import java.sql.*;

import com.mysql.jdbc.PreparedStatement;

public class DBConn {
	
  public static void main(String a[])
   {
  Connection con = null;
  String url = "jdbc:mysql://sql2.njit.edu:3306/";
  String dbName = "ss984";
  String driver = "com.mysql.jdbc.Driver";
  String userName = "ss984";
  String password = "xtlHyPSEC";
  try {
  Class.forName(driver).newInstance();
  con = DriverManager.getConnection(url+dbName,userName,password);
  String query = "select * from Customer where PrimaryPhoneNo = ?";
  PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
  st.setString(1, "8623715460");
  ResultSet rs = st.executeQuery();
   System.out.println("Results");
   while( rs.next() ) {
    String data = rs.getString(1);
    System.out.println( data );
  }
  st.close();
  }
  catch( Exception e ) {
   System.out.println(e.getMessage());
   e.printStackTrace();
   }
   }
}