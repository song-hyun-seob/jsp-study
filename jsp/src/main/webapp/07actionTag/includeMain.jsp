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
pageContext.setAttribute("attrPage","attrPage");
 request.setAttribute("attrRequest","attrRequest");
%>
<h2>지시어와 액션태그 동작 방식비교</h2>
<h3>지시어 방식</h3>
<hr>
<%@ include file="inc/OuterPage1.jsp" %>
include지시자 방식에서 선언한 변수 : <%= newVar1 %>
<p>페이지영역(scope) 궁유 </p>
<p>include 되는 페이지에서 생성한 변수도 공유 가능 </p>

<hr>
<h3>액션태그 방식</h3>
<!--  액션태그 방식
     페이지영역이 공유 x
     외부파일에서 생성된 변수가 공유 x
         -->
<jsp:include page="inc/OuterPage2.jsp"></jsp:include>
액션태그 방식에서 선언한 변수 : <--%= newVar2 %-->
</body>
</html>