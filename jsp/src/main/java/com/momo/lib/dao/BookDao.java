package com.momo.lib.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.me.com.DBConnPool;
import com.momo.lib.dto.BookDto;

public class BookDao extends DBConnPool{
	
	
	/*
	 * 도서목록을 조회 후 리스트를 반환합니다.
	 */
	
	
	
	
   public List<BookDto> getList(){
		String sql = "select * from book";
		List<BookDto> list = new ArrayList<>();
		
	try {
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			String no = rs.getString("no");
			String title = rs.getString("title");
			String author = rs.getString("author");
			
			
			BookDto dto = new BookDto(no,title,author);
		list.add(dto);
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return list;
	}

}
