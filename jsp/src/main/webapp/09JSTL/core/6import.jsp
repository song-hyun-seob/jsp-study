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
<h2>importtttttt 태그</h2>
<!-- 
  import : 외부파일 현재 위치 삽입
  url : 외부 파일 경로 (기준은 나)
  scope : 영억
  var  : 변수명 
            변수명을 사용하면 선언과 삽입을 분리 할 수 있습니다


 -->
<!-- ../ : 상위폴더 이동 -->
<hr>
<c:import url="../inc/link.jsp" var="link">
  <c:param name="title">페이지에 오신걸 환영한다</c:param>
</c:import>
<hr>
<%-- <c:import url="../inc/otherPage.jsp"></c:import> --%>

  ${link }
 <h2>iframe을 이용한 외부자원 삽입</h2>
 <iframe src="../inc/otherPage.jsp" style="width:500px; height:500px"></iframe> 
  
  <h2>out태그 - el 표현언어를 출력 합니다.</h2>
  <!-- value속성을 이용해서 값을 지정하고 태그안에도 값을 지정 한 경우, 오류 발생.
       set태그를 이용해서 값을 지정 할때는 한가지 방법으로만 지정. -->
  <c:set var="iTag" >
  i태그는 <i>기울임</i>을 표현
  </c:set>
  
  <c:out value="${iTag }"></c:out><br>
  <c:out value="${iTag }" escapeXml="false"></c:out><br>
  <c:out value="${param.text }" default="값없음."></c:out>
  <c:out value="" default="빈 문자열도 값입니다."></c:out>
  
  <h2>redirect</h2>
  <!-- redirect : request 영역이 공유 안됨 -->
  <%--  <c:redirect url="../inc/otherPage.jsp">
    <c:param name="title">제목</c:param>
  </c:redirect>
    --%>
  
  
  
  
  
  
  
  
  
  
  
  
  
</body>
</html>