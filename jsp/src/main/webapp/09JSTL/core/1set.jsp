<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  COre태그 
    변수선언 , 조건문 , 반복문 등을 대체 하는 태그
    
    -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--set : 변수선언 (setAttribute()) 
    var : 변수명
    value : 값
    scope : 저장영역 - 기본값은 page
-->
<c:set var="directVar" value="100" scope="request" />
<c:set var="elVar" value="${directVar mod 5 }" />
<c:set var="dateVar" value="<%=new Date() %>" />
<c:set var="betweenVar">값</c:set>

<h2>el을 이용해서 변수 출력</h2>
<ul>
  <li>${directVar }</li>
  <li>${elVar }</li>
  <li>${dateVar }</li>
  <li>${betweenVar }</li>
</ul>

<h2>자바빈즈 생성1 - 생성자를 이용</h2>
 <c:set var="person" 
        value='<%= new Person("GD", 34)%>'></c:set>
        
 <ul>
    <li>${person.name}</li>
    <li>${person.age}</li>
 </ul>       

<h2>자바빈즈 생성2 - 생성 후 값을 변경</h2>

<c:set var="person2" value='<%= new Person("대성",30) %>'></c:set>
<p>변경전</p>
리스트 : ${person2 }
<ul>
  <li>${person }</li>
  <li>${person2.name }</li>
  <li>${person2.age }</li>


</ul>
<!-- 자바빈즈 생성 후 값을 변경 해봅시다 
   target : 자바빈즈 변수명
   property : 자바빈즈 속성명(멤버변수명)
   value : 값 지정

 -->
<c:set target="${person2}" property="name" value="빅뱅"></c:set>
<c:set target="${person2}" property="age" value="26"></c:set>
<p>변경후</p>
<ul>
  <li>${person }</li>
  <li>${person2.name }</li>
  <li>${person2.age }</li>
</ul>

<h2>List 컬렉션 이용하기</h2>
<%
  // 리스트 생성
  List<Person> list = new ArrayList <>(); 
  list.add(new Person("세븐틴", 17));
  list.add(new Person("블랙핑크", 27));

%>
<c:set var="list" value="<%=list %> "></c:set>
<ul>
   <li>${ list[0].name}</li>
   <li>${ list[0].age}</li>
</ul>
<ul>
   <li>${ list[1].name}</li>
   <li>${ list[1].age}</li>
</ul>
<hr>
<%
 for(Person p:list){
	 
 }

%>



<!--  리스트를 출력하기위해 반복문 ㄱ -->
<p>foreach를 사용해서 반복문을 만들어 봅시다.</p>
<c:forEach var="list" items="<%=list %>">
 이름 : ${person.name }
 나이 : ${person.age }
</c:forEach>


<h2>Map 컬렉션 이용</h2>
<%
   // 다른타입의 여러가지 값 저장하기가 용이
   // ajax, petch를 이용할 경우 -> 
   // 데이터만 전달 -> 스크립트에서 데이터를 피싱하여 화면을 다시 그려주어야 해요
   

 Map<String, Person> map = new HashMap<>();
map.put("person1", new Person("사람1", 27));
map.put("person2", new Person("사람2", 28));
%>

<!-- map은 변수로 선언만 하고 영역에 저장하지 않았기 떄문에 el문법으로 사용 불가능. -->
<c:set var="pMap" value="<%=map %>"></c:set>

<ul>
   <li>${ pMap.person1.name}</li>
   <li>${ pMap.person1.age}</li>
</ul>
<ul>
   <li>${ pMap.person2.name}</li>
   <li>${ pMap.person2.age}</li>
</ul>







<hr>
</body>
</html>















