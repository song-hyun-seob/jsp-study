package com.me.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class DBConnection {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public DBConnection() {
		try {
			Class.forName("oralce.jdbc.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id  = "test";
			String pw = "1234";
			
			con = DriverManager.getConnection(url,id,pw);
			System.out.println("DB 연결 선공");
				
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩 x");
			e.printStackTrace(); 
				
			}catch(SQLException e) {
				System.out.println("커넥션 객체 생성 실패");
				e.printStackTrace(); 
			}
	}
		
		public DBConnection(String driver, String url, String id, String pw) {
		try {
			Class.forName(driver);
			
			con= DriverManager.getConnection(url, id, pw);
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 - 라이브러리 확인");
			e.printStackTrace();
		}catch(SQLException e) {
			System.out.println("커넥션 생성 실패");
			e.printStackTrace();
		}
		
	}
		public DBConnection(ServletContext application) {
			String driver = application.getInitParameter("driver");
			String url    = application.getInitParameter("url");
			String id     = application.getInitParameter("id");
			String pw     = application.getInitParameter("pw");
			
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url,id,pw);
				System.out.println("application 내장객체를 활용한 커넥션 생성");
			}catch(ClassNotFoundException e) {
				System.out.println("드라이버 로딩 실패 0- 라이브러리 확인");
				e.printStackTrace();
			}catch(SQLException e) {
				System.out.println("커넥션 객체 생성 실패");
				e.printStackTrace();
			}
		}
	
	public void close() {
		try {
			if(rs !=null)rs.close();
			if(pstmt !=null)pstmt.close();
			if(stmt !=null)stmt.close();
			if(con !=null)con.close();
		}catch (SQLException e){
			System.out.println("자원반납중 오류 발생.");
			e.printStackTrace();
			
		}
	}
}