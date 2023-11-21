<%@page import="com.momo.dto.MemberDto"%>
<%@page import="com.me.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 프로세스</h1>
<%
// 사용자의 요청 파라메터 수집 (id,pw)
     // 데이터 베이스에 등록된 사용자인지 확인
     // - user 테이블생성
     // - 사용자 정보 등록
     // - 
String id = request.getParameter("user_id");
String pass = request.getParameter("user_pw");

MemberDao dao = new MemberDao();
// 로그인 처리
MemberDto dto = dao.login(id, pass);
// 자원해제.
dao.close();

//id, pw가 일치하는 사용자 정보를 반환.
if(dto !=null) {
	// 로그인 성공 -> 메인페이지 이동
	// 세션에 저장
	session.setAttribute("memberDto", dto);
	session.setAttribute("userId", id);
	response.sendRedirect("main.jsp");
}else{
	// 로그인 실패 -> 로그인페이조로 이동 후 메시지 출력.
	request.getRequestDispatcher("loginForm.jsp?isError=1").forward(request,response);
}
%>

</body>
</html>