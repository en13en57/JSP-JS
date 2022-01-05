package kr.green.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
	// DB 연결을 얻어주는 메서드 . 여러개를 오버로딩 하면 편하게 사용 가능하다.
	public static Connection getConnection() {
		Connection conn = null;
		String className = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/javadb";
		String user = "javauser";
		String password = "123456";		
		try {
			Class.forName(className);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	// 비밀번호값만 바뀔때 사용
	public static Connection getConnection(String password) {
		Connection conn = null;
		String className = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/javadb";
		String user = "javauser";
		try {
			Class.forName(className);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static Connection getConnection(String dbName, String user, String password) {
		Connection conn = null;
		String className = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/" + dbName;
		try {
			Class.forName(className);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static Connection getConnection(String className, String url, String user, String password) {
		Connection conn = null;
		try {
			Class.forName(className);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	// 2. 닫는 메서드 3개
	public static void close(Connection conn) {
		try {
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt != null) stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs != null) rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 3. 명령을 취소하는 메서드 생성
	public static void rollback(Connection conn) {
		try {
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
