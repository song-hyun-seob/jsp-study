<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  부트 스트랩 -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<%
PageDto pageDto = null;
// Controller에서 request 영역에 저장한 pageDto를 화면에서 사용 할 수 있도록 변수에 저장.
if(request.getAttribute("pageDto") !=null
 &&!"".equals(request.getAttribute("pageDto"))) {
	  pageDto =   (PageDto)request.getAttribute("pageDto");
 }else {
	  pageDto =new PageDto(0,new Criteria());
 }

%>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


 

<!-- 페이지네이션  -->
<nav aria-label="...">
  <ul class="pagination">
  <!-- 앞으로가기  버튼 시작 disabled : 비활. -->
    <li class="page-item <%=pageDto.isPrev() ? "" : "disabled"%>">
      <a class="page-link" href="/boardList?pageNo=<%=pageDto.getStartNo()-1%>">Previous</a>
    </li>
    
    
    <!-- 앞으로가기 버튼 끝 -->
    
    <% for(int i=pageDto.getStartNo(); i<=pageDto.getEndNo(); i++) {%>	
    	<li class="page-item">
    <a class="page-link <%= pageDto.getCri().getPageNo() == i ? "active" : "" %>" href="/boardList?pageNo=<%=i%>">
    <%=i %></a>
    </li>
    <%} %>
    
    
    <!--  active : 헨재 페이지 활성화 
    <li class="page-item " aria-current="page">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    -->
    
    
    
    
    <!--  뒤로가기 버튼 시작 -->
    <li class="page-item <%=pageDto.isNext() ? "" : "disabled"%>">
      <a class="page-link" href="/boardList?pageNo=<%=pageDto.getCri().getEndNum()+1%>">Next</a>
    </li>
    <!--  뒤로가기 버튼 끝 -->
  </ul>
</nav>

<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </body>
</body>
</html>