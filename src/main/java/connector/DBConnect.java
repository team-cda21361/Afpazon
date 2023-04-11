package connector;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public static Connection getConnect() {
		Connection myConnection = null;
		
		String url = "jdbc:mysql://localhost/";
		String dbName = "afpazon";
		String user = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			myConnection = DriverManager.getConnection(url+dbName,user,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myConnection;
	}
}
