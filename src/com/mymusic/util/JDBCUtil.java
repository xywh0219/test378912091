package com.mymusic.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.sql.PreparedStatement;
 

public class JDBCUtil {
	/*private static String url;
	private static String user;
	private static String password;
	private static String driver;
	static {
		Properties pro = new Properties();
		InputStream is = JDBCUtil.class.getClassLoader().getResourceAsStream(
				"db.properties");
		try {
			pro.load(is);
			url = pro.getProperty("jdbc.url");
			user = pro.getProperty("jdbc.user");
			password = pro.getProperty("jdbc.password");
			driver = pro.getProperty("jdbc.driver");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}*/
	 public static final  String DIRVER="com.mysql.jdbc.Driver";
	  public static final String URL="jdbc:mysql://127.0.0.1:3306/mymusic";
	  public static final String USER="root";
	  public static final String PASSWORD="123456";


	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(DIRVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	/**
	 * @param con
	 * @param stmt
	 * @param rs
	 */
	
	public static void closeResource(Connection con, PreparedStatement psment,Statement stmt,
			ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if(psment!=null){
				psment.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (con != null && !con.isClosed()) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void closeResource(Connection con,PreparedStatement psment, Statement stmt) {
		try {
			if(psment!=null){
				psment.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (con != null && !con.isClosed()) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}