package com.momo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.me.dao.BoardDao;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/ListController")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
/*
 * 리스트 조회
 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	BoardDao dao = new BoardDao();
	// request에 list 담기
	List<BoardDto> list = dao.getList(new Criteria());
	request.setAttribute("list", list);
	//foward
	
	request.getRequestDispatcher("/09JSTL/core/list.jsp").forward(request, response);
}
	
	
	
	
	
}
