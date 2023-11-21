package com.me;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.momo.dto.job;

public class DBConnectionSelf {

	public static void main(String[] args) {
		String url = "";
		String id = "test";
		String pw ="1234";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs   = null;
		
	
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection(url , id , pw);
		
			String sql ="update job set job_name = '대표이사'where job_code='J1'";
			
			stmt = con.createStatement();
			
			
		} catch(ClassNotFoundException e) {
			
		} catch (SQLException e) {
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		}finally {
			try {
				  if(rs!=null)rs.close();
				  if(stmt!=null)stmt.close();
				  if(con!=null)con.close();
			}catch(Exception e) {
				System.out.println("자원 해제중 제외사항 발생");
				e.printStackTrace();
			}
		}
	    
        		
		
	}
	
	

}
