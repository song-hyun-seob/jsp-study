<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style> 
<title>Insert title here</title>
</head>

<body>
<h2>쿠키를 이용한 팝업창 제어 ver 1.0</h2>
<script >
// 윈도우 객체의 onload 이벤트 발생 실행
// html요소가 생성된  실행
window.onload = function() {

	//팝업클로즈 쿠키가 있는지 값이 'Y'이면, 팝업창을 화면에서 숨김처리
	<% 
	String popupClose =  CookieManager.readCookie(request,"popupClose");
	if("Y".equals(popupClose)) {
		%>
		//// 요스를 선택후 숨김 처리.
		document.querySelector('#popup').style.display='none';
		<%
	//}
	//%>
	console.log('popupClose == Y');
	popup.style.display = 'none';
	
	
	closeBtn.onclick = function() {
		if(document.querySelector('#inactiveToday').checked==true){
			
		console.log('체크박스 선택');
		// 서버에 요청방법
		// 1. <a href= 주소 >  // 1.href : queyString을 이용해 파라메터 전달.
		// 2. from submit : form안에 요소들을 가지고 이동.
		popupForm.submit();
		
	}
		console.log('체크박스 선택안됨');
		// display 속을 none으로 설정 하면 화면에서 숨김처리.
	    popup.style.display = 'none';
	    
	}
	
}

</script>
<!-- 
  1. 닫기버튼을 클릭하면 cookiepopupAction.jsp 파일 호출
     - 팝업닫힘 쿠키를생성
  2. 팝업닫힘쿠키가 생성이 되어 있다면, 더이상 팝업창을 보여주지 않도록 처리

 -->
 <form action="cookiePopupAction.jsp" name="popupForm">
 <%
	String popupClose =  CookieManager.readCookie(request,"popupClose");
	//popupclose 의 값이 y가 아니면 팝업을 보여줘.
 if(!"Y".equals(popupClose)) {
		%>
 
 
<div id="popup" >
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	        
	            <input type="checkbox" id="inactiveToday" name="inactiveToday" value="1" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
	       
        </div>
    </div> 
    
</form>
</body>
</html>