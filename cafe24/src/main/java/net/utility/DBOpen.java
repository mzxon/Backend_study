package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	
	//오라클 데이터베이스 연결 메소드

	public Connection getConnection() {
		Connection con=null;
		
		try {
			String url	   ="jdbc:mysql://localhost/bearjioc";
			String user	   ="bearjioc";
			String password="Bearjioc0427";
			String driver  ="org.gjt.mm.mysql.Driver"; //ojdbc8.jar
			Class.forName(driver);	
			con=DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			System.out.println("오라클DB연결실패: "+e);
		}
		return con;
	}
}

