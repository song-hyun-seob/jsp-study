<%@page import="com.momo.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h1>성공</h1>
<%=session.getAttribute("userId")%>
<a href="logoutProcess.jsp">로그아웃</a>
<hr>
<%
// 오류발생 하지 않도록 null 처리
if(session.getAttribute("memberDto") !=null) {
	
MemberDto dto = (MemberDto)session.getAttribute("memberDto");
%>
아이디:<%=dto.getId() %>
이름 :<%=dto.getName() %>
등록일:<%=dto.getRegidate() %>
	
<%} %>
</body>
</html>