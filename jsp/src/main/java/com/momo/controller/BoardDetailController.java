package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.me.dao.BoardDao;
import com.momo.dto.BoardDto;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/boardRead")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		// 사용자 요청
		String num = request.getParameter("num");
		System.out.println("요청 게시글번호 :" + num);
		
		// 1건의 게시글 조회
		BoardDao dao = new BoardDao();
		// 상세보기
		BoardDto dto = dao.getOne(num);
		// 조회수
		request.setAttribute("dto", dto);
		
		dao.visitcountUp(num);
		dao.close();
		
		
		// 페이지 전환.
		request.getRequestDispatcher("/06session/servletEx/boardRead.jsp").forward(request,response);
		
		
	}



}
