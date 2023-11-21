package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.me.dao.BoardDao;
import com.me.dao.MemberDao;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;
import com.momo.dto.MemberDto;
import com.momo.dto.PageDto;

/**
 * Servlet implementation class loginController
 */
@WebServlet("/06session/servletEx/loginProcess")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*
	 * Controller 역할
	 * - 파라메터 수집
	 * - 페이지 전환(jsp로)
	 * 
	 * 
	 * 사용자 로그인 요청 처리
	 * 1. 파라메터 수집(id, pw)
	 * 2. 데이터베이스(DB)부터 해당 사용자 있는지 확인
	 * 3. 사용자가 존재하면 로그인처리 (저장)
	 * 4. 사용자가 존재 하지 않으면 이전으로 전환.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		//servlet 세션을 사용하기위해 request로 깹니다.
		HttpSession session = request.getSession();
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.login(id,pw) ;
		dao.close();
		
		if(dto !=null) {
			session.setAttribute("userId", dto.getId());
			session.setAttribute("Member", dto);
			
			//페이지 전환
			BoardDao boardDao = new BoardDao();
			Criteria cri = new Criteria();
			PageDto pageDto = new PageDto(BoardDao.getTotalCnt(), cri);
			request.setAttribute("list", boardDao.getList(cri));
			request.getRequestDispatcher("board.jsp").forward(request, response);
			boardDao.close();
			//response.sendRedirect("board.jsp");
			
		}else {
			// login 실패
			response.sendRedirect("loginForm.jsp?isError=1");
			
		}
		
	}

}
