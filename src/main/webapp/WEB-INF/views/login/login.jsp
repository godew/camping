<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/login/login.css">
</head>
<body>
<div class="loginBody">
	<div class="logo">
		<div>
			<img src="${cpath }/resources/img/logo.png">
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
	<div>
		<div class="loginForm">
			<div>
				<input type="email" placeholder="아이디">
			</div>
			<div>
				<input type="password" placeholder="패스워드">
			</div>
		</div>
	</div>
	<div>
		<div class="loginButton">
			<input type="submit" value="로그인">
		</div>
	</div>
	<div>
		<div>
			<ul class="join">
				<li><a href="">아이디 찾기</a></li>
				<li><a href="">비밀번호 찾기</a></li>
				<li><a href="${cpath }/login/terms">회원가입</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>