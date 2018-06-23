package com.thanaphat.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectManager {
	public Connection ConnectDB() {
		Connection connectDB = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connectDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/calculatecompensation", "root", "12345678");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connectDB;
	}
}
