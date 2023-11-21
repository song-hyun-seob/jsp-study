package com.me;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionInsert {
	public static void main (String[]args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id  = "test";
		String pw = "1234";
		
		Connection con = null;
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. 커넥션 생성
			 con =  DriverManager.getConnection(url, id , pw);
			 // 3. 쿼리 생성
			 String sql = "insert into job values (?,?)";
			 //4. prstmt 객체생성
			PreparedStatement pstmt = con.prepareStatement(sql);
			//5. 인파라메터 세팅.
			//쿼리상에 ? 로 작성된 부분을 값으로 변경.
			pstmt.setString(1, "99");
			pstmt.setString(2, "값99");
			
			// 6. 쿼리실행.
			int res = pstmt.executeUpdate();
			System.out.println(res + "건 생성 되었다.");
			 
		}catch (ClassNotFoundException e) {
			System.out.println("라이브러리 확인");
			e.printStackTrace();
		} catch (SQLException e) {
		    
			e.printStackTrace();
		}
		
		
	}

}
