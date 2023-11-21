<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>액션태그를 활용한 포워딩;;;;</h1>
<!-- 
 페이지 전환(이동)
 page 영역은 공유되지않고
 request 영역은 공유 됩니다.     
      
  -->
  <%
  request.setCharacterEncoding("utf-8");
  
  // 내장객체 영역에 저장.
  pageContext.setAttribute("pageAttr", "페이지 영역");
  request.setAttribute("requestAttr", "요청영역");
  
  //request.getRequestDispatcher("경로").forward(request.response);
  %>

<jsp:forward page="forwardSub.jsp">
  <jsp:param value="액션태크 파라메터" name="param"/>
</jsp:forward>


</body>
</html>