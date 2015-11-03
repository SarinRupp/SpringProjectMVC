package sarin.com.app.dao;

import java.sql.*;



public class dbconnection {
	private static Connection con =null;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName("org.postgresql.Driver");
		con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Student","postgres","123");
		return con;
		
	}
	public void close(){
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
	
		dbconnection dbconnect = new dbconnection();
		System.out.println(dbconnect.getConnection().getMetaData().getDatabaseProductName());
		dbconnect.close();
		 
	}
	
}
