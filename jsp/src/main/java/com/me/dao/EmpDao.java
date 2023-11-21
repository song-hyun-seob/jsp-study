package com.me.dao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import com.me.com.DBConnection;
import com.momo.dto.EmpDto;

/**
 * 데이터 베이스에 접근해서 데이터 입력 출력 삭제 조회 작업 처리하는 객체
 * 조회된 데이터를 반환하기 위해서 리스트에 담아줍니다.
 * Dao -> mapper
 * 
 */

public class EmpDao extends DBConnection {
	/*
	 * 생성자를 이용해 커넥션 객체를 생성후
	 * 멤버변수인 con에 저장.
	 */
	public EmpDao (ServletContext application) {
		super(application);
	}
	/*
	 * 데이터베이스로부터 사원의 목록을 조회하여 반환
	 * 페이지에 출력하기 위해서.
	 */
	
	
	// list는 조회 객체
	public List<EmpDto> getList() {
		List<EmpDto> list = new ArrayList<>();
		
		
		try {
			stmt = con.createStatement();
			String sql = "select * from employee";
			
			
			rs = stmt.executeQuery(sql);
			
			
			while (rs.next()) {
				//System.out.println();
				// 콘솔에 출력하던 데이터를 화면에 출력하기 위해서 리스트에 저장후 반환.
				EmpDto dto = new EmpDto();
				dto.setEmp_id(rs.getString(1));
				dto.setEmp_name(rs.getString(2));
				
				list.add(dto);
			}
			close();
			
		} catch (SQLException e) {
			System.out.println("SQLException 예외사항 발생");
			e.printStackTrace();
			
		}
		return list;
	}

	public static void main(String[] args) {
		//EmpDao empDao = new EmpDao();
		//empDao.getList();
	}

}
