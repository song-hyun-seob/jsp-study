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
<!-- html 태그주석 -->

<%-- 
자바빈 이란?
     요청발시 화면으로부터 입력받은 데이터를 하나의 객체 담아 편리하게 사용 할 수있습니다.
     jsp페이지간의 데이터 전달할 경우 자바빈을 이용.
     표준 액션태그를 이용해 자바빈을 활용하면 코드가 간결.
     
     자바빈으로 생성될수 있는 객체(DTO/VO)
	- 자바빈은 기본(default)패키지 이외의 패키지에 속해 있어야 한다.
	- 기본 생성자가 존재해야 한다.
	- 멤버변수의 접근제어자는 private로 선언되어야 한다.
	- 멤버변수에 접근 가능한 getter 와 setter 메서드가 존재해야 한다.
	- getter 와 setter는 접근자가 public으로 선언되어야 한다. 

     
 <jsp:useBean> : 자바빈 생성
 <jsp:setProperty> : 자바빈 속성을 저장.
 <jsp:gettProperty> : 자바빈 속성을 추출.
 
 id  : 자바빈즈 이름
 class : 패키지명을 포함한 클래스명
 scope : 저장될영역.
 
 --%>
 <!-- 객체생성 -->
 <jsp:useBean id="boardDto"
                  class="com.momo.dto.BoardDto" 
                     scope="request"></jsp:useBean>
 <!-- setProperty메서드를 이용해서 속성값을 지정 -->
 <!-- 
 name : 자바빈즈 이름
 property : 필드명
 value    : 필드값
 
 
  -->
  <!-- 객체생성 -->
  <%
  BoardDto bDto = new BoardDto();
  bDto.setContent("내용");
  bDto.setTitle("재목");
  %>
 
 
 
 <jsp:setProperty property="content" name="boardDto" value="내용"/>
  <jsp:setProperty property="title" name="boardDto" value="제목"/> 
  
  <%
  
  if(request.getAttribute("boardDto") !=null) {
	  BoardDto dto = (BoardDto)request.getAttribute("boardDto");
  %>
  제목 :<%=dto.getTitle()%> 
  내용 :<%=dto.getContent()%>
 
<%
} 
%>
   
  
                     
</body>
</html>