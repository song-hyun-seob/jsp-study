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
<h2>${param.title } / ${param.titleUrl }</h2>
<!--  외부 페이지에 연결하기. -->
<c:import url="https://goldenrabbit.co.kr/"></c:import>
</body>
</html>