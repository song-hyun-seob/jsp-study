<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type = "text/css">{
float : left;  //가로로 출력하기 위해 float 사용
width :25%;
list_Style : none; 
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header id="logo">
<nav>
     <ul>
       <li>Home</li>
       <li>Board</li>
       <li>Contact</li>
       <li>Map</li>       
       <li>
	       <form method="get" name="loginForm">
	
				<c:if test="${empty userId }">
				  <button id="loginBtn">로그인</button>
				</c:if>
				<c:if test="${not empty userId }">
				${userId }님 환영
				<button id="logoutBtn" class="btn btn-danger">로그아웃</button>
				</c:if>
		 </form>
	</li>
</ul>
</nav>
</header>

</body>
</html>