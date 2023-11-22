<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- header 외부파일 인클루드 -->
<%@ include file="common/header.jsp" %>

<!--  도서목록을 출력 -->
도서목록 출력.
<br>${list }
<table border="1">
<tr>
    <th>번호</th>
	<th>제목</th> 
	<th>기사</th>
</tr>

<c:forEach items="${list }" var="dto">
<tr>
    <td>${dto.no }</td>
    <td>${dto.title }</td>
    <td>${dto.author }</td>
</tr>
</c:forEach>
</table>



<!-- footer 외부파일 인클루드 -->
<%@ include file="common/footer.jsp" %>


</body>
</html>