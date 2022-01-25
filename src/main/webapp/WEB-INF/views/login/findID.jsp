<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AfterCamp</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/login/findID.css">
</head>
<body>
<div class="findIdBody">
	<div class="logo">
		<div>
			<a href="${cpath }/login/home"><img src="${cpath }/resources/img/logo.png"></a>
		</div>
	</div>
	<form method="POST">
		<div>
			<div class="findIdform">
				<div>
					<input class="phone" type="text" name="phone" placeholder="휴대폰번호">
				</div>
				<div class="authNum hidden">
					<input class="authNumInput" type="text" name="phone" placeholder="인증번호">
				</div>
			</div>
		</div>
		<div>
			<div class="findIdButton">
				<input type="submit" value="인증하기">
			</div>
		</div>
	</form>
</div>
<script>
	const cpath = '${pageContext.request.contextPath}'

	const authNum = document.querySelector('.authNum')
	const authNumInput = document.querySelector('.authNumInput')
	
</script>
</body>
</html>