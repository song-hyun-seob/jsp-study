<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload = function() {
	console.log('onload event ==========')
	let logoutBtn = document.querySelector("#logoutBtn")
	let loginBtn = document.querySelector("#loginBtn")
	if(logoutBtn !=null){
		logoutBtn.onclick = function () {
			
		//로그아웃
		loginForm.action="/logout";
		loginForm.submit();
		}
	}
	if(loginBtn !=null){
		loginBtn.addEventListener('click',function(){
			
			// 로그인페이지 이동.
		loginForm.action="/06session/servletEx/loginForm.jsp";
		loginForm.submit();
			
		});
		
	}
	
}
</script>
<!--  submit : form의 요소들을 파라메터로 가지고 서버에 요청 
      action : 서버에 요청할 url  주소
       method : 요청 방식
                 get: 조회용 파라메터
                 post: 등록, 수정용 파라메터
       * 버튼을 생성했더라도 form안에 버튼이 하나밖에 없다면 해당버튼은 서브밋 버튼이 된다.          
       
       -->
<form method="get" name="loginForm">

<c:if test="${empty userId }">
  <button id="loginBtn">로그인</button>
</c:if>
<c:if test="${not empty userId }">
${userId }님 환영
<button id="logoutBtn">로그아웃</button>
</c:if>


</form>
<h2>게시글 목록</h2>

     <hr>
<table border="1">
    <tr>
        <th>일련번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
     </tr>
     <!-- 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다 출력 -->
     <!-- 만약에 리스트의 사이즈 0이 아니라면 목록출력 -->
     <c:if test="${empty list }" var="result">
     <tr><td colspan="6">조회된 데이터 없다</td></tr>
     </c:if>
     <c:forEach items="${list }" var="dto">
         <tr>
	         <td>${dto.num }</td>
	         <td><a href="/boardRead?num=${dto.num} "></a>${dto.title }</td>
	         <td>${dto.content }</td>
	         <td>${dto.id }</td>
	         <td>${dto.postdate }</td>
	         <td>${dto.visitcount }</td>
         </tr>
     </c:forEach>
        

</table>

<!--  pageNavi include -->
<%@include file="PageNavi.jsp" %>


</body>
</html>
