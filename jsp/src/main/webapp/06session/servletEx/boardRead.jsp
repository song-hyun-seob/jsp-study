<%@page import="com.momo.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/boardList" name="searchForm">
num :<input type="text" name="num"  value="${param.num }">
pageNo : <input type="text" name="pageNo"  value="${param.pageNo}">
searchWord : <input type="text" name="searchWord"  value="${param.searchWord}">
searchField : <input type="text" name="searchField"  value="${param.searchField}">
</form>



<script type="text/javascript">
window.onload = function() {
	listBtn.onclick=function() {
		location.href='/boardList';
		
	}
	deleteBtn.addEventListener('click',()=> {
		//jsp를 단독으로 실행할 경우 , 경로문제가 발생 x
		// 같은 경로에 들어 있기때문에
		// 벗 서블릿을 통해 들어오는 경우 경로문제가 발생
		// 그래서 루트경로부터 풀 경로를 적어주는것이 오류가 발생하지 않도록 하는 방법.
		
		location.href=
			'/06session/servletEx/deleteProcess.jsp?num=${param.num}'; 
	});
}  


</script>
<h2>게시글 상세보기</h2>
<button id="listBtn">리스트 이동</button>
<button id="editBtn">수정</button>
<button id="deleteBtn">삭제</button>
<%
  if(request.getAttribute("dto") !=null ) {
	  BoardDto dto = (BoardDto)request.getAttribute("dto");
  
%>
<br>제목: <%=dto.getTitle() %>
<br>내용: <%=dto.getContent() %>
<br>작성자:<%=dto.getId() %>
<br>작성일:<%=dto.getPostdate() %>
<br>조회수:<%=dto.getVisitcount() %>
<% } %>


</body>
</html>