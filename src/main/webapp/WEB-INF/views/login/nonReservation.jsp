<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AfterCamp</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/nonReservation.css">
</head>
<body>
<div class="loginBody">
	<div class="logo">
		<div>
			<a href="${cpath }/login/home"><img src="${cpath }/resources/img/logo.png"></a>
		</div>
	</div>
	<div class="title">비회원 예약 내역 조회</div>
	<form method="POST">
		<div>
			<div class="lookupForm">
				<div>
					<input class="pnum" type="email" name="phone" placeholder="휴대폰번호" autofocus required>
				</div>
				<div>
					<input type="text" name="tid" placeholder="에약번호" required>
				</div>
			</div>
		</div>
		<div>
			<div class="lookupButton">
				<input type="submit" value="조회하기">
			</div>
		</div>
	</form>
</div>

</body>
</html>