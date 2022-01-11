<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>After Camping</title>
<link href="${cpath }/resources/css/payment/style.css" rel="stylesheet">
<link href="${cpath }/resources/css/payment/pay.css" rel="stylesheet">
<link href="${cpath }/resources/css/header.css" rel="stylesheet"> 
</head>
<body>
<script>
	const cpath = '${cpath }'
</script>
<header>
	<div class="content">
		<a href="${cpath }">여기어때</a>
		<ul>
			<li><img src="${cpath }/resources/img/돋보기.png"></li>
			<li><a href="">예약내역</a></li>
			<li class="li_seemore">더보기</li>
			<li><a href="">로그인</a></li>
		</ul>
	</div>
</header>
<div class="hidden header_seemore">
	<ul>
		<li><a href="">공지사항</a></li>
		<li><a href="">약관 및 정책</a></li>
	</ul>
</div>
<script>
	const seeMore = document.querySelector('header .li_seemore')
	headerSeemore = document.querySelector('.header_seemore')
	seeMore.onmouseover = function() {
		headerSeemore.classList.remove('hidden')
	}
	seeMore.onmouseout = function() {
		headerSeemore.classList.add('hidden')
	}
	headerSeemore.onmouseover = function() {
		headerSeemore.classList.remove('hidden')
	}
	headerSeemore.onmouseout = function() {
		headerSeemore.classList.add('hidden')
	}
</script>

