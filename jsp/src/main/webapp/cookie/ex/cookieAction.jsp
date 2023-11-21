<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
팝업용 쿠키를 생성 후 cookieMain 페이지로 전환
popupCookie
 -->
<h2>쿠키연습</h2>
<% 
out.print("inactiveToday :" + request.getParameter("inactiveToday"));
if ("Y".equals(request.getParameter("inactiveToday"))) {
	
}
// 서버에서는 response (응답객체)에 쿠키를 추가해주면 브라우저 확인후 쿠키 저장
CookieManager.makeCookie(response,"popupCookie", "Y", 3600);
// main페이지로 페이지로 전환 (sendRedirect / forward)
response.sendRedirect("cookieMain.jsp");

//request.getRequestDispather("cookieMain").forward(request, response);
%>
</body>
</html>