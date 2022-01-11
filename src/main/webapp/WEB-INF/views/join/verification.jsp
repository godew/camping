<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AfterCamp</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/join/verification.css">
</head>
<body>
<div class="verificationBody">
	<div class="title">
		휴대폰 본인 확인
	</div>
	<div>
		원활한 서비스 제공을 위해, 휴대폰 번호를 입력해주세요.
	</div>
	<div>
		휴대폰 번호
	</div>
	<div>
		<input class="phonInput" type="text" onkeyup='checkPnum()' name="pnum" placeholder="휴대폰번호">
		<button class="btn">인증번호 전송</button>
	</div>
</div>
<script>
	function checkPnum() {
		const flag = pnum.value
		console.log(flag.length)
		if(flag.length == 9) {
			btn.classList.add('on')
		}
		else {
			btn.classList.remove('on')
		}
	}
	const pnum = document.querySelector('input[name="pnum"]')
	const btn = document.querySelector('.btn')
</script>
</body>
</html>