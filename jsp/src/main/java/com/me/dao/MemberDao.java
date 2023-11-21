package com.me.dao;

import java.sql.SQLException;

import com.me.com.DBConnPool;
import com.momo.dto.MemberDto;


public class MemberDao extends DBConnPool {
	
	public MemberDto login(String id, String pass) {
	 MemberDto memberDto = new MemberDto();
	 String sql = "select * \r\n"
			 + "from  member \r\n"
			 + "where id = ?\r\n"
			 +"and pass = ?";
	 
	 System.out.println(sql);
	 // 입력받은 사용자 정보가 데이터베이스로부터 조회.
	 try {
		 pstmt = con.prepareStatement(sql);
		 pstmt.setString(1,id);
		 pstmt.setString(2,pass);
		 rs = pstmt.executeQuery();
		 
		 
		 if(rs.next()) {
			 memberDto.setId(rs.getString(1));
			 memberDto.setName(rs.getString(2));
			 memberDto.setRegidate(rs.getString(4));
			 
			 return memberDto;
		 } else {
		 return null;
		 }

	 
		 }catch (SQLException e) {
		 e.printStackTrace();	 
		 return null;
	 }
	 // 사용자 정보를 MemberDto객체에 담아서 반환
 }
}
