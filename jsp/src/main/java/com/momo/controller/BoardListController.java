package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.me.dao.BoardDao;
import com.momo.dto.Criteria;
import com.momo.dto.PageDto;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 리스트 조회 하기 위한 파라메터 수집.
		Criteria cri = new Criteria(request.getParameter("pageNo")
				         ,request.getParameter("amount"));
		
		BoardDao dao = new BoardDao();		
		request.setAttribute("list",dao.getList(cri));	
//
		
		// 페이지 블럭을 생성하기 위해 필요한 정보 저장
		int totalCnt = dao.getTotalCnt();
		System.out.println(totalCnt);
		PageDto pageDto = new PageDto(totalCnt, cri);
		
		request.setAttribute("pageDto", pageDto);
		
		dao.close();
		
		//페이지 전환
		// forward 방식으로 전환하므로 request영역이 공유됨
		request.getRequestDispatcher("/06session/servletEx/board.jsp").forward(request, response);

		
		// 리스트 조회후 리쿼스트 영역에 저장
		
		//페이지 조회에 필요한 정보 수집
		//pageNo : 요청 페이지 번호
		//amount : 페이지당 게시물의 수
//		int pageNo = 1;
//		int amount = 10;
//		try {
//		if(request.getParameter("pageNo") !=null 
//				&& !"".equals(request.getParameter("pageNo"))) {
//			pageNo = Integer.parseInt(request.getParameter("pageNo"));
//		}
//		if(request.getParameter("amount") !=null 
//				&& !"".equals(request.getParameter("amount"))) {
//			amount = Integer.parseInt(request.getParameter("amount"));
//		}
//		}catch(Exception e) {
//			System.out.println("파라메러 수집중 에러 발생");
//		}
//		
//		int endNum = pageNo * amount;
//		int startNum = endNum - (amount-1);
//		
//		
		}
}
