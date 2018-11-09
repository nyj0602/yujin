package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// �떛湲��넠 (SingleTon) ***李얠븘蹂닿린
public class DBConn {
	private static Connection connection = null;

	public static Connection getConnection() {
		if (connection == null) {
			String className = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@211.63.89.174:1521:xe";
			String user = "kmong";
			String password = "kmong";
			try {
				Class.forName(className);
				connection = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return connection;

	}

	// �삤踰꾨줈�뵫(以묐났�븿�닔)
	public static Connection getConnection(String url, String user, String password) {

		if (connection == null) {
			String className = "oracle.jdbc.driver.OracleDriver";
			try {
				Class.forName(className);
				connection = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {				
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return connection;
	}

	public static void close() {
		if (connection != null) {
			try {
				if (!connection.isClosed()) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
