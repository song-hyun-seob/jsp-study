<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>나가</h1>
<%
// 세션 무효화
session.invalidate();
response.sendRedirect("loginFrom.jsp");


%>
</body>
</html>