<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>액션캐그 한번에 받기</h1>
    <jsp:useBean id="person" class="com.momo.dto.Person"></jsp:useBean>
    <jsp:setProperty property="*" name="person"/>
    
    <ul>
    <li>
   	<jsp:getProperty property="name" name="person"/>   
    </li>
    <li>
   <jsp:getProperty property="age" name="person"/>
    </li>
    </ul>
 
</body>
</html>