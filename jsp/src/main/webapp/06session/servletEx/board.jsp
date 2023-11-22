<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload = function() {
	console.log('onload event ==========')
	let logoutBtn = document.querySelector("#logoutBtn")
	let loginBtn = document.querySelector("#loginBtn")
	if(logoutBtn !=null){
		logoutBtn.onclick = function () {
			
		//로그아웃
		loginForm.action="/logout";
		loginForm.submit();
		}
	}
	if(loginBtn !=null){
		loginBtn.addEventListener('click',function(){
			
			// 로그인페이지 이동.
		loginForm.action="/06session/servletEx/loginForm.jsp";
		loginForm.submit();
			
		});
		
	}
	
	// selec 요소 옵션 선택
	
	var searchField = '${pageDto.cri.searchField}';
	console.log("searchField : ", searchField);
	
	for(var i = 0; i <searchForm.searchField.options.length; i++) {
	  console.log(searchForm.searchField.options[i].value);

	  if(searchForm.searchField.options[i].value == searchField){
		  searchForm.searchField.options[i].setAttribute("selected", "selected");
	  }
	}
	
}

// 함수는 onload 함수 외부에 작성.
function goPage(pageNo) {
	searchForm.pageNo.value= pageNo;
	searchForm.submit();
	
	
}
/*
 * 상세 페이지로 이동
 /boardRead?num=${dto.num}&pageNo=${pageDto.cri.pageNo}&searchWord=${pageDto.cri.searchWord}&searchField=${pageDto.cri.searchField}">${dto.title }
 */
 
 
 
 
function goDetail(pageNo) {
	
 	searchForm.action= '/boardRead';
 	searchForm.num.value=num;
	searchForm.submit();
	
	
/*
 * 
 */
 function formSubmit() {
	// 폼을 선택- 폼의 이름을 불러 줌.
	// 폼의 요소를 선택 - 폼.요소 이름
	searchForm.pageNo.value = '페이지 번호'
	//form.action = '';
	// 3. 폼 전송하기 - form의 action 속성에 정의된 url을 요청
	//            - 폼안에 요소들을 파라메터로 전달
	searchForm.submit();
	}
}
	
	
	
	


</script>
<!--  submit : form의 요소들을 파라메터로 가지고 서버에 요청 
      action : 서버에 요청할 url  주소
       method : 요청 방식
                 get: 조회용 파라메터
                 post: 등록, 수정용 파라메터
       * 버튼을 생성했더라도 form안에 버튼이 하나밖에 없다면 해당버튼은 서브밋 버튼이 된다.          
       
       -->
       <%@ include file="header.jsp" %>
       
<h2>게시글 목록</h2>
<table width="90%" align="center">
<tr>
<td>
 
<!-- 검색폼 
pageDto : ${pageDto }
<br>cri  : ${pageDto.cri }
<br>pageNo  : ${pageDto.cri.pageNo }
<br>searchField  : ${pageDto.cri.searchField }
<br>searchWord  : ${pageDto.cri.searchWord }
 -->

<form name="searchForm">
pageNo : <input type="text" name="pageNo" value="${pageDto.cri.pageNo }">
<div class="input-group">
<select class="form-select" name="searchField" id="inputGroupSelect04" aria-label="Example select with button addon">

<option value="title" ${pageDto.cri.searchField eq 'title' ? 'selected' : '' }>제목</option>
<option value="id" >작성자</option>
<option value="content">내용</option>
</select>
<input type="text" name="searchWord" value="${pageDto.cri.pageNo }" class="form-control" aria-label="Text input with dropdown button">
<button class="btn btn-outline-secondary" type="submit">입력</button>


</div>
</form>

     <hr>
<table border="1" class="table">
    <tr>
        <th>일련번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
     </tr>
     <!-- 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다 출력 -->
     <!-- 만약에 리스트의 사이즈 0이 아니라면 목록출력 -->
     <c:if test="${empty list }" var="result">
     <tr><td colspan="6">조회된 데이터 없다</td></tr>
     </c:if>
     <c:forEach items="${list }" var="dto">
         <tr>
	         <td>${dto.num }</td>
	         <td><a onclick="goDetail${dto.num})">${dto.title }</a></td>
	         <td>${dto.content }</td>
	         <td>${dto.id }</td>
	         <td>${dto.postdate }</td>
	         <td>${dto.visitcount }</td>
         </tr>
     </c:forEach>
        

</table>
     </td>       
    </tr>   
</table>
<!--  pageNavi include -->
<%@include file="PageNavi.jsp" %>



</body>
</html>
