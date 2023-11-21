package com.momo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.me.dao.BoardDao;
import com.momo.dto.BoardDto;


@WebServlet("/BoardWrite")
public class BoardWriterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") !=null) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 후 게시글 작성 가능.')");
			return;
		}
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
				
		String id = session.getAttribute("userId").toString();
		BoardDto dto = new BoardDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setId(id);
	}

}
