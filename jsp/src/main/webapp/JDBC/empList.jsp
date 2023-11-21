<%@page import="com.momo.dto.EmpDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Controller를 이용해서 사원목록을 출력</h2>
<%

// request.getAttribute()의 변환타입 object 타입이므로
// 형변환후 사용가능

List<EmpDto> list = (List<EmpDto>)request.getAttribute("list");
%>
<table>
     <tr>
     <td>사번</td>
     <td>사원명</td>
     <td>주번</td>
     </tr>
     
     <%for(EmpDto dto : list ){ %>
     <tr>
     <td><%=dto.getEmp_id() %></td>
     <td><%=dto.getEmp_name() %></td>
     <td><%=dto.getEmp_no() %></td>
     </tr>
<%} %>


</table>

</body>
</html>