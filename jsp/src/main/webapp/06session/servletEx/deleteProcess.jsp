<%@page import="com.momo.utils.JSFunction"%>
<%@page import="com.me.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
if(request.getParameter("num") !=null) {
String num = request.getParameter("num").toString();
BoardDao dao = new BoardDao();
if(dao.deleteBoard(num) != 1) {
	JSFunction.alertBack("존재하지않는 게시믈", out);
}
// 정상적으로 삭제처리가 된 경우
// 메시지 처리 후 리스트페이지로 이동
JSFunction.alertLocation("삭제됨", "/boardList", out);
	
}else {
	/*
	out.print("<script type='text/javascript'>");
	out.print("alert('게시물 번호(num) 를 확인 불가능합니다.')");
	//뒤로가기
	out.print("history.back");
	out.print("</script>");
	*/
	JSFunction.alertBack("게시물번호를 확인할수없다.",out);
}

 %>

</body>
</html>