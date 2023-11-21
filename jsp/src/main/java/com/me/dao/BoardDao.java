package com.me.dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import com.me.com.DBConnPool;
import com.me.com.DBConnection;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;

import oracle.net.aso.p;
//DBConnPoll
// : 톰켓에서 제공해주는 기능을 사용하여 커넥션풀이라는 공간에 커넥션 객체를 미리 생성 해놓고 사용하는개체
// main에도 사용이 불가능. 서버가 실행되어야 사용 가능.
// 만약, main 메소드를 이용해서 테스트를 하고 싶다면 상속받는 객체를 DBConnection으로 변경
public class BoardDao extends DBConnPool{
	//public int insetBoard(BoardDto dto) {
		
	//}
	
	public int deleteBoard(String num) {
		String sql = "delete from board whhere num=?";
		int res = 0;
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, num);
					res = pstmt.executeUpdate();
 				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				return res;
	}
	
	
	/*
	 * insert, update,delet의 반환타입은 int(몇건이 처리 되었는지 반환) 
	 * 반환타입은 int로 설정
	 */
	
	public int visitcountUp(String num) {
		
		int res = 0;
		
		String sql = "updat board\r\n"
				 + "set  visitcount = visitcount+1\r\n"
				 + "where num = ? ";
	try {	
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, num);
		
		 res = pstmt.executeUpdate();
		
		} catch (Exception e) {
			
		} 
			return res;
		}
	
	public BoardDto getOne(String num) {
		BoardDto dto = new BoardDto();
		String sql = "select *\r\n"
				     + "from board\r\n"
				 +"where num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt = setString(1,num);
			
			pstmt.executeQuery();
			while(rs.next()) {
				dto = new BoardDto();
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setNum(rs.getString("num"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setTitle(rs.getString("title"));
				dto.setVisitcount(rs.getString("visitcount"));
				
			}
		}catch (SQLException e) {
			
			e.printStackTrace();
		}
		return dto;
	}
	/*
	 * 게시글 목록을 반환
	 * @return List<BoardDto>
	 */
	
	private PreparedStatement setString(int i, String num) {
		// TODO Auto-generated method stub
		return null;
	}


	public List<BoardDto> getList(Criteria cri) {
		List<BoardDto> list = new ArrayList<>();
		try {
			String sql = "	select *\r\n"
					+ "		from 	( \r\n"
					+ "    			select rownum rnum, b.* \r\n"
					+ "    			from 	(\r\n"
					+ "        				select * \r\n"
					+ "        				from board \r\n"
					+ "        				-- 최신순으로 정렬\r\n"
					+ "        				order by num desc\r\n"
					+ "       				)b\r\n"
					+ "       		)\r\n"
					+ "       where rnum between ? and ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cri.getStartNum());
			pstmt.setInt(2, cri.getEndNum());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				System.out.println("id :" + rs.getString("id"));
				list.add(dto);
				
			}
			System.out.println("=========" + list);
			return list;	
		} catch (SQLException e) {
			System.out.println("SQLException 머시꺵머시꺵");
			e.printStackTrace();
		}
		/*
		 * 게시글의 총 건수를 조회후 반납
		 *- 집계함수를 이용하여 게시글의 총 건수를 구하자.
		 *  return 게시글 총 건수.	
		 */
		
		return list;	
	}
   public int getTotalCnt() {
	   int res = 0;
	   String sql = "select count(*) from board";
	   try {
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			res = rs.getInt(1);
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	   return res;
   }
	
	
}
