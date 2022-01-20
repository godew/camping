<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AfterCamp</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/main/main.css">
</head>
<body>
<div class="logoBox">
	<div class="mainTop">
		<div class="mainTopButton">
			<ul>
				<li><a href="${cpath }/login/login">로그인</a></li>
				<li><a href="${cpath }/join/terms">회원가입</a></li>
			</ul>
		</div>
	</div>
		<div class="logo">
		<a href=""><img src="${cpath }/resources/img/logo2.png"></a>
	</div>
</div>
<div class="main">
	<div class="mainMenu">
		<ul>
			<li><a href="">더보기</a></li>
			<li><a href="">예약정보</a></li>
		</ul>
	</div>
</div>
<div class="mainBack">
	<div class="mainSearch">
		<ul class="mainSearchMenu">
			<li class="advancedSearch"><a href="">상세검색</a></li>
			<li class="tagSearch"><a href="">태그로 검색</a></li>
		</ul>
	</div>
	<div>
		<img src="${cpath }/resources/img/mainBack.png">
	</div>
</div>
<div class="mainMid">
	<div class="mainMidBox">
	</div>
</div>
<div class="footer">
	<div class="footerTop">
		<img src="${cpath }/resources/img/footerTop.png">
	</div>
</div>
<div class="footerText">
	<div>
		<img src="${cpath }/resources/img/logo.png">
	</div>
</div>
<div class="TextAll">
	<div class="footerTextAll">
		<div class="footerName">
			<ul>
				<li><a href="">김유성</a></li>
				<li><a href="">신은욱</a></li>
				<li><a href="">조경민</a></li>
				<li><a href="">윤다영</a></li>
				<li><a href="">박진영</a></li>
				<li><a href="">${login.email }</a></li>				
			</ul>
		</div>
	</div>
</div>
<div class="footerEnd">
	<div class="footerEnd2">
		Copyrightⓒ 2022.AfterCamping.Allright reserved.
	</div>
</div>
</body>
</html>