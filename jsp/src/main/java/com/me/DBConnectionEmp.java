package com.me;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionEmp {

	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "test";
		String pw = "1234";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// 1. 드라이버 로딩.
		// DB에 접근하기 위해 필요한 라이브러리가 있는지 확인
		// 2. 커넥션 객체를 생성. 
		
		try {
			//1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2. 커넥션 생성
		 con = DriverManager.getConnection(
				              url, id , pw);
		 int empId = 210;
		 
		//3. 쿼리문장 준비
		String sql = "select emp_id, emp_name, emp_no "
				+ "from employee"
				+ "where emp_id > emp Id";
		
		//4. 쿼리문장실행
	     stmt = con.createStatement();
		// select 문장을 실행 할 경우 resultset을 반환
		// update, insert , delete의 경우 int 타입을 반환
		// -> 실형결관 몇건이 처리되었는지
		 rs = stmt.executeQuery(sql);
		rs.next();
		// 숫자를 입력시 1퉈
		// 숫자 또는 결과 집합 
		System.out.println(rs.getString(rs.getString("emp_id"))+ "");
		System.out.println(rs.getString(rs.getString("emp_name"))+"");
		System.out.println(rs.getString(rs.getString("emp_no"))+"");
		//System.out.println(rs.getString(rs.getString(1))+"");
		//System.out.println(rs.getString(rs.getString(2))+"");
		//System.out.println(rs.getString(rs.getString(3))+"");
		
		// error -> 스트링 타입으로 입력시이름으로 찾으므로 오류 발생
		// System.out.println(rs.getString("1");
	
		
	} catch ( ClassNotFoundException e) {
		System.out.println("드라이버 로딩실패 - 라이브러리가 등록 되었는지 확인 해주세요");
		e.printStackTrace();
	} catch (SQLException e) {
		System.out.println("Connection 객체 생성 실패");
		e.printStackTrace();
	} finally {
		try {
			
			if(rs!=null)rs.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
			
		}catch(Exception e) {
			System.out.println("자원 해제중 재외사항이 발생");
			e.printStackTrace();
			
		}

}
}
}
