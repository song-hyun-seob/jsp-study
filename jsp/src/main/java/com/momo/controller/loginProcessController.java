package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.me.dao.MemberDao;
import com.momo.dto.MemberDto;

/**
 * Servlet implementation class loginProcessController
 */
@WebServlet("/06session/ex/loginProcess")
public class loginProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1. 요청  파라메터
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		// 2. 사용자 인증(id,pw 일치하는 사용가자 있다면 member객체를 반환하고 아니면 ull반환)
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.login(id, pw);
		
		// 4. 페이지 전환.
     	if(dto !=null) {
     		// 로그인 성공
     		// 3. request영역에 memberDto 저장
     		HttpSession session = request.getSession();
     		// 웹브라우저를 닫을때 까지 세션 정보 유지
     		
     		session.setAttribute("memberDto", session);
     		session.setAttribute("userId", id);
     		
     		response.sendRedirect("");
     	}else {
     		// 로그인 실패
            request.getRequestDispatcher("loginForm.jsp?isError=1").forward(request, response);     		
     	
     	}
     	
	}

}
	
	