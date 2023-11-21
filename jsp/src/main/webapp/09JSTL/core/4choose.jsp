<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
   window.onload = function(){
	   validateForm('str');
	   submitBtn.addEventListener('click', function(){
		   console.log('event', event);
		   console.log('==================================');
		   // 기본이벤트를 제거하는 함수
		   event.preventDefault();
		  console.log('점수가 그게 맞니');
		 console.log(testForm.kor.value == ''){
			 alert('그게맞아?');
			 testForm.kor.focus();
		 }
		   // 유효성 검사
		   let res = validateForm(testForm);
		   if(res) {
			   // 폼전송
			   testForm.submit();
		   }
		  
	   });
   }
   // 유효성 검사 validation chech
   // form 요소를 매개변수로 받아서
   // form이 가지고 있는 요소의 값을 체크
   // 함수 정의
   // function 함수이름 (매개변수) {  
   //                            }
   
   
   function validateForm(form) {
	   if(testForm.kor.value ==''){
		   alert('국어점수')
		   form.kor.focus();
		   return false;
	   }
	   function validateForm() {
		   if(testForm.eng.value ==''){
			   alert('영여점수')
			   form.eng.focus();
			   return false;
			   
	   
   }
		   function validateForm() {
			   if(testForm.math.value ==''){
				   alert('수학점수')
				   form.math.focus();
				   return false;
			   }
</script>


</head>
<body>
<h2>다중 조건문</h2>

<p>홀짝 판단하기</p>
<!-- 변수선언 -->
<c:set var="num" value="101"/>

<!-- 다중 조건문 사용 -->
<c:choose>

 <c:when test="${num mod 2 eq 0}">
  num(${num })은 짝수이다.
 </c:when>
 
 <c:otherwise>
 num(${num })은 홀수이다.
 </c:otherwise>
 
</c:choose>


   
<!-- 동일한 페이지가 다시 요청되어 form태그 안에 요소를 출력 -->
<form name="testForm">
이름 : <input type="text" name="name" value="me"><br>


국어 : <input type="text" name="kor"  /><br>
영어 : <input type="text" name="eng"/><br>
수학 : <input type="text" name="math"/><br>
 <button id="submitBtn">전송</button>
</form>
<!--  국어 영어 수학 점수가 모두 입력 되었을때만 출력 -->
<c:if test="${ not (empty param.kor 
                or empty param.eng
                  or empty param.math)}">

<h2>입력 받은 값</h2>
이름 : ${param.name} <br>
국어 : ${param.kor } <br>
영어 : ${param.eng } <br>
수학 : ${param.math } <br>
점수 합 : ${param.kor + param.eng + param.math }<br>
평균 : ${(param.kor + param.eng + param.math )/ 3 }

<!--  변수로 저장 후 사용 -->
<c:set var="avg" value="${(param.kor + param.eng + param.math )/ 3 }"/>
<p>평균 : ${avg }</p>

<h2>국 영 수 점수를 입력하면 평균을 내어 학점을 출력</h2>
<p> >=90 : A학점, >=80 : B학점, >=70 : C학점, >=60 : D학점</p>

<p>${param.name }</p> 님의 학점은
<c:choose>
<c:when test="${avg >=90 }">A학점</c:when>
<c:when test="${avg >=80 }">B학점</c:when>
<c:when test="${avg >=70 }">C학점</c:when>
<c:when test="${avg >=60 }">D학점</c:when>

<c:otherwise>FFFFFFFF</c:otherwise>
</c:choose>
입니다~

</c:if>

<form name="testForm1">
국어 : <input type="text" name="kor" value="100" /><br>
영어 : <input type="text" name="eng" value="100"/><br>
수학 : <input type="text" name="math" value="100" /><br>
    <button onClick="return validateForm(testForm1);">전송</button>

</form>

<form name="testForm2" onsubmit="return validateForm(testForm2);">
국어 : <input type="text" name="kor" value="0" /><br>
영어 : <input type="text" name="eng" value="0"/><br>
수학 : <input type="text" name="math" value="0" /><br>
    <button>전송</button>

</form>


















</body>
</html>