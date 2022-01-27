<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AfterCamp</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/login/login.css">
</head>
<body>
<div class="loginBody">
	<div class="logo">
		<div>
			<a href="${cpath }/login/home"><img src="${cpath }/resources/img/logo.png"></a>
		</div>
	</div>
	<div class="main">
		<div class="loginBox">
			<div class="kakaoLogin">
				<a href="">카카오로 로그인</a>
			</div>
			<div class="naverLogin">
				<a href="">네이버로 로그인</a>
			</div>
		</div>
	</div>
	<div class="or">
		<div class="orLine">또는</div>
	</div>
	<form method="POST">
		<input type="hidden" name="url" value="${url }" placeholder="아이디">
		<div>
			<div class="loginForm">
				<div>
					<input class="email" type="email" name="email" placeholder="아이디">
				</div>
				<div>
					<input type="password" name="memberPW" placeholder="패스워드">
				</div>
			</div>
		</div>
		<div>
			<div class="loginButton">
				<input type="submit" value="로그인">
			</div>
		</div>
	</form>
	<c:if test="${empty param.returnURI }">
		<div>
			<div>
				<ul class="join">
					<li><a href="${cpath }/findID">아이디 찾기</a></li>
					<li><a href="${cpath }/findPassword">비밀번호 찾기</a></li>
					<li><a href="${cpath }/join/terms">회원가입</a></li>
				</ul>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty param.returnURI }">
		<div>
			<div>
				<ul class="join_notLogin">
					<li><a href="${cpath }/login/nonReservation">비회원 예약 내역 조회</a></li>
				</ul>
			</div>
		</div>
	</c:if>
</div>

</body>
</html>